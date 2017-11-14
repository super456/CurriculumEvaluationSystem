package student.bean;
//用于存储学生个人信息类
public class PersonalInfo {

	int stuNum;//存储学生学号信息，但不能修改
	String stuName=null;//存储学生姓名信息
	String stuSex=null;//存储学生性别
	int stuGrade;//存储学生年级
	String stuFrom=null;//存储学生院系专业及班级
	int stuPhone;//存储学生联系方式
	String stuRemarks=null;//存储学生个人信息备注
	
	public int getStuNum() {
		return stuNum;
	}
	public void setStuNum(int sutNum) {
		this.stuNum = sutNum;
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
	public int getStuGrade() {
		return stuGrade;
	}
	public void setStuGrade(int stuGrade) {
		this.stuGrade = stuGrade;
	}
	public String getStuFrom() {
		return stuFrom;
	}
	public void setStuFrom(String stuFrom) {
		this.stuFrom = stuFrom;
	}
	public int getStuPhone() {
		return stuPhone;
	}
	public void setStuPhone(int stuPhone) {
		this.stuPhone = stuPhone;
	}
	public String getStuRemarks() {
		return stuRemarks;
	}
	public void setStuRemarks(String stuRemarkString) {
		this.stuRemarks = stuRemarkString;
	}
	
	
	
}
