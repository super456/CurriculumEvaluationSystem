package admin.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeaSqlBean {

	Connection con;
	PreparedStatement pre;
	ResultSet rs;
	
	public TeaSqlBean(){
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
	public List showAllTea(String sql){
		List list = new ArrayList();
		
		try {
			pre = con.prepareStatement(sql);
			rs = pre.executeQuery();
			while(rs.next()){
				TeaInfo been = new TeaInfo();
				been.setTeaNum(rs.getInt(1));
				been.setTeaName(rs.getString(2));
				been.setTeaSex(rs.getString(3));
				been.setTeaBirthday(rs.getDate(4));
				been.setTeaForm(rs.getString(5));
				been.setTeaPhone(rs.getInt(6));
				been.setTeaRemarks(rs.getString(7));
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
