package ex0417;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDAO {
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


	//데이터 목록 출력하기
	public ArrayList<ReplyVO> list() throws Exception{
		ArrayList<ReplyVO> list=new ArrayList<ReplyVO>();
		String sql="select * from tbl_reply";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
	
		while(rs.next()) {
			ReplyVO vo=new ReplyVO();
			vo.setRno(rs.getInt("rno"));
			vo.setContent(rs.getString("content"));
			vo.setWdate(rs.getTimestamp("wdate"));
			vo.setCnt(rs.getInt("cnt"));
			list.add(vo);	//자주 까먹는 부분. vo를 list에 넣어주어야함! 누락되면 출력안됨!
		}
		return list;
	}
	
	//데이터입력 메소드
	public void insert(String content)throws Exception{
		String sql="insert into tbl_reply(rno,content,wdate)values(seq_rno.nextval,?,sysdate)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1,content);
		ps.execute(); //쿼리도 상관없음.
	}
	
	//데이터삭제 메소드
	public void delete(int rno)throws Exception{
		String sql="delete from tbl_reply where rno=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, rno);
		ps.execute();
	}
	
	//좋아요 메서드 만들기
	public void update(int rno)throws Exception{
		String sql="update tbl_reply set cnt=cnt+1 where rno=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, rno);
		ps.execute();
	}	
}