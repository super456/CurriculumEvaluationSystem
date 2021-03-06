package teacher.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HonorSql {

	Connection con;
	PreparedStatement pre;
	ResultSet rs;

	public void startCon() {
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

	public List showAllHonor(String sql) {
		List list = new ArrayList();

		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while (rs.next()) {
				TeaInfo bean = new TeaInfo();
				bean.setTeaNum(rs.getInt(1));
				bean.setTeaName(rs.getString(2));
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
