package servlet;

import database.Stmt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "UpdateAction", value = "/UpdateAction")
public class UpdateAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        Stmt.execute(
                "update user set" +
                        " username= '" + username+
                        "' ,password='" + password+
                        "' ,email='" + email+
                        "' where id='" + id + "'"
        );
        response.sendRedirect("pages/main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
