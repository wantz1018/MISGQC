package method;

import database.Stmt;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckPassword {
    public static boolean checkPassword(String username, String password) throws SQLException {
        ResultSet resultSet = Stmt.getResult(
                "select * from user where username = '" + username + "'"
        );
        assert resultSet != null;
        return (password.equals(resultSet.getString("password")));
    }
}
