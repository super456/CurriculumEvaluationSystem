package admin.bean.admin;

public class AdminInfo {

	int adminNum,adminPhone,adminLimit;
	String adminName,adminRemarks;
	public int getAdminNum() {
		return adminNum;
	}
	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}
	public int getAdminPhone() {
		return adminPhone;
	}
	public void setAdminPhone(int adminPhone) {
		this.adminPhone = adminPhone;
	}
	public int getAdminLimit() {
		return adminLimit;
	}
	public void setAdminLimit(int adminLimit) {
		this.adminLimit = adminLimit;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminRemarks() {
		return adminRemarks;
	}
	public void setAdminRemarks(String adminRemarks) {
		if(adminRemarks == null)
			adminRemarks="";
		this.adminRemarks = adminRemarks;
	}
}
