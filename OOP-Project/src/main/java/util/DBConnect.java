package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect extends CommonUtil{
	
	private static String url = "jdbc:mysql://localhost:3306/exevent"; 
	private static String userName = "root"; 
	private static String password = "1234";
	private static String driverName = "com.mysql.jdbc.Driver"; 
	private static Connection con;
    
    public static Connection getConnection() {
    	
    	try {
//			if (con == null || con.isClosed()) {}
    		Class.forName(driverName);
			con = DriverManager.getConnection(url, userName, password);
		
		}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
			System.out.println("Database connection is not success!!!");
		}
        
        return con;
    }
}
