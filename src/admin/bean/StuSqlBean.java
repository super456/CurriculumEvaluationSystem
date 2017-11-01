package admin.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StuSqlBean {

	Connection con;
	PreparedStatement pre;
	ResultSet rs;
	
	public StuSqlBean(){
		String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(uri,user,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public List showAllStu(String sql){
		List list = new ArrayList();
		
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()){
				StuInfo been = new StuInfo();
				been.setStuNum(rs.getInt(1));
				been.setStuName(rs.getString(2));
				been.setStuSex(rs.getString(3));
				been.setStuGrade(rs.getInt(4));
				been.setStuForm(rs.getString(5));
				been.setStuPhone(rs.getInt(6));
				been.setStuRemarks(rs.getString(7));
				list.add(been);
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
	
}
