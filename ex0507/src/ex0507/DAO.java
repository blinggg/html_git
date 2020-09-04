package ex0507;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

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
			
	//교수입력 메서드
			public ArrayList<VO> pinsert(String pcode,String pname)throws Exception{
				String sql="{call add_professors(?,?,?)}";
				CallableStatement cs=con().prepareCall(sql);
				cs.setString(1, pcode);
				cs.setString(2, pname);
				cs.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR);
				cs.execute();
				
				ArrayList<VO> list=new ArrayList<VO>();
				ResultSet rs=(ResultSet)cs.getObject(3);
				while(rs.next()) {
					VO vo=new VO();
					vo.setCode(rs.getString("pcode"));
					vo.setName(rs.getString("pname"));
					list.add(vo);
				}
				return list;
		}
			
	//특정한 학과에 속하는 교수목록, 학생출력
			public JSONObject list(String dept) throws Exception{
				JSONObject jObject=new JSONObject();
				String sql="{call out_dept(?,?,?,?,?)}";
				CallableStatement cs=con().prepareCall(sql);
				cs.setString(1, dept);
				cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
				cs.registerOutParameter(3, oracle.jdbc.OracleTypes.NUMBER);
				cs.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR);
				cs.registerOutParameter(5, oracle.jdbc.OracleTypes.NUMBER);
				cs.execute();
				
	//특정학과 교수목록, 교수명 수 출력하기
				JSONArray pArray=new JSONArray();
				ResultSet rs=(ResultSet)cs.getObject(2);
				
				while(rs.next()) {
					JSONObject obj=new JSONObject();
					obj.put("pcode", rs.getString("pcode"));
					obj.put("pname",rs.getString("pname"));
					obj.put("dept", rs.getString("dept"));
			        obj.put("hiredate", rs.getString("hiredate"));
					pArray.add(obj);
				}
				jObject.put("pArray", pArray);
				
				int pcnt=cs.getInt(3);
				jObject.put("pcnt", pcnt);
				
	//특정학과 학생목록, 학생 수 출력하기
				rs=(ResultSet)cs.getObject(4);
				JSONArray sArray=new JSONArray();
				while(rs.next()) {
					JSONObject obj=new JSONObject();
					obj.put("scode", rs.getString("scode"));
					obj.put("sname", rs.getString("sname"));
					obj.put("dept", rs.getString("dept"));
					obj.put("birthday", rs.getString("birthday"));
					sArray.add(obj);
				}
				jObject.put("sArray", sArray);
				int scnt=cs.getInt(5);
				jObject.put("scnt", scnt);
				
				return jObject;
			}
			
	//특정학생의 수강신청 목록 출력하기
			public JSONObject elist(String scode) throws Exception{
				JSONObject jObject=new JSONObject();
				String sql="{call out_enroll(?,?,?,?)}";
				CallableStatement cs=con().prepareCall(sql);
				cs.setString(1, scode);
				cs.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
				cs.registerOutParameter(3, oracle.jdbc.OracleTypes.NUMBER);
				cs.registerOutParameter(4, oracle.jdbc.OracleTypes.NUMBER);
				cs.execute();
				
				ResultSet rs=(ResultSet)cs.getObject(2);
				JSONArray array=new JSONArray();
				while(rs.next()) {
					JSONObject obj=new JSONObject();
					obj.put("lcode", rs.getString("lcode"));
					obj.put("lname", rs.getString("lname"));
					obj.put("grade", rs.getString("grade"));
					array.add(obj);
					
				}
				
				jObject.put("array",array);
				
				double avg=cs.getDouble(3);
				jObject.put("avg",avg);
				double cnt=cs.getInt(4);
				jObject.put("cnt",cnt);
				
				return jObject;
			}
			
}
