package servlet;

import database.Stmt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteItemAction", value = "/DeleteItemAction")
public class DeleteItemAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Stmt.execute(
                "delete from record where id = '" + id + "'"
        );
        response.sendRedirect("pages/itemDataTable.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
