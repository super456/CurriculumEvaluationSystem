package teacher.bean;

public class TeaPraiseListInfo {

	int teaPraiseListNum,couNum,teaNum,couTerm;
	String couName,teaName,couFrom;
	public String getCouFrom() {
		return couFrom;
	}
	public void setCouFrom(String couFrom) {
		this.couFrom = couFrom;
	}
	public String getTeaName() {
		return teaName;
	}
	public void setTeaName(String teaName) {
		this.teaName = teaName;
	}
	float theAllAvgScore;
	public int getTeaPraiseListNum() {
		return teaPraiseListNum;
	}
	public void setTeaPraiseListNum(int teaPraiseListNum) {
		this.teaPraiseListNum = teaPraiseListNum;
	}
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
	public String getCouName() {
		return couName;
	}
	public void setCouName(String couName) {
		this.couName = couName;
	}
	public float getTheAllAvgScore() {
		return theAllAvgScore;
	}
	public void setTheAllAvgScore(float theAllAvgScore) {
		this.theAllAvgScore = theAllAvgScore;
	}
}
