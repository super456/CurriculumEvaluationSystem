package teacher.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class TeaSql {

	Connection con;
	PreparedStatement pre;
	ResultSet rs;
	
	public TeaSql(){
		String url = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//获取教师信息
	public List showTeaInfo(String sql){
		List list = new ArrayList();
		TeaInfo bean;
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()){
				bean = new TeaInfo();
				bean.setTeaNum(rs.getInt(1));
				bean.setTeaName(rs.getString(2));
				bean.setTeaSex(rs.getString(3));
				bean.setTeaBirthday(rs.getDate(4));
				bean.setTeaForm(rs.getString(5));
				bean.setTeaPhone(rs.getInt(6));
				bean.setTeaRemarks(rs.getString(7));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				pre.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return list;
	}
	//获取用户密码
	public String searchUserPwd(String sql){
		String password = null;
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()){
				password = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				pre.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return password;
	}
}
