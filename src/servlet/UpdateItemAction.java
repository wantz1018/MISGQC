package servlet;

import database.Stmt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateItemAction", value = "/UpdateItemAction")
public class UpdateItemAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id;
        String dateTime;
        String storeName;
        String shelfNo;
        String variety;
        String moistureAndVolatiles;
        String insolubleImpurity;
        String solventResidue;
        String acidValue;
        String peroxideValue;
        id = request.getParameter("id");
        dateTime = request.getParameter("dateTime");
        storeName = request.getParameter("storeName");
        shelfNo = request.getParameter("shelfNo");
        variety = request.getParameter("variety");
        moistureAndVolatiles = request.getParameter("moistureAndVolatiles");
        insolubleImpurity = request.getParameter("insolubleImpurity");
        solventResidue = request.getParameter("solventResidue");
        acidValue = request.getParameter("acidValue");
        peroxideValue = request.getParameter("peroxideValue");

        Stmt.execute(
                "update record set " +
                        "dateTime = '" + dateTime +
                        "',storeName = '" + storeName +
                        "',shelfNo = '" + shelfNo +
                        "',variety = '" + variety +
                        "',moistureAndVolatiles = '" + moistureAndVolatiles +
                        "',insolubleImpurity = '" + insolubleImpurity +
                        "',solventResidue = '" + solventResidue +
                        "',acidValue = '" + acidValue +
                        "',peroxideValue = '" + peroxideValue +
                        "' where id = '" + id + "'"
        );
        System.out.println(peroxideValue);
        response.sendRedirect("pages/itemDataTable.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
