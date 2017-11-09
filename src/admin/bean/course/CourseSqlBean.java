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
	
	public CourseSqlBean(){
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
				bean.setCouName(rs.getString(3));
				bean.setCouTerm(rs.getInt(4));
				bean.setCouFrom(rs.getString(5));
				bean.setCouTime(rs.getString(6));
				bean.setCouPlace(rs.getString(7));
				bean.setCouCredit(rs.getInt(8));
				bean.setCouRemarks(rs.getString(9));
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
}
