package servlet;

import database.Stmt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

@WebServlet(name = "RegisteredAction", value = "/RegisteredAction")
public class RegisteredAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        try {
            ResultSet resultSet = Stmt.getResult("select * from user where id = '" + id + "'");
            assert resultSet != null;
            resultSet.last();
            if (resultSet.getRow() == 0) {
                Stmt.execute(
                        "insert into user(id, username, password, email) values('" +
                                id + "', '" + username + "', '" + password + "', '" + email + "')"
                );
                response.sendRedirect("pages/registered.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
