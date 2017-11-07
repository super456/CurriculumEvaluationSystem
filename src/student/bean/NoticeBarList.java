package student.bean;


//有点尴尬的地方，因为主页面的通知栏的子菜单通知列表，没有做到点击后右侧可以显示所有通知的列表，而是顶部
//用于存储通知栏单行数据信息
public class NoticeBarList {
	//int noticeBarInfoNum;//获取
	//String title = null;//
	//String releaseTime = null;//
	//String author = null;//
	//String content = null;//
	//int noticeBarInfoLimit;//
	
	//以下是测试用例
	String []columnName;//存放表数据的字段列名
	String [][]tableRecord=null;//存放查询到的所有行记录
	
	//定义默认的构造函数
	public NoticeBarList(){
		tableRecord=new String[1][1];
		columnName=new String[1];
	}

	public String[] getColumnName() {
		return columnName;
	}

	public void setColumnName(String[] columnName) {
		this.columnName = columnName;
	}

	public String[][] getTableRecord() {
		return tableRecord;
	}

	public void setTableRecord(String[][] tableRecord) {
		this.tableRecord = tableRecord;
	}
	
}
