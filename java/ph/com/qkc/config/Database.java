package ph.com.qkc.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
	
	private static String schema = "SY";
	private static String password = "SY";
	private static String url = "jdbc:oracle:thin:@training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com:1521:ORCL";
	
	public static Connection getConnection() {
		
		Connection conn = null;
		
		try{
			Class.forName ("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, schema, password);
			if(conn != null) {
				System.out.println("Connected!");
			}
		} catch (Exception e) {
			System.out.println("Failed to connect to database!");
			e.printStackTrace();
		}
		return conn;
	}
}

