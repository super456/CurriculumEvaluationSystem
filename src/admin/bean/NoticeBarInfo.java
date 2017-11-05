package admin.bean;

import java.util.Date;

public class NoticeBarInfo {

	int noticeBarInfoNum,noticeBarInfoLimit;
	String title,content,author,limitMess,smallContent;
	public String getSmallContent() {
		if(content.length()>=18)
		smallContent = content.substring(0, 18);
		else
			smallContent = content;
		return smallContent;
	}
	Date releaseTime;
	public int getNoticeBarInfoNum() {
		return noticeBarInfoNum;
	}
	public void setNoticeBarInfoNum(int noticeBarInfoNum) {
		this.noticeBarInfoNum = noticeBarInfoNum;
	}
	public int getNoticeBarInfoLimit() {
		return noticeBarInfoLimit;
	}
	public void setNoticeBarInfoLimit(int noticeBarInfoLimit) {
		if(noticeBarInfoLimit == 0)
			limitMess="学生,教师查看";
		else if(noticeBarInfoLimit == 1)
			limitMess="学生查看";
		else if(noticeBarInfoLimit == 2)
			limitMess="教师查看";
		else if(noticeBarInfoLimit == 3)
			limitMess="禁止查看";
		this.noticeBarInfoLimit = noticeBarInfoLimit;
	}
	public String getLimitMess() {
		return limitMess;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}
}
