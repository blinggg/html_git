package ex0417;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GradeDAO {
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
	public ArrayList<GradeVO> list() throws Exception{
		ArrayList<GradeVO> list=new ArrayList<GradeVO>();
		String sql="select * from tbl_grade";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
	
		while(rs.next()) {
			GradeVO vo=new GradeVO();
			vo.setGno(rs.getInt("gno"));
			vo.setGname(rs.getString("gname"));
			vo.setKor(rs.getInt("kor"));
			vo.setEng(rs.getInt("eng"));
			vo.setMat(rs.getInt("mat"));
			list.add(vo);	//자주 까먹는 부분. vo를 list에 넣어주어야함! 누락되면 출력안됨!
		}
		return list;
	}
	
	//데이터입력 메소드
	public void insert(GradeVO vo)throws Exception{
		String sql="insert into tbl_grade(gno, gname, kor, eng, mat) values(SEQ_GNO.nextval,?,?,?,?)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getGname());
		ps.setInt(2, vo.getKor());
		ps.setInt(3, vo.getEng());
		ps.setInt(4, vo.getMat());
		ps.execute(); //쿼리도 상관없음.
	}
	
	//데이터삭제 메소드
	public void delete(int gno)throws Exception{
		String sql="delete from tbl_grade where gno=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, gno);
		ps.execute();
	}
	
	//데이터 수정 메서드
	public void update(GradeVO vo)throws Exception{
		String sql="update tbl_grade set kor=?, eng=?, mat=? where gno=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, vo.getKor());
		ps.setInt(2, vo.getEng());
		ps.setInt(3, vo.getMat());
		ps.setInt(4, vo.getGno());
		ps.execute();
	}	
}