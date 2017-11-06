package admin.bean;

import java.util.Date;

public class CommentCouInfo {

	int comCouNum,couNum,stuNum;
	Date comDate;
	int comFirstScore,comSecondScore,comThirdScore,comFourthScore,comFifthScore;
	int comSixthScore,comSeventhScore,comEighthScore,comNinthScore,comTenthScore,comTotalScore;
	String comLeaMsg;
	float comAvgScore;
	public int getComCouNum() {
		return comCouNum;
	}
	public void setComCouNum(int comCouNum) {
		this.comCouNum = comCouNum;
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
	public Date getComDate() {
		return comDate;
	}
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}
	public int getComFirstScore() {
		return comFirstScore;
	}
	public void setComFirstScore(int comFirstScore) {
		this.comFirstScore = comFirstScore;
	}
	public int getComSecondScore() {
		return comSecondScore;
	}
	public void setComSecondScore(int comSecondScore) {
		this.comSecondScore = comSecondScore;
	}
	public int getComThirdScore() {
		return comThirdScore;
	}
	public void setComThirdScore(int comThirdScore) {
		this.comThirdScore = comThirdScore;
	}
	public int getComFourthScore() {
		return comFourthScore;
	}
	public void setComFourthScore(int comFourthScore) {
		this.comFourthScore = comFourthScore;
	}
	public int getComFifthScore() {
		return comFifthScore;
	}
	public void setComFifthScore(int comFifthScore) {
		this.comFifthScore = comFifthScore;
	}
	public int getComSixthScore() {
		return comSixthScore;
	}
	public void setComSixthScore(int comSixthScore) {
		this.comSixthScore = comSixthScore;
	}
	public int getComSeventhScore() {
		return comSeventhScore;
	}
	public void setComSeventhScore(int comSeventhScore) {
		this.comSeventhScore = comSeventhScore;
	}
	public int getComEighthScore() {
		return comEighthScore;
	}
	public void setComEighthScore(int comEighthScore) {
		this.comEighthScore = comEighthScore;
	}
	public int getComNinthScore() {
		return comNinthScore;
	}
	public void setComNinthScore(int comNinthScore) {
		this.comNinthScore = comNinthScore;
	}
	public int getComTenthScore() {
		return comTenthScore;
	}
	public void setComTenthScore(int comTenthScore) {
		this.comTenthScore = comTenthScore;
	}
	public int getComTotalScore() {
		return comTotalScore;
	}
	public void setComTotalScore(int comTotalScore) {
		this.comTotalScore = comTotalScore;
	}
	public String getComLeaMsg() {
		return comLeaMsg;
	}
	public void setComLeaMsg(String comLeaMsg) {
		if(comLeaMsg == null)
			comLeaMsg="";
		this.comLeaMsg = comLeaMsg;
	}
	public float getComAvgScore() {
		return comAvgScore;
	}
	public void setComAvgScore(float comAvgScore) {
		this.comAvgScore = comAvgScore;
	}
}
