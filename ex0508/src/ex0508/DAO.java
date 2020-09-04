package ex0508;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class DAO {
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
	
	//학생 데이터 입력하기
	public JSONObject insert(SVO vo) throws Exception{
		JSONObject jObject=new JSONObject();
		String sql="{call add_students(?,?,?,?,?)}";
		CallableStatement cs=con().prepareCall(sql);
		cs.setString(1, vo.getScode());
		cs.setString(2, vo.getSname());
		cs.setString(3, vo.getDept());
		cs.registerOutParameter(4, oracle.jdbc.OracleTypes.NUMBER);
		cs.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR);
		cs.execute();
		
		jObject.put("cnt",cs.getInt(4));
		ResultSet rs=(ResultSet)cs.getObject(5);
		
		JSONArray array=new JSONArray();
		while(rs.next()) {
			JSONObject obj=new JSONObject();
			obj.put("scode", rs.getString("scode"));
			obj.put("sname", rs.getString("sname"));
			obj.put("dept", rs.getString("dept"));
			array.add(obj);
			}
		
		jObject.put("array", array);
		return jObject;
	}
		
		//학생 데이터 목록 출력하기
		public JSONObject slist() throws Exception{
			JSONObject jObject=new JSONObject();
			String sql="select * from students";
			PreparedStatement ps=con().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			JSONArray array=new JSONArray();
			while(rs.next()) {
				JSONObject obj=new JSONObject();
				obj.put("scode", rs.getString("scode"));
				obj.put("sname", rs.getString("sname"));
				obj.put("dept", rs.getString("dept"));
				array.add(obj);
				}
			jObject.put("array", array);
			return jObject;
		}
		
	//학생 데이터 삭제하기
		public JSONObject sdelete(String scode)throws Exception{
			JSONObject jObject=new JSONObject();
			String sql="{call del_students(?,?)}";
			CallableStatement cs=con().prepareCall(sql);
			cs.setString(1, scode);
			cs.registerOutParameter(2, oracle.jdbc.OracleTypes.NUMBER);
			cs.execute();
			
			jObject.put("cnt", cs.getInt(2));
			return jObject;

	}
		
	//강좌 목록 출력하기
			public JSONObject clist() throws Exception{
				JSONObject jObject=new JSONObject();
				String sql="select * from courses";
				PreparedStatement ps=con().prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
					
				JSONArray array=new JSONArray();
				while(rs.next()) {
					JSONObject obj=new JSONObject();
					obj.put("lcode", rs.getString("lcode"));
					obj.put("lname", rs.getString("lname"));
					array.add(obj);
					}
				
				jObject.put("array", array);
				return jObject;
		}
	//강좌 목록 입력하기
			
			public JSONObject cinsert(String lcode,String lname) throws Exception{
				JSONObject jObject=new JSONObject();
				String sql="{call add_courses(?,?,?)}";
				CallableStatement cs=con().prepareCall(sql);
				cs.setString(1, lcode);
				cs.setString(2, lname);
				cs.registerOutParameter(3, oracle.jdbc.OracleTypes.NUMBER);
				cs.execute();
				
				jObject.put("cnt",cs.getInt(3));
				return jObject;
			}
			
			//학생 데이터 삭제하기
			public JSONObject cdelete(String lcode)throws Exception{
				JSONObject jObject=new JSONObject();
				String sql="{call del_courses(?,?)}";
				CallableStatement cs=con().prepareCall(sql);
				cs.setString(1, lcode);
				cs.registerOutParameter(2, oracle.jdbc.OracleTypes.NUMBER);
				cs.execute();
				
				jObject.put("cnt", cs.getInt(2));
				return jObject;

		}
			//특정강좌를 수강한 학생목록
			public JSONObject celist(String lcode)throws Exception{
				JSONObject jObject=new JSONObject();
				String sql="{call out_cenroll(?,?,?,?)}";
				CallableStatement cs=con().prepareCall(sql);
				cs.setString(1, lcode);
				cs.registerOutParameter(2, oracle.jdbc.OracleTypes.NUMBER);
				cs.registerOutParameter(3, oracle.jdbc.OracleTypes.NUMBER);
				cs.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR);
				cs.execute();
				
				jObject.put("cnt",cs.getInt(2));
				jObject.put("avg",cs.getDouble(3));
				ResultSet rs=(ResultSet)cs.getObject(4);
				
				JSONArray jArray=new JSONArray();
				while(rs.next()) {
					JSONObject obj=new JSONObject();
					obj.put("scode", rs.getString("scode"));
					obj.put("sname", rs.getString("sname"));
					obj.put("grade", rs.getString("grade"));
					jArray.add(obj);
					}
				
				jObject.put("array", jArray);
				return jObject;
			}
			
			//특정강좌의 점수 수정하기
			public void update(String grade,String scode,String lcode)throws Exception{
				String sql="update enrollments set grade=? where scode=? and lcode=?";
				PreparedStatement ps=con().prepareStatement(sql);
				ps.setString(1, grade);
				ps.setString(2, scode);
				ps.setString(3, lcode);
				ps.execute();
				con().close();
			}
	}
			
