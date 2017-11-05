package admin.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeaPraiseListSqlBean {

	Connection con;
	PreparedStatement pre;
	ResultSet rs;
	
	public TeaPraiseListSqlBean(){
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
	public List showAllTeaPraise(String sql){
		List list = new ArrayList();
		
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()){
				TeaPraiseListInfo bean = new TeaPraiseListInfo();
				bean.setTeaPraiseListNum(rs.getInt(1));
				bean.setCouNum(rs.getInt(2));
				bean.setCouName(rs.getString(3));
				bean.setTeaNum(rs.getInt(4));
				bean.setTeaName(rs.getString(5));
				bean.setCouTerm(rs.getInt(6));
				bean.setTheAllAvgScore(rs.getFloat(7));
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
