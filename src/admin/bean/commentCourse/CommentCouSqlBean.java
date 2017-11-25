package admin.bean.commentCourse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentCouSqlBean {

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
	
	public List showAllCommentCou(String sql){
		List list = new ArrayList();
		
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()){
				CommentCouInfo bean = new CommentCouInfo();
				bean.setComCouNum(rs.getInt(1));
				bean.setCouNum(rs.getInt(2));
				bean.setStuNum(rs.getInt(3));
				bean.setComDate(rs.getDate(4));
				bean.setComFirstScore(rs.getInt(5));
				bean.setComSecondScore(rs.getInt(6));
				bean.setComThirdScore(rs.getInt(7));
				bean.setComFourthScore(rs.getInt(8));
				bean.setComFifthScore(rs.getInt(9));
				bean.setComSixthScore(rs.getInt(10));
				bean.setComSeventhScore(rs.getInt(11));
				bean.setComEighthScore(rs.getInt(12));
				bean.setComNinthScore(rs.getInt(13));
				bean.setComTenthScore(rs.getInt(14));
				bean.setComLeaMsg(rs.getString(15));
				bean.setComTotalScore(rs.getInt(16));
				bean.setComAvgScore(rs.getFloat(17));
				bean.setCouTerm(rs.getInt(21));
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
	
	public List showCommentCouDetail(String sql){
		List list = new ArrayList();
		
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()){
				CommentCouInfo bean = new CommentCouInfo();
				bean.setComCouNum(rs.getInt(1));
				bean.setCouNum(rs.getInt(2));
				bean.setStuNum(rs.getInt(3));
				bean.setComDate(rs.getDate(4));
				bean.setComFirstScore(rs.getInt(5));
				bean.setComSecondScore(rs.getInt(6));
				bean.setComThirdScore(rs.getInt(7));
				bean.setComFourthScore(rs.getInt(8));
				bean.setComFifthScore(rs.getInt(9));
				bean.setComSixthScore(rs.getInt(10));
				bean.setComSeventhScore(rs.getInt(11));
				bean.setComEighthScore(rs.getInt(12));
				bean.setComNinthScore(rs.getInt(13));
				bean.setComTenthScore(rs.getInt(14));
				bean.setComLeaMsg(rs.getString(15));
				bean.setComTotalScore(rs.getInt(16));
				bean.setComAvgScore(rs.getFloat(17));
				bean.setCouTerm(rs.getInt(21));
				bean.setStuName(rs.getString(28));
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
