package admin.bean.commentContent;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComConSqlBean {

	Connection con;
	PreparedStatement pre;
	ResultSet rs;
	
	public ComConSqlBean(){
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
	
	public List showAllComCon(String sql){
		List list = new ArrayList();
		
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()){
				CommentContent bean = new CommentContent();
				bean.setComConNum(rs.getInt(1));
				bean.setTheFirstCon(rs.getString(2));
				bean.setTheSecondCon(rs.getString(3));
				bean.setTheThirdCon(rs.getString(4));
				bean.setTheFourthCon(rs.getString(5));
				bean.setTheFifthCon(rs.getString(6));
				bean.setTheSixthCon(rs.getString(7));
				bean.setTheSeventhCon(rs.getString(8));
				bean.setTheEighthCon(rs.getString(9));
				bean.setTheNinthCon(rs.getString(10));
				bean.setTheTenthCon(rs.getString(11));
				bean.setComConRemarks(rs.getString(12));
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
