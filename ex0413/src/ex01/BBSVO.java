package ex01;

import java.util.Date;

//필드선언하기(테이블 칼럼명하고 동일하게)
public class BBSVO {
	private int bno;
	private String title;
	private String content;
	private Date wdate;
	
//메소드생성하기	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	
	
}
