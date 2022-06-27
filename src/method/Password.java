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
                if (password.equals(resultSet.getString("password"))) {
                    return "user";
                }
            }
            resultSet = Stmt.getResult(
                    "select * from administrator where id = '" + id + "'"
            );
            resultSet.last();
            if (resultSet.getRow() != 0) {
                if (password.equals(resultSet.getString("password"))) {
                    return "administrator";
                }
            }
            return "null";
        }
    }
