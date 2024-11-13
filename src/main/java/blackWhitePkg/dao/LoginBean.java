package blackWhitePkg.dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginBean {

	private String uidReal = "sample";
	private String upwReal = "123";
	private String uId;
	private String uPw;
	
	public void setuId(String uId) {
		this.uId = uId;
	}
	
	public String getuId() {
		return uId;
	}
	
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	
	public String setuPw() {
		return uPw;
	}
	
	public boolean chkAccount(HttpSession session, HttpServletRequest req) {
		boolean passChk = false;
		if(uId.equals(uidReal) && uPw.equals(upwReal)) {
			passChk = true;
			String uId = req.getParameter("uId");
			session.setAttribute("sid", uId);
			session.setMaxInactiveInterval(30);
		}
		return passChk;
	}
	
}
