package admin.bean.course;

public class CourseInfo {

	int couNum,teaNum,couTerm,couCredit;
	String couName,couFrom,couTime,couPlace,couRemarks;
	public int getCouNum() {
		return couNum;
	}
	public void setCouNum(int couNum) {
		this.couNum = couNum;
	}
	public int getTeaNum() {
		return teaNum;
	}
	public void setTeaNum(int teaNum) {
		this.teaNum = teaNum;
	}
	public int getCouTerm() {
		return couTerm;
	}
	public void setCouTerm(int couTerm) {
		this.couTerm = couTerm;
	}
	public int getCouCredit() {
		return couCredit;
	}
	public void setCouCredit(int couCredit) {
		this.couCredit = couCredit;
	}
	public String getCouName() {
		return couName;
	}
	public void setCouName(String couName) {
		this.couName = couName;
	}
	public String getCouFrom() {
		return couFrom;
	}
	public void setCouFrom(String couFrom) {
		this.couFrom = couFrom;
	}
	public String getCouTime() {
		return couTime;
	}
	public void setCouTime(String couTime) {
		this.couTime = couTime;
	}
	public String getCouPlace() {
		return couPlace;
	}
	public void setCouPlace(String couPlace) {
		this.couPlace = couPlace;
	}
	public String getCouRemarks() {
		return couRemarks;
	}
	public void setCouRemarks(String couRemarks) {
		if(couRemarks==null)
			couRemarks="";
		this.couRemarks = couRemarks;
	}
	
}
