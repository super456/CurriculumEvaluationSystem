package admin.bean.commentCourse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CouClassStuSqlBean {

	Connection con;
	PreparedStatement pre;
	ResultSet rs;

	public CouClassStuSqlBean() {
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

	public List showAllCouClassStu(String sql) {
		List list = new ArrayList();

		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				CouClassStuInfo bean = new CouClassStuInfo();
				bean.setCouClassStuInfoNum(rs.getInt(1));
				bean.setCouNum(rs.getInt(2));
				bean.setStuNum(rs.getInt(3));
				bean.setIsTeach(rs.getInt(4));
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
