package method;

import database.Stmt;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Password {
    public static String checkPassword(String id, String password) throws SQLException {
            ResultSet resultSet = Stmt.getResult(
                    "select * from user where id = '" + id + "'"
            );
            resultSet.last();
            if (resultSet.getRow() != 0) {
                System.out.println("id = " + id + "password=" + password);
                if (password.equals(resultSet.getString("password"))) {
                    return "user";
                }
            }
            System.out.println("结束用户表");
            resultSet = Stmt.getResult(
                    "select * from administrator where id = '" + id + "'"
            );
            resultSet.last();
            System.out.println("获取管理员信息");
            if (resultSet.getRow() != 0) {
                if (password.equals(resultSet.getString("password"))) {
                    System.out.println("密码通过");
                    return "administrator";
                }
            }
            return "null";
        }
    }
