package blackWhitePkg.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import blackWhitePkg.dbcp.DBCP;
import blackWhitePkg.dto.MemberBean;
import blackWhitePkg.dto.ZipcodeBean;

public class MemberMgr {
    Connection conn = null;
    Statement stmt = null;
    ResultSet objRS = null;
    PreparedStatement pstmt = null;
    DBCP dbcp = null;

    /* 아이디 중복 검사 시작 */
    public boolean checkId(String id) {
        boolean res = false; // 임시 초기화, ID 사용 가능여부를 판별하는 변수

        try {
            conn = dbcp.mtdConn();
            String sql = "select count(*) from userList where uId = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            objRS = pstmt.executeQuery();
            if (objRS.next()) {
                int recordCnt = objRS.getInt(1);
                if (recordCnt == 1)
                    res = true;
            }
        } catch (Exception e) {
            System.out.print("오류발생  :   " + e.getMessage());
        } finally {
            try {
                conn.close();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        }
        return res;
    }
    /* 아이디 중복 검사 끝 */
    
    
    /* 우편번호 찾기 시작 */
    public List<ZipcodeBean> zipcodeRead(String area3) {
        List<ZipcodeBean> objList = new Vector<>();
        try {
            conn = dbcp.mtdConn();
            String sql = "select zipcode, area1, area2, area3, area4 ";
            sql += "from zipList where area3 like?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + area3 + "%");
            objRS = pstmt.executeQuery();
            while (objRS.next()) {
                ZipcodeBean zipBean = new ZipcodeBean();
                zipBean.setZipcode(objRS.getString(1));
                zipBean.setArea1(objRS.getString(2));
                zipBean.setArea2(objRS.getString(3));
                zipBean.setArea3(objRS.getString(4));
                zipBean.setArea4(objRS.getString(5));
                objList.add(zipBean);
            }
        } catch (Exception e) {
            System.out.print("오류발생  :   " + e.getMessage());
        } finally {
            try {
                conn.close();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        }
        return objList;
    }
    /* 우편번호 찾기 끝 */

    /* 회원가입 시작  */
    public boolean insertMember(MemberBean bean) {
        boolean flag = false;
        try {
            conn = dbcp.mtdConn();
            String sql = "insert into userList (";
            sql += "uId, uPw, uName, uEmail, gender, uBirth, ";
            sql += "uZipcode, uAddr, uFood, uJob, joinTM) values (";
            sql += "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now()";
            sql += ")";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bean.getuId());
            pstmt.setString(2, bean.getuPw());
            pstmt.setString(3, bean.getuName());
            pstmt.setString(4, bean.getuEmail());
            pstmt.setString(5, bean.getGender());
            pstmt.setString(6, bean.getuBirth());
            pstmt.setString(7, bean.getuZipcode());
            pstmt.setString(8, bean.getuAddr());
            String[] food = bean.getuFood();
            String[] foodName = { "한식", "중식", "일식", "양식" };
            char[] foodCode = { '0', '0', '0', '0' };
            for (int i = 0; i < food.length; i++) {
                for (int j = 0; j < foodName.length; j++) {
                    if (food[i].equals(foodName[j])) { // i : 1, j : 2
                        foodCode[j] = '1';
                    }
                }
            }
            pstmt.setString(9, new String(foodCode));
            pstmt.setString(10, bean.getuJob());
            
            int rowCnt = pstmt.executeUpdate();
            if (rowCnt == 1)
                flag = true;
        } catch (Exception e) {
            System.out.print("오류발생  :   " + e.getMessage());
        } finally {
            try {
                conn.close();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        }
        return flag;
    }
    /* 회원가입 끝 */

    /* 로그인 처리 시작 */
    public boolean loginMember(String id, String pw) {
        boolean loginChkTF = false;
        try {
            conn = dbcp.mtdConn();
            String sql = "select count(*) from userList where uId = ? and uPw = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            objRS = pstmt.executeQuery();
            if (objRS.next()) {
                int recordCnt = objRS.getInt(1);
                if (recordCnt == 1) loginChkTF = true;
            }
        } catch (Exception e) {
            System.out.print("오류발생  :   " + e.getMessage());
        } finally {
            try {
                conn.close();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        }
        return loginChkTF;
    }
    /* 로그인 처리 끝 */

    /* 회원정보 수정 시작 */
    public MemberBean modifyMember(String id) {
        MemberBean mBean = new MemberBean();

        try {
            conn = dbcp.mtdConn();
            String sql = "select uId, uPw, uName, uEmail, ";
            sql += "gender, uBirth, uZipcode, ";
            sql += "uAddr, uFood, uJob, joinTM ";
            sql += "from userList where uId = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            objRS = pstmt.executeQuery();
            if (objRS.next()) {
                mBean.setuId(objRS.getString("uId"));
                mBean.setuPw(objRS.getString("uPw"));
                mBean.setuName(objRS.getString("uName"));
                mBean.setuEmail(objRS.getString("uEmail"));
                mBean.setGender(objRS.getString("gender"));
                mBean.setuBirth(objRS.getString("uBirth"));
                mBean.setuZipcode(objRS.getString("uZipcode"));
                mBean.setuAddr(objRS.getString("uAddr"));
                String[] foodAry = new String[4];
                String food = objRS.getString("uFood");
//  "가나다AB"
                foodAry = food.split(""); // 인덱스0 "가" 인덱스1 "나"
//System.out.println("split 결과  :   "   +   Arrays.toString(hobbyAry));
                mBean.setuFood(foodAry);
                mBean.setuJob(objRS.getString("uJob"));
                System.out.println("이메일은1 : " + mBean.getuEmail());
                System.out.println("이메일은2 : " + objRS.getString("uEmail"));
            }
        } catch (Exception e) {
            System.out.print("오류발생  :   " + e.getMessage());
        } finally {
            try {
                conn.close();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        }
        return mBean;
    }

    /* 회원정보 수정 끝 */
    /* 로그인 사용자 이름 반환 시작 */
    public String getMemberName(String uId) {
        String uName = "";
        String sql = null;
        try {
            conn = dbcp.mtdConn();
            sql = "select uName from userList where uId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uId);
            objRS = pstmt.executeQuery();
            if (objRS.next()) {
                uName = objRS.getNString(1);
            }
        } catch (Exception e) {
            System.out.print("오류발생  :   " + e.getMessage());
        } finally {
            try {
                conn.close();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        }
        return uName;
    }
    /* 로그인 사용자 이름 반환 끝 */
    
    /* 조회 */
    public List<MemberBean> getMemSelect(String uId) {
        
        List<MemberBean> list = new ArrayList<>();
        MemberBean memberBean = null;
        String sql = null;
        
        try {
            conn = dbcp.mtdConn();
            sql = "select * from userList where uId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uId);
            objRS = pstmt.executeQuery();
            
            while(objRS.next()) {
                memberBean = new MemberBean();
                memberBean.setuId(objRS.getString("uId"));
                memberBean.setuPw(objRS.getString("uPw"));
                memberBean.setuName(objRS.getString("uName"));
                memberBean.setuEmail(objRS.getString("uEmail"));
                memberBean.setGender(objRS.getString("gender"));
                memberBean.setuBirth(objRS.getString("uBirth"));
                memberBean.setuZipcode(objRS.getString("uZipcode"));
                memberBean.setuAddr(objRS.getString("uAddr"));
                
                String[] foodAry = new String[4];
                String[] foodName = {"한식","중식","일식","양식"};
                String food = objRS.getString("uFood");
                foodAry = food.split("");
                for(int i=0; i < foodAry.length ; i++) {
                    if(foodAry[i].equals("1")) {
                        foodAry[i] = foodName[i];
                    }
                }
                memberBean.setuFood(foodAry);

                memberBean.setuJob(objRS.getString("uJob"));
                
                list.add(memberBean);
            }
        } catch (Exception e) {
            System.out.print("오류발생  :   " + e.getMessage());
        } finally {
            try {
                conn.close();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        }
        return list;
    }
    /* 조회 끝 */
}
