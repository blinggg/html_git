package ex0506;

public class SVO {
	private String scode;
	private String sname;
	private String dept;
	private double avg;
	private int cnt;
	
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
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "SVO [scode=" + scode + ", sname=" + sname + ", dept=" + dept + ", avg=" + avg + ", cnt=" + cnt + "]";
	}

	
}
