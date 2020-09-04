package ex0427;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CDAO {
	//데이터접속
	public Connection con() throws Exception{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "haksa";
	String password = "pass";

	Class.forName(driver);
	Connection con=DriverManager.getConnection(url, user, password);
	return con;
	}
	
	//목록 출력하기
	public ArrayList<CVO> list(String type, String word)throws Exception{
		ArrayList<CVO> list=new ArrayList<CVO>();
		String sql="select * from cview where " + type + " like?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, "%" + word + "%");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			CVO vo=new CVO();
			vo.setLcode(rs.getString("lcode"));
			vo.setLname(rs.getString("lname"));
			vo.setRoom(rs.getString("room"));
			vo.setPname(rs.getString("pname"));
			vo.setDept(rs.getString("dept"));
			list.add(vo);
		}
		con().close();
		return list;
	}
}