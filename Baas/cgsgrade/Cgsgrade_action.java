package cgsgrade;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.NamingException;

import com.alibaba.fastjson.JSONObject;
import com.justep.baas.action.ActionContext;
import com.justep.baas.data.Table;
import com.justep.baas.data.Transform;
import com.justep.baas.data.sql.SQLException;

public class Cgsgrade_action {
	private static final String DATASOURCE_TAKEOUT = "cgsgrade";
/**更新时间*/
	public static JSONObject getCount(JSONObject params, ActionContext context) throws SQLException, NamingException, java.sql.SQLException {
			Connection conn = null;
			java.sql.Statement statement = null;
			String ES_UUID = params.getString("ES_UUID");
			String PGE_UUID = params.getString("PGE_UUID");
			conn = context.getConnection(DATASOURCE_TAKEOUT);
			
			com.alibaba.fastjson.JSONObject jsonObject=new JSONObject();
			jsonObject.put("ss", "true");
			//System.out.println(PGE_UUID);
			//System.out.println(conn);			
			try {
				String sql = null;
				if(PGE_UUID != null){
					sql = "update pg_projectge t set t.PU_UP_TIME = sysdate where UUID = '"+PGE_UUID+"'";					
				}else{
				sql = "update pg_expertscore t set t.ES_UPDATE_TIME = sysdate where UUID in ("+ES_UUID+")";
				System.out.println(sql);
				}
				//System.out.println(sql);
				statement = conn.createStatement();
				statement.executeUpdate(sql);
				jsonObject.put("ss", "true");
				return jsonObject;
			} catch (Exception e) {
				e.printStackTrace();
				jsonObject.put("ss", "false");
				return jsonObject;
			} finally{
				try {
					if(statement != null)
						statement.close();
				} catch (Exception e) {
					e.printStackTrace();
				} finally{
					if(conn != null)
						conn.close();							
				}
			}	
	
//			  JsonParser jsonParser=new JsonParser();
//			JsonElement dElement=jsonParser.parse("{\"data\":true}");
//			jsonObject.add("ss", dElement);
		
	}

/*public static JSONObject getEsSum(JSONObject params, ActionContext context) throws SQLException, NamingException, java.sql.SQLException {
	CallableStatement proc =null;
	Connection conn = null;
	conn = context.getConnection(DATASOURCE_TAKEOUT);
	proc = conn.prepareCall("{ call p_select_es_sum(?,?,?,?) }");        
	String USER_UUID = params.getString("USER_UUID");
	String PRO_UUID = params.getString("PRO_UUID");
	String PROF_UUID = params.getString("PROF_UUID");
	String STAGE_UUID = params.getString("STAGE_UUID");
	//赋值参数	
	proc.setString(1, USER_UUID);
	proc.setString(2, PRO_UUID); 
	proc.setString(3, PROF_UUID);
	proc.setString(4, STAGE_UUID);  
	ResultSet rs =proc.executeQuery();
	System.out.println(rs);
	
	
	return null;
}	*/
	
/**
 * 插入 BLOB 类型的数据必须使用 PreparedStatement：因为 BLOB 类型
 * 的数据时无法使用字符串拼写的。
 * 
 * 调用 setBlob(int index, InputStream inputStream)
 * @throws java.sql.SQLException 
 * @throws java.sql.SQLException 
 * @throws java.sql.SQLException 
 * @throws FileNotFoundException 
 */
/*	public static JSONObject InsertBlob(JSONObject params, ActionContext context) throws SQLException, NamingException {
		String UUID = params.getString("UUID");
		String PE_ID = params.getString("EF_ID");
		String PGE_UUID = params.getString("EF_01");
		JDBCTest.testInsertBlob(UUID,PE_ID,PGE_UUID);
		return null;
	}*/
public static JSONObject InsertBlob(JSONObject params, ActionContext context) throws SQLException, NamingException, java.sql.SQLException, FileNotFoundException {
		PreparedStatement preparedStatement = null;
		//String UUID = params.getString("UUID");
		//String PE_ID = params.getString("EF_ID");
		//String PGE_UUID = params.getString("EF_01");
		Connection conn = context.getConnection(DATASOURCE_TAKEOUT);
		try {
			String sql = "INSERT INTO pg_efile(UUID, EF_ID,EF_01)" 
					+ "VALUES(?,?,?)";
			System.out.println(sql);
			preparedStatement = conn.prepareStatement(sql);				
			preparedStatement.setString(1, "1234564dd454f145575");
			preparedStatement.setString(2, "32456dd65f715347898");				
			InputStream inputStream = new FileInputStream("d://login.jpg");
			preparedStatement.setBlob(3, inputStream);				
			preparedStatement.executeUpdate();			
		}catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				if(conn != null)
					conn.close();							
			}
		}		
	return null;
}
			
	
	/**
	 * 插入 BLOB 类型的数据必须使用 PreparedStatement：因为 BLOB 类型
	 * 的数据时无法使用字符串拼写的。
	 * 
	 * 调用 setBlob(int index, InputStream inputStream)
	 * @throws java.sql.SQLException 
	 * @throws java.sql.SQLException 
	 */
	/*public static void testInsertBlob(String UUID,String EF_ID,String EF_01) throws java.sql.SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {	
			InsertBlob(null, null);
			String sql = "INSERT INTO pg_efile(UUID, EF_ID, EF_01)" 
					+ "VALUES(?,?,?)";
			System.out.println(sql);
			preparedStatement = connection.prepareStatement(sql);				
			preparedStatement.setString(1, EF_ID);
			preparedStatement.setString(2, EF_ID);				
			InputStream inputStream = new FileInputStream(EF_01);
			preparedStatement.setBlob(3, inputStream);				
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}*/

/*public static JSONObject getCount(JSONObject params, ActionContext context) throws SQLException, NamingException, java.sql.SQLException {
String uuid = params.getString("UUID");
String ID = "13";
Connection conn = context.getConnection(DATASOURCE_TAKEOUT);
System.out.println(conn);
try{
	//String sql = " UPDATE PG_PROJECTGE SET GRADE_STATE = '"+ID+"' WHERE UUID = '"+UUID+"'";
	//String sql = "update pg_projectge t set t.grade_state = '"+ID+"' where t.uuid = '"+uuid+"'";
	//String sql = "SELECT COUNT(ord.uuid) AS count " + " FROM pg_projectge ord ";
	//String sql = "insert into pg_projectge (grade_state) values (12) where uuid = '"+uuid+"'";
	String sql = "update pg_projectge set PU_UP_TIME = sysdate where PU_CODE_VALUE = 'Ee00002Ppj000002EGM000000022793'";
	System.out.println(sql);
	//System.out.println("----------");
	//System.out.println(UUID);
	//ret.put("count", 1000);
	//return ret;
	JSONObject ret = new JSONObject();
	int count = Integer.parseInt(DataUtils.getValueBySQL(conn, sql, null).toString());
	ret.put("count", count);
	return null;
}finally{
	conn.close();
}			
}*/

		
			//sql = "SELECT pro_name FROM pg_project WHERE pro_uuid in ("+ PRO_UUID +") ";					
public static JSONObject graded(JSONObject params, ActionContext context) throws SQLException, NamingException, java.sql.SQLException {
	Connection conn = null;
	java.sql.Statement statement = null;
	String USER_UUID = params.getString("USER_UUID");
	conn = context.getConnection(DATASOURCE_TAKEOUT);
		String sql = null;

			sql = "select t4.uuid,t6.stage_name ,t5.pro_name ,t3.sum_value ,t4.pu_up_time  from "
					+"(select t2.uuid ,sum(t1.es_value) as sum_value "
					+"from pg_expertscore t1 ,pg_projectge t2 "
					+"where t1.user_uuid = '"+USER_UUID+"'and "
					+"t1.pge_uuid = t2.uuid and "
					+"t2.grade_state = 1 "
					+"group by t2.uuid) t3 ,pg_projectge t4 ,pg_projectexpert t5, pg_stage t6 "
					+"where t4.user_uuid = '"+USER_UUID+"' and "
					+"t4.pe_uuid = t5.uuid and "
					+"t5.state_uuid = t6.uuid and "
					+"t3.uuid = t4.uuid ";		
			System.out.println(sql);
			statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			Table table = Transform.resultSetToTable(rs, "", null);
		return Transform.tableToJson(table);
	
	}
public static JSONObject grade(JSONObject params, ActionContext context) throws SQLException, NamingException, java.sql.SQLException {
	Connection conn = null;
	java.sql.Statement statement = null;
	String USER_UUID = params.getString("USER_UUID");
	conn = context.getConnection(DATASOURCE_TAKEOUT);
		String sql = null;

			sql = "select d1.uuid ,d3.stage_name,d2.pro_name ,d2.pe_grade_start_time ,d2.pe_grade_end_time " 
					+"from pg_projectge d1 ,pg_projectexpert d2 ,pg_stage d3 "
					+"where d1.user_uuid = '"+USER_UUID+"' and "
					+"d1.grade_state = 0 and "
					+"d1.pe_uuid = d2.uuid and "
					+"d2.state_uuid = d3.uuid ";		
			System.out.println(sql);
			statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			Table table = Transform.resultSetToTable(rs, "", null);
		return Transform.tableToJson(table);
	
	}

}
