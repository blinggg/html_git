package ex0428;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SCDAO {
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
			
			//수강신청 목록
			public ArrayList<SCVO> sclist(String lcode)throws Exception{
				ArrayList<SCVO> sclist=new ArrayList<SCVO>();
				String sql="select * from view_enrollments where lcode=?";
				PreparedStatement ps=con().prepareStatement(sql);
				ps.setString(1, lcode);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()) {
					SCVO vo=new SCVO();
					vo.setScode(rs.getString("scode"));
					vo.setSname(rs.getString("sname"));
					vo.setSdept(rs.getString("sdept"));
					vo.setYear(rs.getInt("year"));
					sclist.add(vo);
				}
				return sclist;
			}
}
