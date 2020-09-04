package ex0422;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class MovieDAO {
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
			
			//데이터입력 메소드
			public void insert(MovieVO vo)throws Exception{
				String sql="insert into tbl_movie(mno,title,actor) values(seq_mno.nextval,?,?)";
				PreparedStatement ps=con().prepareStatement(sql);
				ps.setString(1, vo.getTitle());
				ps.setString(2, vo.getActor());
				ps.execute(); //쿼리도 상관없음.
			}
			
			//데이터목록 메서드
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
					list.add(vo);	//자주 까먹는 부분. vo를 list에 넣어주어야함! 누락되면 출력안됨!
				}
				return list;
			}
}
