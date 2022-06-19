package servlet;

import method.Transform;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserDataFilter", value = "/UserDataFilter")
public class UserDataFilter extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String attribute = request.getParameter("attribute");
        String relation = request.getParameter("relation");
        String value = request.getParameter("value");
        String Page = request.getParameter("Page");
        String PageSize = request.getParameter("PageSize");
        String sql = Transform.toExpression(attribute, relation, value);
        if (Page.equals("")) Page = "1";
        if (PageSize.equals("")) PageSize = "10";
        response.sendRedirect(
                "pages/userDataTable.jsp?" +
                        "expression=" + sql+
                        "&Page=" + Page +
                        "&PageSize="+PageSize
        );
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
