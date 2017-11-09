package admin.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.bean.StuInfo;
import admin.bean.StuSqlBean;
import admin.bean.TeaInfo;
import admin.bean.TeaSqlBean;

public class LimitUserLogin extends HttpServlet{

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("gb2312");
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs ;
		
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		List list = new ArrayList();
		String num = request.getParameter("accountNum");
		int accountNum = Integer.parseInt(num);
		String tableName = request.getParameter("tableName");
		String table = request.getParameter("table");
		int perLimit = 0;
		
		String condition = "select perLimit from userLogin where accountNum=?";
		String sql = "update userLogin set perLimit=? where accountNum=?";
		try {
			con = DriverManager.getConnection(uri, user, password);
			pre = con.prepareStatement(condition);
			pre.setInt(1, accountNum);
			rs = pre.executeQuery();
			while(rs.next()){
			 perLimit = rs.getInt(1);
			}
			if(perLimit==0){
				perLimit=1;
			}
			else{
				perLimit=0;
			}
			pre = con.prepareStatement(sql);
			pre.setInt(1, perLimit);
			pre.setInt(2, accountNum);
			pre.executeUpdate();
			
		 if(table.equals("stuInfo")){
			StuInfo bean = new StuInfo();
			String stuSql = "select * from stuInfo where stuNum=?";
			pre = con.prepareStatement(stuSql);
			pre.setInt(1, accountNum);
			rs = pre.executeQuery();
			while(rs.next()){
				bean.setStuNum(rs.getInt(1));
				bean.setLimitMess(limitMess(rs.getInt(1),con));
				bean.setStuName(rs.getString(2));
				bean.setStuSex(rs.getString(3));
				bean.setStuGrade(rs.getInt(4));
				bean.setStuForm(rs.getString(5));
				bean.setStuPhone(rs.getInt(6));
				bean.setStuRemarks(rs.getString(7));
				list.add(bean);
			}	
			request.setAttribute("list", list);
		  }
		 else if(table.equals("teaInfo")){
			 TeaInfo bean = new TeaInfo();
			 String teaSql = "select * from teaInfo where teaNum=?";
			 pre = con.prepareStatement(teaSql);
			 pre.setInt(1, accountNum);
			 rs = pre.executeQuery();
			 while(rs.next()){
				 bean.setTeaNum(rs.getInt(1));
				 bean.setLimitMess(limitMess(rs.getInt(1),con));
				 bean.setTeaName(rs.getString(2));
				 bean.setTeaSex(rs.getString(3));
				 bean.setTeaBirthday(rs.getDate(4));
				 bean.setTeaForm(rs.getString(5));
				 bean.setTeaPhone(rs.getInt(6));
				 bean.setTeaRemarks(rs.getString(7));
				 list.add(bean);
			 }
			 request.setAttribute("list", list);
		  }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				pre.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(tableName);
		dispatcher.forward(request, response);
	}
	
	public String limitMess(int accountNum,Connection con) throws SQLException{
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
