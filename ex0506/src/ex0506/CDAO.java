package ex0506;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CDAO {
	//����������
		public Connection con() throws Exception{
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "haksa";
		String password = "pass";

		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		return con;
		}
		
		//���¸�� ����ϱ�
		public ArrayList<CVO> list() throws Exception{
			ArrayList<CVO> list=new ArrayList<CVO>();
			String sql="select * from coupro";
			PreparedStatement ps= con().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				CVO vo=new CVO();
				vo.setLcode(rs.getString("lcode"));
				vo.setLname(rs.getString("lname"));
				vo.setPname(rs.getString("pname"));
				list.add(vo);
				System.out.println(vo.toString());
				
			}
			return list;
		}
		
		//Ư�����¸� �����ϴ� �л���� ����ϱ�
		public ArrayList<SVO> slist(String lcode) throws Exception{
			ArrayList<SVO> list=new ArrayList<SVO>();
			String sql="select * from stuenr where lcode=?";
			PreparedStatement ps= con().prepareStatement(sql);
			ps.setString(1, lcode);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				SVO vo=new SVO();
				vo.setScode(rs.getString("scode"));
				vo.setSname(rs.getString("sname"));
				vo.setCnt(rs.getInt("grade"));
				list.add(vo);
				System.out.println(vo.toString());
				
			}
			return list;
		}
		
		//Ư�����¸� �����ϴ� �л��� ���� ��� ����ϱ�
		public SVO avg(String lcode) throws Exception{
			SVO vo=new SVO();
			String sql="select scode, avg(grade) avg, count(scode) cnt from stuenr where lcode=? group by scode";
			PreparedStatement ps=con().prepareStatement(sql);
			ps.setString(1, lcode);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				vo.setAvg(rs.getDouble("avg"));
				vo.setCnt(rs.getInt("cnt"));
			}
			return vo;
		}
		
}
