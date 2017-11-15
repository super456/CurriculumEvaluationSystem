package teacher.bean;

public class ComLeaMsg {

	int couNum,comCouNum;
	String couName,couTime,leaMsg;
	
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
	public String getCouName() {
		return couName;
	}
	public void setCouName(String couName) {
		this.couName = couName;
	}
	public String getCouTime() {
		return couTime;
	}
	public void setCouTime(String couTime) {
		this.couTime = couTime;
	}
	public String getLeaMsg() {
		return leaMsg;
	}
	public void setLeaMsg(String leaMsg) {
		if(leaMsg == null)
			leaMsg = "";
		this.leaMsg = leaMsg;
	}
}
