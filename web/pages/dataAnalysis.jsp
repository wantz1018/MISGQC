<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="database.Stmt" %>
<%@ page import="method.Transform" %><%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/25
  Time: 10:32
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据分析页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dataAnalysis.css">
    <script src="${pageContext.request.contextPath}/js/dataAnalysis.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/data.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="${pageContext.request.contextPath}/js/dataAnalysis.js"></script>
</head>



<body>
<div class="beSelectedArea">
    <table id="datatable">
        <%
            String X = request.getParameter("X-axis");
            String Y = request.getParameter("Y-axis");
            String Y_type = request.getParameter("Y-type");
            String Ex_Y = request.getParameter("ex-Y-axis");
            ResultSet resultSet_3 = null;
            if (X != null && Y != null) {
                if (Ex_Y != null) {
                    resultSet_3 = Stmt.getResult("select  "+  Ex_Y + " from record");
                }
                    ResultSet resultSet = Stmt.getResult(
                            "select " + X + ", " + request.getParameter("Y-type") + "(" + Y + ") as " + Transform.toType(Y_type) + " from record group by " + X
                    );
        %>
        <thead>
        <tr>
            <th><%=Transform.toName(X)%></th>
            <th><%=Transform.toName(Y)%></th>
        <%
            if (Ex_Y != null && !Ex_Y.equals("")) {
        %>
            <th><%=Transform.toName(Ex_Y)==null?"":Transform.toName(Ex_Y)%></th>
            <%
                }
            %>
        </tr>
        </thead>
        <tbody>
<%
    while (true) {
        try {
            assert resultSet != null;
            if (!resultSet.next()) break;{
%>
<tr>
    <th><%=resultSet.getString(X)%></th>
            <%
                }{
            %>
                <td><%=request.getParameter("Y-type").equals("null")?resultSet.getString(Y):resultSet.getString(Transform.toType(Y_type))%></td>
    <%
        }
        assert resultSet_3 != null;
            if (!Ex_Y.equals("")) {

                if (!resultSet_3.next()) break; {
            %>
                <td><%=resultSet_3.getString(Ex_Y)!=null?resultSet_3.getString(Ex_Y):""%></td>
    <%
                }
            }

    %>
</tr>
<%


            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
    }
    }
%>
        </tbody>
    </table>
</div>
<div class="container" id="container"> </div>
<div class="chartInformationArea">
    <form>
    <div class="chartInformation graph">
        <div>标题<input type="text" name="title" id="title" value="<%=request.getParameter("title")!=null?request.getParameter("title"):""%>"></div>
        <div>图表类型<select id="type" name="type">
            <option value="column" <%="column".equals(request.getParameter("type")) ? "selected" : ""%>>柱状图</option>
            <option value="bar" <%="bar".equals(request.getParameter("type")) ? "selected" : ""%>>条形图</option>
            <option value="line" <%="line".equals(request.getParameter("type")) ? "selected" : ""%>>折线图</option>
            <option value="pie" <%="pie".equals(request.getParameter("type")) ? "selected" : ""%>>饼图</option>
            <option value="scatter" <%="scatter".equals(request.getParameter("type")) ? "selected" : ""%>>散点图</option>
        </select></div>
    </div>
    <div class="chartInformation X-axis">
        <div class="dragTarget" >X轴</div>
        <div><select id="X-axis" name="X-axis">
            <option value="null"></option>
            <option value="id" <%="id".equals(request.getParameter("X-axis")) ? "selected" : ""%>>编号</option>
            <option value="dateTime" <%="dateTime".equals(request.getParameter("X-axis")) ? "selected" : ""%>>检测日期</option>
            <option value="storeName" <%="storeName".equals(request.getParameter("X-axis")) ? "selected" : ""%>>实际存储库点</option>
            <option value="shelfNo" <%="shelfNo".equals(request.getParameter("X-axis")) ? "selected" : ""%>>货位号</option>
            <option value="variety" <%="variety".equals(request.getParameter("X-axis")) ? "selected" : ""%>>品种</option>
            <option value="moistureAndVolatiles" <%="moistureAndVolatiles".equals(request.getParameter("X-axis")) ? "selected" : ""%>>水分及挥发物</option>
            <option value="insolubleImpurity" <%="insolubleImpurity".equals(request.getParameter("X-axis")) ? "selected" : ""%>>不溶性杂质</option>
            <option value="solventResidue" <%="solventResidue".equals(request.getParameter("X-axis")) ? "selected" : ""%>>溶剂残留量</option>
            <option value="acidValue" <%="acidValue".equals(request.getParameter("X-axis")) ? "selected" : ""%>>酸值</option>
            <option value="peroxideValue" <%="peroxideValue".equals(request.getParameter("X-axis")) ? "selected" : ""%>>过氧化值</option>
        </select></div>
    </div>
    <div class="chartInformation Y-axis">
        <div class="dragTarget">Y轴</div>
        <div><select id="Y-axis" name="Y-axis">
            <option value="null"></option>
            <option value="id" <%="id".equals(request.getParameter("Y-axis")) ? "selected" : ""%>>编号</option>
            <option value="dateTime" <%="dateTime".equals(request.getParameter("Y-axis")) ? "selected" : ""%>>检测日期</option>
            <option value="storeName" <%="storeName".equals(request.getParameter("Y-axis")) ? "selected" : ""%>>实际存储库点</option>
            <option value="shelfNo" <%="shelfNo".equals(request.getParameter("Y-axis")) ? "selected" : ""%>>货位号</option>
            <option value="variety" <%="variety".equals(request.getParameter("Y-axis")) ? "selected" : ""%>>品种</option>
            <option value="moistureAndVolatiles" <%="moistureAndVolatiles".equals(request.getParameter("Y-axis")) ? "selected" : ""%>>水分及挥发物</option>
            <option value="insolubleImpurity" <%="insolubleImpurity".equals(request.getParameter("Y-axis")) ? "selected" : ""%>>不溶性杂质</option>
            <option value="solventResidue" <%="solventResidue".equals(request.getParameter("Y-axis")) ? "selected" : ""%>>溶剂残留量</option>
            <option value="acidValue" <%="acidValue".equals(request.getParameter("Y-axis")) ? "selected" : ""%>>酸值</option>
            <option value="peroxideValue" <%="peroxideValue".equals(request.getParameter("Y-axis")) ? "selected" : ""%>>过氧化值</option>
        </select></div>
        <div>
            <select name="Y-type">
                <option value=""></option>
                <option value="avg" <%="avg".equals(request.getParameter("Y-type"))? "selected": ""%>>平均值</option>
                <option value="count" <%="count".equals(request.getParameter("Y-type"))? "selected": ""%>>计数</option>
                <option value="sum" <%="sum".equals(request.getParameter("Y-type"))? "selected": ""%>>总和</option>
            </select>
        </div>
    </div>
    <div class="chartInformation Y-axis-ex">
        <div class="dragTarget">额外Y轴</div>
        <div><select id="ex-Y-axis" name="ex-Y-axis">
            <option value="null"></option>
            <option value="id" <%="id".equals(request.getParameter("ex-Y-axis")) ? "selected" : ""%>>编号</option>
            <option value="dateTime" <%="dateTime".equals(request.getParameter("ex-Y-axis")) ? "selected" : ""%>>检测日期</option>
            <option value="storeName" <%="storeName".equals(request.getParameter("ex-Y-axis")) ? "selected" : ""%>>实际存储库点</option>
            <option value="shelfNo" <%="shelfNo".equals(request.getParameter("ex-Y-axis")) ? "selected" : ""%>>货位号</option>
            <option value="variety" <%="variety".equals(request.getParameter("ex-Y-axis")) ? "selected" : ""%>>品种</option>
            <option value="moistureAndVolatiles" <%="moistureAndVolatiles".equals(request.getParameter("ex-Y-axis")) ? "selected" : ""%>>水分及挥发物</option>
            <option value="insolubleImpurity" <%="insolubleImpurity".equals(request.getParameter("ex-Y-axis")) ? "selected" : ""%>>不溶性杂质</option>
            <option value="solventResidue" <%="solventResidue".equals(request.getParameter("ex-Y-axis")) ? "selected" : ""%>>溶剂残留量</option>
            <option value="acidValue" <%="acidValue".equals(request.getParameter("ex-Y-axis")) ? "selected" : ""%>>酸值</option>
            <option value="peroxideValue" <%="peroxideValue".equals(request.getParameter("ex-Y-axis")) ? "selected" : ""%>>过氧化值</option>
        </select></div>
        <div>
            <select name="ex-Y-type">
                <option value=""></option>
                <option value="avg"  <%="avg".equals(request.getParameter("ex-Y-type"))? "selected": ""%>>平均值</option>
                <option value="count" <%="count".equals(request.getParameter("ex-Y-type"))? "selected": ""%>>计数</option>
                <option value="sum" <%="sum".equals(request.getParameter("ex-Y-type"))? "selected": ""%>>总和</option>
            </select>
        </div>
    </div>
    <div class="chartInformation">
        <button type="submit" id="chooseBtn" onclick="choose()">选定</button>
        <button type="button" onclick="showChart()">生成</button>
    </div>
    </form>
</div>
</body>
</html>
