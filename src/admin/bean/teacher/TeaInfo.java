package admin.bean.teacher;

import java.util.Date;
import java.util.List;

public class TeaInfo {

	int teaNum,teaPhone;
	String teaName,teaSex,teaForm,teaRemarks,limitMess;
	public String getLimitMess() {
		return limitMess;
	}
	public void setLimitMess(String limitMess) {
		this.limitMess = limitMess;
	}
	Date teaBirthday;
	List list;
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public int getTeaNum() {
		return teaNum;
	}
	public void setTeaNum(int teaNum) {
		this.teaNum = teaNum;
	}
	public int getTeaPhone() {
		return teaPhone;
	}
	public void setTeaPhone(int teaPhone) {
		this.teaPhone = teaPhone;
	}
	public String getTeaName() {
		return teaName;
	}
	public void setTeaName(String teaName) {
		this.teaName = teaName;
	}
	public String getTeaSex() {
		return teaSex;
	}
	public void setTeaSex(String teaSex) {
		this.teaSex = teaSex;
	}
	public String getTeaForm() {
		return teaForm;
	}
	public void setTeaForm(String teaForm) {
		if(teaForm==null)
			teaForm="";
		this.teaForm = teaForm;
	}
	public String getTeaRemarks() {
		return teaRemarks;
	}
	public void setTeaRemarks(String teaRemarks) {
		this.teaRemarks = teaRemarks;
	}
	public Date getTeaBirthday() {
		return teaBirthday;
	}
	public void setTeaBirthday(Date teaBirthday) {
		this.teaBirthday = teaBirthday;
	}
}
