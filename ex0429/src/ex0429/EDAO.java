package ex0429;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EDAO {
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
		
		//특정학생이 수강신청한 강좌목록
				public ArrayList<EVO> list(String scode)throws Exception{
					System.out.println(scode);
					ArrayList<EVO> list=new ArrayList<EVO>();
					String sql="select * from view_enroll where scode=?";
					PreparedStatement ps=con().prepareStatement(sql);
					ps.setString(1, scode);
					ResultSet rs=ps.executeQuery();
					
					while(rs.next()) {
						EVO vo=new EVO();
						vo.setScode(rs.getString("scode"));
						vo.setSname(rs.getString("sname"));
						vo.setLcode(rs.getString("lcode"));
						vo.setLname(rs.getString("lname"));
						vo.setEdate(rs.getString("edate"));
						vo.setGrade(rs.getInt("grade"));
						list.add(vo);
					}
					
					System.out.println("데이터갯수:"+list.size());
					return list;
				}
				
		//수강신청
			public void insert(String scode, String lcode)throws Exception{
				String sql="insert into enrollments(scode, lcode, edate) values(?, ?, sysdate)"; 
				PreparedStatement ps=con().prepareStatement(sql);
				ps.setString(1, scode);
				ps.setString(2, lcode);
				ps.execute();
				con().close();
				}
			
		//수강취소
			public void delete(String scode, String lcode)throws Exception{
				String sql="delete from enrollments where scode=? and lcode=?"; 
				PreparedStatement ps=con().prepareStatement(sql);
				ps.setString(1, scode);
				ps.setString(2, lcode);
				ps.execute();
				con().close();
				}
			
			//특정강좌를 신청한 학생목록
			public ArrayList<EVO> clist(String lcode)throws Exception{
				System.out.println(lcode);
				ArrayList<EVO> list=new ArrayList<EVO>();
				String sql="select * from view_enroll where lcode=?";
				PreparedStatement ps=con().prepareStatement(sql);
				ps.setString(1, lcode);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()) {
					EVO vo=new EVO();
					vo.setScode(rs.getString("scode"));
					vo.setSname(rs.getString("sname"));
					vo.setLcode(rs.getString("lcode"));
					vo.setLname(rs.getString("lname"));
					vo.setEdate(rs.getString("edate"));
					vo.setGrade(rs.getInt("grade"));
					list.add(vo);
				}
				
				System.out.println("데이터갯수:"+list.size());
				return list;
			}
			
			
			//성적수정하기
				public void update(EVO vo)throws Exception{
					System.out.println(vo.getScode()+vo.getLcode()+vo.getGrade());
					String sql="update enrollments set grade=? where lcode=? and scode=?"; 
					PreparedStatement ps=con().prepareStatement(sql);
					ps.setInt(1, vo.getGrade());
					ps.setString(2, vo.getLcode());
					ps.setString(3, vo.getScode());
					ps.execute();
					con().close();
					}
}
