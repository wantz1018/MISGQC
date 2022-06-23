<%@ page import="java.sql.ResultSet" %>
<%@ page import="database.Stmt" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/10
  Time: 20:30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
    <title>质检信息表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/itemDataTable.css">
    <script src="${pageContext.request.contextPath}/js/urlFilter.js"></script>
    <script src="${pageContext.request.contextPath}/js/pageJump.js"></script>
    <script src="${pageContext.request.contextPath}/js/itemDataTable.js"></script>
</head>
<body>
<%
    int Page = 1;
    if (request.getParameter("Page") != null) Page = Integer.parseInt(request.getParameter("Page"));
    int TotalPage = 0;
    int PageSize = 10;
    if (request.getParameter("PageSize") != null)
        PageSize = Integer.parseInt(request.getParameter("PageSize"));
    String expression;
    expression = request.getParameter("expression");
    try {

        int TotalRecord;    //总数据数
        String sql = "select count(*) as recordCount from record where true";
        String sql2 = "select * from record where true";

        if (expression != null) {
            if (!request.getParameter("expression").equals("") || request.getParameter("expression") != null) {
                sql = sql + " and " + request.getParameter("expression");
                sql2 = sql2 + " and " + request.getParameter("expression");
            }
        }
        ResultSet resultSet = Stmt.getResultSet("record", sql2);
        assert resultSet != null;
        ResultSet rs = Stmt.getResult(sql);
        TotalRecord = Objects.requireNonNull(rs).getInt("recordCount");
        if (TotalRecord % PageSize == 0)
            TotalPage = TotalRecord / PageSize;
        else
            TotalPage = (int) Math.floor(TotalRecord / PageSize) + 1;
        if (TotalPage == 0) TotalPage = 1;
        if (request.getParameter("Page") == null || request.getParameter("Page").equals("")) Page = 1;
        else
            try {
                Page = Integer.parseInt(request.getParameter("Page"));
            } catch (java.lang.NumberFormatException e) {
                Page = 1;
            }
        if (Page < 1) Page = 1;
        if (Page > TotalPage) Page = TotalPage;
%>
<form action="${pageContext.request.contextPath}/ItemDataFilter">
<table style="text-align: center">
    <tr>
        <th colspan="10">质检信息表</th>
    </tr>
    <tr>
        <td colspan="10" id="filterArea">
            <div>
                <select name="attribute">
                    <option value="null"></option>
                    <option value="id">编号</option>
                    <option value="dateTime">检测日期</option>
                    <option value="storeName">实际存储库点</option>
                    <option value="shelfNo">货位号</option>
                    <option value="variety">品种</option>
                    <option value="moistureAndVolatiles">水分及挥发物</option>
                    <option value="insolubleImpurity">不溶性杂质</option>
                    <option value="solventResidue">溶剂残留量</option>
                    <option value="acidValue">酸值</option>
                    <option value="peroxideValue">过氧化值</option>
                </select>
                <select name="relation">
                    <option value="null"></option>
                    <option value="equal">等于</option>
                    <option value="smaller">小于</option>
                </select>
                <input type="text" name="value">
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="5"><a href="itemDataTable.jsp?Page=<%=Page%>&PageSize=<%=PageSize%>"><button type="button">重置</button> </a> </td>
        <td colspan="5"><input type="submit" value="筛选"></td>
    </tr>
    <tr>
        <td>
            <input id="itemDataAllCheckBox" type="checkbox" onclick="allSelected()">全选
        </td>
        <td>编号</td>
        <td>检测日期</td>
        <td>实际存储库点</td>
        <td>货位点</td>
        <td>品种</td>
        <td>水分及挥发物<br>(%)</td>
        <td>不溶性杂质<br>(%)</td>
        <td>溶剂残留量<br>(mg/kg)</td>
        <td>酸值<br>(mg/g)</td>
        <td>过氧化值<br>(mmol/kg)</td>
    </tr>

<%
        if (resultSet.next()) {
            resultSet.absolute((Page - 1) * PageSize + 1);
            for (int iPage = 1; iPage <= PageSize; iPage++) {
%>
    <tr class="itemDataRow">
        <td><input class="itemDataCheckBox" type="checkbox" onclick="itemTableClicked(this); checkedChange()" name=<%=resultSet.getString("id")%>></td>
        <td><%=resultSet.getString("id")%></td>
        <td><%=resultSet.getString("dateTime")%></td>
        <td><%=resultSet.getString("storeName")%></td>
        <td><%=resultSet.getString("shelfNo")%></td>
        <td><%=resultSet.getString("variety")%></td>
        <td><%=resultSet.getString("moistureAndVolatiles")%></td>
        <td><%=resultSet.getString("insolubleImpurity")%></td>
        <td><%=resultSet.getString("solventResidue")%></td>
        <td><%=resultSet.getString("acidValue")%></td>
        <td><%=resultSet.getString("peroxideValue")%></td>
        <td><a href="updateItemForm.jsp?id=<%=resultSet.getString("id")%>">修改</a></td>
        <td><a onclick="deleteConfirm('${pageContext.request.contextPath}/DeleteItemAction?id=<%=resultSet.getString("id")%>')">删除</a></td>
    </tr>
<%

                if (!resultSet.next()) break;
            }
        }
        else {
            out.println(
                    "<tr><td colspan='10'>无结果</td></tr>"
            );
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
    <tr>
        <td>
            <input id="reverseSelectedBox" type="checkbox" onclick="reverseSelected(); checkedChange()">反选
        </td>
        <td>
            <a href="itemDataTable.jsp?Page=1&PageSize=<%=PageSize%>&expression=<%=expression%>" onclick="return canLastPage()">首页</a>
        </td>
        <td>
            <a id="lastPageButton" href="itemDataTable.jsp?Page=<%=Page - 1%>&PageSize=<%=PageSize%>&expression=<%=expression%>" onclick="return canLastPage();">上一页</a>
        </td>
        <td colspan="3">
            <span>第</span>
            <input id="Page" type="number" name="Page" value="<%=Page%>" step="1" min="1" max="<%=TotalPage%>">
            <span>页</span>
            <span>/</span>
            <span>共</span>
            <span id="totalPage"><%=TotalPage%></span>
            <span>页</span>
        </td>
        <td><a><button type="button" id="jumpButton">跳转</button></a></td>
        <td colspan="2">
            <span>每页</span>
            <input type="number" value="<%=PageSize%>" step="1" min="1" max="20" name="PageSize">
            <span>条</span>
        </td>
        <td>
            <a id="nextPageButton" href="itemDataTable.jsp?Page=<%=Page + 1%>&PageSize=<%=PageSize%>&expression=<%=expression%>" onclick="return canNextPage()">下一页</a>
        </td>
        <td>
            <a href="itemDataTable.jsp?Page=<%=TotalPage%>&PageSize=<%=PageSize%>&expression=<%=expression%>" onclick="return canNextPage()">尾页</a>
        </td>
        <td>
            <a href="itemDataInput.jsp">新增</a>
        </td>
    </tr>
</table>
</form>
</body>
</html>
