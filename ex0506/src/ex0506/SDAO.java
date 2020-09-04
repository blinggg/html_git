package ex0506;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SDAO {
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
		
		//학생목록출력하기
		public ArrayList<SVO> list() throws Exception{
			ArrayList<SVO> list=new ArrayList<SVO>();
			String sql="select * from stupro";
			PreparedStatement ps= con().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				SVO vo=new SVO();
				vo.setScode(rs.getString("scode"));
				vo.setSname(rs.getString("sname"));
				vo.setDept(rs.getString("dept"));
				list.add(vo);
				System.out.println(vo.toString());
				
			}
			return list;
		}
		
		//특정학생이 신청한 강좌목록
		public ArrayList<CVO> elist(String scode) throws Exception{
			ArrayList<CVO> list=new ArrayList<CVO>();
			String sql="select * from couenr where scode=?";
			PreparedStatement ps= con().prepareStatement(sql);
			ps.setString(1, scode);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				CVO vo=new CVO();
				vo.setLcode(rs.getString("lcode"));
				vo.setLname(rs.getString("lname"));
				vo.setCnt(rs.getInt("grade"));
				list.add(vo);
				System.out.println(vo.toString());
				
			}
			return list;
		}
		
		//특정학생의 평균 출력하기
		public CVO avg(String scode) throws Exception{
			CVO vo=new CVO();
			String sql="select scode, avg(grade) avg, count(lcode) cnt from couenr where scode=? group by scode";
			PreparedStatement ps=con().prepareStatement(sql);
			ps.setString(1, scode);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				vo.setAvg(rs.getDouble("avg"));
				vo.setCnt(rs.getInt("cnt"));
			
			}
			return vo;
		}
		
		
}
