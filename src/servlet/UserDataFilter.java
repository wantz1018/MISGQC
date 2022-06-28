package servlet;

import method.Transform;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "UserDataFilter", value = "/UserDataFilter")
public class UserDataFilter extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String attribute = request.getParameter("attribute");
        String relation = request.getParameter("relation");
        String value = request.getParameter("value");
        String Page = request.getParameter("Page");
        String PageSize = request.getParameter("PageSize");
        String sql = Transform.toExpression(attribute, relation, value);
        if (Page.equals("")) Page = "1";
        if (PageSize.equals("")) PageSize = "10";
        String newUrl = "pages/userDataTable.jsp?" +
                "expression=" + sql+
                "&Page=" + Page +
                "&PageSize="+PageSize;
        newUrl = newUrl.replace("?expression=nullnull", "?");
        newUrl = newUrl.replace("?expression=null", "?");
        newUrl = newUrl + "&attribute=" + attribute + "&relation=" + relation + "&value=" + URLEncoder.encode(value, StandardCharsets.UTF_8);
        response.sendRedirect(newUrl);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
