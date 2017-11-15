package teacher.bean;

public class CouClassStuInfo {
	int couClassStuInfoNum, couNum, stuNum, isTeach, couTerm;
	String isTeachMess, couName;

	public int getCouClassStuInfoNum() {
		return couClassStuInfoNum;
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

	public void setCouClassStuInfoNum(int couClassStuInfoNum) {
		this.couClassStuInfoNum = couClassStuInfoNum;
	}

	public int getCouNum() {
		return couNum;
	}

	public void setCouNum(int couNum) {
		this.couNum = couNum;
	}

	public int getStuNum() {
		return stuNum;
	}

	public void setStuNum(int stuNum) {
		this.stuNum = stuNum;
	}

	public int getIsTeach() {
		return isTeach;
	}

	public void setIsTeach(int isTeach) {
		if (isTeach == 0)
			isTeachMess = "否";
		else if (isTeach == 1)
			isTeachMess = "是";
		this.isTeach = isTeach;
	}

	public String getIsTeachMess() {
		return isTeachMess;
	}
}
