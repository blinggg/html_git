package ex0422;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class MovieDAO {
	//����������
			public Connection con() throws Exception{
			
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";

			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, user, password);
			return con;
			}
			
			//�������Է� �޼ҵ�
			public void insert(MovieVO vo)throws Exception{
				String sql="insert into tbl_movie(mno,title,actor) values(seq_mno.nextval,?,?)";
				PreparedStatement ps=con().prepareStatement(sql);
				ps.setString(1, vo.getTitle());
				ps.setString(2, vo.getActor());
				ps.execute(); //������ �������.
			}
			
			//�����͸�� �޼���
			public ArrayList<MovieVO> list() throws Exception{
				ArrayList<MovieVO> list=new ArrayList<MovieVO>();
				String sql="select * from tbl_movie";
				PreparedStatement ps=con().prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
			
				while(rs.next()) {
					MovieVO vo=new MovieVO();
					vo.setMno(rs.getInt("mno"));
					vo.setTitle(rs.getString("title"));
					vo.setActor(rs.getString("actor"));
					list.add(vo);	//���� ��Դ� �κ�. vo�� list�� �־��־����! �����Ǹ� ��¾ȵ�!
				}
				return list;
			}
}
