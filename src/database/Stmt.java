package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Stmt {

    public static ResultSet getResultSet(String table, String expression) throws SQLException {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(expression);
        } catch (Exception e) {
            System.out.print(e.getMessage());
            return null;
        }
        return resultSet;
    }

    public static ResultSet getResultSet(String table, String attribute, String condition) throws SQLException {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(
                    "select " + attribute + " from " + table + " where " + condition
            );
            resultSet.next();
        } catch (Exception e) {
            System.out.print(e.getMessage());
            return null;
        }
        return resultSet;
    }

    public static ResultSet getResultSet(String table) throws SQLException {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.createStatement();
            String sql = "select * from "+ table;
            resultSet = statement.executeQuery(sql);
            resultSet.next();
        } catch (Exception e) {
            System.out.print(e.getMessage());
            return null;
        }
        return resultSet;
    }

    public static void execute(String sql) {
        Connection connection = null;
        Statement statement = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.createStatement();
            statement.execute(sql);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println(sql);
        }
    }

    public static ResultSet getResult(String sql) {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            resultSet.next();
        } catch (Exception e) {
            System.out.print(e.getMessage());
            return null;
        }
        return resultSet;
    }

    public static String getLastId(String table) throws SQLException {
        ResultSet resultSet = getResult("select * from " + table + "");
        assert resultSet != null;
        resultSet.last();
        return resultSet.getString("id");
    }
}
