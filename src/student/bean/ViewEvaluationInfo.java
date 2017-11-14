package student.bean;

public class ViewEvaluationInfo {

	String couName=null;//课程名
	String teaName=null;//教师名
	String couTime=null;//课程上课时间
	String couPlace=null;//课程上课地点
	String couCredit=null;//课程学分
	int isTeach;//是否评教了
	
	public String getCouName() {
		return couName;
	}
	public void setCouName(String couName) {
		this.couName = couName;
	}
	public String getTeaName() {
		return teaName;
	}
	public void setTeaName(String teaName) {
		this.teaName = teaName;
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
	public String getCouCredit() {
		return couCredit;
	}
	public void setCouCredit(String couCredit) {
		this.couCredit = couCredit;
	}
	public int getIsTeach() {
		return isTeach;
	}
	public void setIsTeach(int isTeach) {
		this.isTeach = isTeach;
	}
	
	
}
