package servlet;

import database.Stmt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddAction", value = "/AddAction")
public class AddAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        Stmt.execute(
                "insert into user(id, username, password, email) values ('" +
                        id + "', '" + username + "', '"+ password + "', '" + email + "')"
        );
        response.sendRedirect("pages/userDataTable.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
