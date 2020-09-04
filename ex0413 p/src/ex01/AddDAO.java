package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AddDAO {
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
		
	//������ ��� ��� �޼ҵ�	
				public ArrayList<AddVO>list()throws Exception{
					ArrayList<AddVO> array=new ArrayList<AddVO> ();
					String sql="select * from tbl_address";
					PreparedStatement ps=con().prepareStatement(sql);
					ResultSet rs=ps.executeQuery();
					
					while(rs.next()) {
						AddVO vo=new AddVO();
						vo.setAno(rs.getInt("ano"));
						vo.setAname(rs.getString("aname"));
						vo.setTel(rs.getString("tel"));
						vo.setAddress(rs.getString("address"));
						array.add(vo);
					}
					return array;
				}
	//������ �Է� �޼ҵ�
				public void insert(AddVO vo) throws Exception{
					String sql="insert into tbl_address(ano,aname, tel, address) values(SEQ_ADD.nextval,?,?,?)";
					PreparedStatement ps=con().prepareStatement(sql);
					ps.setString(1, vo.getAname());
					ps.setString(2, vo.getTel());
					ps.setString(3, vo.getAddress());
					ps.execute();
				}
	
				
	//������ �б� �޼ҵ�
				public AddVO read(int ano) throws Exception{
					String sql="select*from tbl_address where bno=?";
					PreparedStatement ps=con().prepareStatement(sql);
					ResultSet rs=ps.executeQuery();
					AddVO vo=new AddVO();
					
					if(rs.next()) {
						vo.setAno(rs.getInt("ano"));
						vo.setAname(rs.getString("aname"));
						vo.setTel(rs.getString("tel"));
						vo.setAddress(rs.getString("address"));
			
					}
					return vo;
				}
		}
