package ex0407;

public class StudentVO { //입력받은 데이터를 인서트 하기 위한 클래스
	//필드 선언하기------------------------------------
	private String sno;
	private String sname;
	private String tel;
	private String address;
	
	
	
	//메소드 생성하기----------------------------------
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
