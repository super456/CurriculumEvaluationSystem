package admin.bean.commentCourse;

public class CouClassStuInfo {

	int couClassStuInfoNum,couNum,stuNum,isTeach;
    String isTeachMess;
	public int getCouClassStuInfoNum() {
		return couClassStuInfoNum;
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
		if(isTeach == 0)
			isTeachMess = "否";
		else if(isTeach == 1)
			isTeachMess = "是";
		this.isTeach = isTeach;
	}

	public String getIsTeachMess() {
		return isTeachMess;
	}
}
