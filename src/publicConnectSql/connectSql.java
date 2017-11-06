package publicConnectSql;

import java.sql.*;

public class connectSql {
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	//启动连接数据库方法
	public void StartCon(){
		String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(uri,user,password);
			//System.out.println("Connection Successful!"); 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//1.执行登录判断连接数据库操作语句
	public boolean loginQuery(String sql){
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next()) {
				return true;//证明操作有结果，返回true
		} else {
			return false;//证明操作没结果，返回false
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return false;//默认返回false，证明数据库查询失败，没有结果
	}
	
	//2.操作数据库，执行语句，返回指定查询的数据，单行数组数据为主,
	public String  execQuery(String sql){
		String  result=null;
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next()) {
				result=rs.getString(1);
			}else {
				result=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return result;
	}
}
