package admin.bean;

import java.util.List;

public class StuInfo {

	int stuNum, stuGrade, stuPhone;
	String stuName, stuSex, stuForm, stuRemarks, limitMess;
	public String getLimitMess() {
		return limitMess;
	}

	public void setLimitMess(String limitMess) {
		this.limitMess = limitMess;
	}

	List list;

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public int getStuNum() {
		return stuNum;
	}

	public void setStuNum(int stuNum) {
		this.stuNum = stuNum;
	}

	public int getStuGrade() {
		return stuGrade;
	}

	public void setStuGrade(int stuGrade) {
		this.stuGrade = stuGrade;
	}

	public int getStuPhone() {
		return stuPhone;
	}

	public void setStuPhone(int stuPhone) {
		this.stuPhone = stuPhone;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getStuSex() {
		return stuSex;
	}

	public void setStuSex(String stuSex) {
		this.stuSex = stuSex;
	}

	public String getStuForm() {
		return stuForm;
	}

	public void setStuForm(String stuForm) {
		this.stuForm = stuForm;
	}

	public String getStuRemarks() {
		return stuRemarks;
	}

	public void setStuRemarks(String stuRemarks) {
		if (stuRemarks == null)
			stuRemarks = "";
		this.stuRemarks = stuRemarks;
	}

}
