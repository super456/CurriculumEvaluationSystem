package publicConnectSql;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import student.bean.CommentContents;
import student.bean.NoticeBarList;
import student.bean.ViewEvaluationInfo;

import admin.bean.admin.AdminInfo;

public class connectSql {
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	//启动连接数据库方法
	public void StartCon(){
		String uri = "jdbc:sqlserver://localhost:55780;DatabaseName=curriculumEvaluationSystem";
		String user="sa";
		String password = "123456";
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(uri,user,password);
			//System.out.println("Connection Successful!"); 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//1.执行登录判断连接数据库操作语句
	public boolean loginQuery(String sql){
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next()) {
				return true;//证明操作有结果，返回true
		} else {
			return false;//证明操作没结果，返回false
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return false;//默认返回false，证明数据库查询失败，没有结果
	}
	
	//2.操作数据库，执行语句，返回String类型的指定查询的数据，单行数据为主,
	public String  execQuery(String sql){
		String  result=null;
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next()) {
				result=rs.getString(1);
			}else {
				result=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return result;
	}
	
	//3.执行数据库语句，返回int类型指定的单行数据
	public int  intQuery(String sqlString){
		int num = 0;
		try {
			pst = con.prepareStatement(sqlString);
			rs = pst.executeQuery();
			if (rs.next()) {
				num=rs.getInt(1);
			}else {
				num=0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return num;
	}
	
	
	//4.用于展示学生主页面或教师主页面，通告栏的通知列表信息
	public List showStuAndTeaNoticeBar(String sql){
		List list = new ArrayList();
		
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				NoticeBarList bean = new NoticeBarList();
				bean.setNoticeBarInfoNum(rs.getInt(1));
				bean.setTitle(rs.getString(2));
				bean.setReleaseTime(rs.getDate(3));
				bean.setAuthor(rs.getString(4));
				bean.setContent(rs.getString(5));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return list;
	}
	
	
	//5.获取学生查看课程评教信息
	public List showStuViewEvaluationInfo(String sql){
		List list = new ArrayList();
		
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				ViewEvaluationInfo bean = new ViewEvaluationInfo();
				bean.setCouName(rs.getString(1));
				bean.setTeaName(rs.getString(2));
				bean.setCouTime(rs.getString(3));
				bean.setCouPlace(rs.getString(4));
				bean.setCouCredit(rs.getString(5));
				bean.setIsTeach(rs.getInt(6));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return list;
	}
	
	//6.获取学生要评教卡的每一项的内容信息
	public List showCommentContent(String sql){
		List list = new ArrayList();
		
		try {
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				CommentContents bean = new CommentContents();
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
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return list;
	}
	
	//7.插入、更新、删除数据库表格数据方法体，可以指定插入一行数据
	public int insertUpdate(String sqlString){
		int judge=0;//判断是否插入成功，0表示插入失败，1表示插入成功
		try {
			pst=con.prepareStatement(sqlString);
			judge=pst.executeUpdate();
			if (judge>0) {
				judge=1;
			}else {
				judge=0;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return judge;
	}
	
	//8.获取该门课的每一个学生的评教平均分，并相加求和取评教了的学生的人数总和的平均数
	public float SumStuAvgCou(String sqlString){
		float avgSum=0;//求和平均分
		int countStu=0;//计算已评教学生的人数
		try {
			pst=con.prepareStatement(sqlString);
			rs = pst.executeQuery();
			while(rs.next()){
				countStu++;
				avgSum+=rs.getFloat(1);
			}
			avgSum=avgSum/countStu;//处理该门课已评教的学生的平均分总数除于已评教的学生人数
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return avgSum;
	}
	
}
