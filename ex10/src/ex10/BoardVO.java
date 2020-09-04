package ex10;

import java.util.Date;

public class BoardVO {
	   private int bno;
	   private String title;
	   private String content;
	   private Date wdate;
	   
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