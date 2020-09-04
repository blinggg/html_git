package ex0504;

public class studentsVO {
	private String dept;
	private String scode;
	private String sname;
	private double avg;
	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	@Override
	public String toString() {
		return "studentsVO [dept=" + dept + ", scode=" + scode + ", sname=" + sname + ", avg=" + avg + "]";
	}
	
	
	
	
}
