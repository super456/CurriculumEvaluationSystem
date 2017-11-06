package loginCheck;

//本类用于存储登录界面用户输入并且通过js验证的信息
public class userInfo {
	int accountNum = 0;// 用户输入的账号
	String userPassword = null;// 用户输入的密码
	boolean isCheck = false;// 用于判断用户是否被限制登录，登录账号或密码是否输入正确，
	// 最后是否登录成功
	String userName = null;// 用于获取用户登录成功的用户名
	String loginIdentity=null;//用于存储登录身份，主页显示
	
	public String getLoginIdentity() {
		return loginIdentity;
	}
	public void setLoginIdentity(String loginIdentity) {
		this.loginIdentity = loginIdentity;
	}
	public int getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(int accountNum) {
		this.accountNum = accountNum;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public boolean isCheck() {
		return isCheck;
	}
	public void setCheck(boolean isCheck) {
		this.isCheck = isCheck;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	
}
