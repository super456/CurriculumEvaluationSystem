package student.bean;

import java.sql.Date;


//有点尴尬的地方，因为主页面的通知栏的子菜单通知列表，没有做到点击后右侧可以显示所有通知的列表，而是顶部
//用于存储通知栏单行数据信息
public class NoticeBarList {
	int noticeBarInfoNum;//获取该篇文章的编号
	String title = null;//获取文章标题
	Date releaseTime = null;//获取文章发布时间
	String author = null;//获取作者或发布单位
	String content = null;//获取发布的内容
	//int noticeBarInfoLimit;//
	
	//以下是测试用例
	//String []columnName;//存放表数据的字段列名
	//String [][]tableRecord=null;//存放查询到的所有行记录
	
	//定义默认的构造函数
	public NoticeBarList(){
		//tableRecord=new String[1][1];
		//columnName=new String[1];
	}
	
	public int getNoticeBarInfoNum() {
		return noticeBarInfoNum;
	}


	public void setNoticeBarInfoNum(int noticeBarInfoNum) {
		this.noticeBarInfoNum = noticeBarInfoNum;
	}



	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getReleaseTime() {
		return releaseTime;
	}

	public void setReleaseTime(Date date) {
		this.releaseTime = date;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
