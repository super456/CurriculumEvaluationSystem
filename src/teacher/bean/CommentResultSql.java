package teacher.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentResultSql {

	Connection con;
	PreparedStatement pre;
	ResultSet rs;

	public CommentResultSql() {
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user = "sa";
		String password = "123456";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(uri, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public List viewAllComResult(String sql) {
		List list = new ArrayList();

		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				CommentResult bean = new CommentResult();
				bean.setCouNum(rs.getInt(1));
				bean.setCouName(rs.getString(2));
				bean.setTeaName(rs.getString(3));
				bean.setCouTime(rs.getString(4));
				bean.setTheAllAvgScore(rs.getFloat(5));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
