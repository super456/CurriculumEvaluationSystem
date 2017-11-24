package admin.bean.course;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseSqlBean {

	Connection con;
	PreparedStatement pre;
	ResultSet rs;
	
	public void startCon(){
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
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
	
	public List showAllCou(String sql){
		List list = new ArrayList();
		
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()){
				CourseInfo bean = new CourseInfo();
				bean.setCouNum(rs.getInt(1));
				bean.setTeaNum(rs.getInt(2));
				bean.setTeaName(rs.getString(3));
				bean.setCouName(rs.getString(4));
				bean.setCouTerm(rs.getInt(5));
				bean.setCouFrom(rs.getString(6));
				bean.setCouTime(rs.getString(7));
				bean.setCouPlace(rs.getString(8));
				bean.setCouCredit(rs.getInt(9));
				bean.setCouRemarks(rs.getString(10));
				list.add(bean);
			}
		} catch (Exception e) {
			//e.printStackTrace();
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
