package ex0504;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class enrollDAO {
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
			
			//과목별 평균점수 출력하기
			public ArrayList<enrollVO> clist() throws Exception{
				ArrayList<enrollVO> list=new ArrayList<enrollVO>();
				String sql="select lcode, lname, pname, avg(grade) a from enroll group by lcode, lname, pname";
				PreparedStatement ps=con().prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()){
					enrollVO vo=new enrollVO();
					vo.setLcode(rs.getString("lcode"));
					vo.setLname(rs.getString("lname"));
					vo.setPname(rs.getString("pname"));
					vo.setAvg(rs.getDouble("a"));
					list.add(vo);
					System.out.println(vo.toString());
				}
				return list;
			}
			
			//학생별 평균점수 출력하기
			public ArrayList<studentsVO> slist() throws Exception{
				ArrayList<studentsVO> list=new ArrayList<studentsVO>();
				String sql="select dept, scode, sname, avg(grade) a from enroll group by dept, scode, sname order by dept";
				PreparedStatement ps=con().prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()){
					studentsVO vo=new studentsVO();
					vo.setDept(rs.getString("dept"));
					vo.setScode(rs.getString("scode"));
					vo.setSname(rs.getString("sname"));
					vo.setAvg(rs.getDouble("a"));
					list.add(vo);
					System.out.println(vo.toString());
				}
				return list;
			}
}
