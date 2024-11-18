package blackWhitePkg.dto;

public class MemberBean {
    private String uId;
    private String uPw;
    private String uName;
    private String uEmail;
    private String gender;
    private String uBirth;
    private String uZipcode;
    private String uAddr;
    private String[] uFood;
    private String uJob;
    
    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
    }

    public String getuPw() {
        return uPw;
    }

    public void setuPw(String uPw) {
        this.uPw = uPw;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getuBirth() {
        return uBirth;
    }

    public void setuBirth(String uBirth) {
        this.uBirth = uBirth;
    }

    public String getuZipcode() {
        return uZipcode;
    }

    public void setuZipcode(String uZipcode) {
        this.uZipcode = uZipcode;
    }

    public String getuAddr() {
        return uAddr;
    }

    public void setuAddr(String uAddr) {
        this.uAddr = uAddr;
    }
    
    public String[] getuFood() {
        return uFood;
    }

    public void setuFood(String[] uFood) {
        this.uFood = uFood;
    }

    public String getuJob() {
        return uJob;
    }

    public void setuJob(String uJob) {
        this.uJob = uJob;
    }    
}