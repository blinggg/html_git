package ex01;

import java.sql.*;
import java.util.ArrayList;

public class PDAO {
	//데이터접속
		public Connection con() throws Exception{
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1234";

		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		
		return con;
		}
		
		//데이터목록 출력메서드
		public ArrayList<PVO> list()throws Exception{
			ArrayList<PVO> list=new ArrayList<PVO>();
			String sql="select * from tbl_product";
			PreparedStatement ps=con().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				PVO vo=new PVO();
				vo.setPno(rs.getString("pno"));
				vo.setPname(rs.getString("pname"));
				vo.setPrice(rs.getInt("price"));
				list.add(vo);
			}
			
			
			return list;
			
		}
		
}
