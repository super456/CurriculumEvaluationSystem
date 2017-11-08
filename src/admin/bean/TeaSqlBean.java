package admin.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
				TeaInfo bean = new TeaInfo();
				bean.setTeaNum(rs.getInt(1));
				bean.setLimitMess(limitMess(rs.getInt(1)));
				bean.setTeaName(rs.getString(2));
				bean.setTeaSex(rs.getString(3));
				bean.setTeaBirthday(rs.getDate(4));
				bean.setTeaForm(rs.getString(5));
				bean.setTeaPhone(rs.getInt(6));
				bean.setTeaRemarks(rs.getString(7));
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
	public String limitMess(int accountNum) throws SQLException{
		String sql = "select perLimit from userLogin where accountNum=?";
		PreparedStatement pre1 = con.prepareStatement(sql);
		pre1.setInt(1, accountNum);
		ResultSet rs = pre1.executeQuery();
		String limitMess = null;
		while(rs.next()){
			int perLimit = rs.getInt(1);
			if(perLimit == 0){
				limitMess = "否";
			}else if(perLimit == 1){
				limitMess = "是";
			}
		}
		rs.close();
		pre1.close();
		return limitMess;
	}
}
