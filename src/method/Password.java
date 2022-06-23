package method;

import database.Stmt;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Password {
    public static boolean checkPassword(String id, String password) throws SQLException {
        ResultSet resultSet = Stmt.getResult(
                "select * from user where id = '" + id + "'"
        );
        assert resultSet != null;
        return (password.equals(resultSet.getString("password")));
    }
}
