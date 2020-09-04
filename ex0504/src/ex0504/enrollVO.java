package ex0504;

public class enrollVO {
	private String lcode;
	private String lname;
	private String pname;
	private double avg;
	
	
	public String getLcode() {
		return lcode;
	}


	public void setLcode(String lcode) {
		this.lcode = lcode;
	}


	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public double getAvg() {
		return avg;
	}


	public void setAvg(double avg) {
		this.avg = avg;
	}


	@Override
	public String toString() {
		return "enrollVO [lcode=" + lcode + ", lname=" + lname + ", pname=" + pname + ", avg=" + avg + "]";
	}
	

}
