package admin.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeBarSqlBean {

	Connection con;
	PreparedStatement pre;
	ResultSet rs;
	
	public NoticeBarSqlBean(){
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
	
	public List showAllNoticeBar(String sql){
		List list = new ArrayList();
		
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()){
				NoticeBarInfo bean = new NoticeBarInfo();
				bean.setNoticeBarInfoNum(rs.getInt(1));
				bean.setTitle(rs.getString(2));
				bean.setReleaseTime(rs.getDate(3));
				bean.setAuthor(rs.getString(4));
				bean.setContent(rs.getString(5));
				bean.setNoticeBarInfoLimit(rs.getInt(6)); 
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
