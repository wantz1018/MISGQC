package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    public static Connection connection = null;
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/misgqc?useUnicode=true&characterEncoding=utf-8";
        String username = "";
        String password = "";
        connection = DriverManager.getConnection(url, username, password);
        return connection;
    }
}
