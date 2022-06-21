        <%--
  Created by IntelliJ IDEA.
  Author:Wantz
  Email:wantz@foxmail.com
  Date: 2022/6/9
  Time: 19:48
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="database.Stmt" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
<%@ page pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userDataTable.css">
    <script src="${pageContext.request.contextPath}/js/userDataTable.js"></script>
    <script src="${pageContext.request.contextPath}/js/urlFilter.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/UserDataFilter">
<table>
    <tr>
        <th colspan="8">用户信息表</th>
    </tr>
    <tr>
        <td colspan="2">
            <select name="attribute">
                <option value="null"></option>
                <option value="id">id</option>
                <option value="username">姓名</option>
                <option value="password">密码</option>
                <option value="email">电子邮件</option>
            </select>
        </td>
        <td colspan="2">
            <select name="relation">
                <option value="null"></option>
                <option value="equal">等于</option>
                <option value="unequal">不等于</option>
                <option value="bigger">大于</option>
                <option value="smaller">小于</option>
                <option value="notBigger">不大于</option>
                <option value="notSmaller">不小于</option>
                <option value="include">包含</option>
                <option value="notInclude">不包含</option>
            </select>
        </td>
        <td colspan="3"><input type="text" name="value"></td>
    </tr>
    <!--todo:这里是多重条件区域，可根据需要添加搜索条件-->
    <tr>
        <td colspan="3"><a href="userDataTable.jsp"><button type="button">重置</button></a></td>
        <td colspan="4"><input type="submit" value="筛选"></td>
    </tr>
    <tr>
        <td>id</td>
        <td>姓名</td>
        <td>密码</td>
        <td>电子邮箱</td>
        <td colspan="3">操作</td>
    </tr>
<%
    int Page = 1;
    if (request.getParameter("Page") != null) Page = Integer.parseInt(request.getParameter("Page"));
    int TotalPage = 0;
    int PageSize = 2;
    if (request.getParameter("PageSize") != null)
        PageSize = Integer.parseInt(request.getParameter("PageSize"));
    String expression;
    expression = request.getParameter("expression");
    try {

        int TotalRecord;    //总数据数
        String sql = "select count(*) as recordCount from user where true";
        String sql2 = "select * from user where true";

        if (expression != null) {
            if (!request.getParameter("expression").equals("") || request.getParameter("expression") != null) {
                sql = sql + " and " + request.getParameter("expression");
                sql2 = sql2 + " and " + request.getParameter("expression");
            }
        }
        out.println(sql);
        ResultSet resultSet = Stmt.getResultSet("user", sql2);
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
        if (resultSet.next()) {
            resultSet.absolute((Page - 1) * PageSize + 1);
            for (int iPage = 1; iPage <= PageSize; iPage++) {
%>
    <%=expression%>
    <tr>
        <td><%=resultSet.getString("id")%></td>
        <td><%=resultSet.getString("username")%></td>
        <td><%=resultSet.getString("password")%></td>
        <td><%=resultSet.getString("email")%></td>
        <td><a href="updateForm.jsp?id=<%=resultSet.getString("id")%>&username=<%=resultSet.getString("username")%>
                        &password=<%=resultSet.getString("password")%>&email=<%=resultSet.getString("email")%>">修改</a></td>
        <td><a href="${pageContext.request.contextPath}/DeleteAction?id=<%=resultSet.getString("id")%>">删除</a></td>
    </tr>
<%

                if (!resultSet.next()) break;
            }
        }
        else {
            out.println(
                    "<tr><td colspan='7'>无结果</td></tr>"
            );
                }
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
    <tr>
        <td><a href="addForm.jsp">新建</a></td>
    </tr>
    <tr>
        <td>
            <a href="userDataTable.jsp?Page=<%=Page - 1%>&PageSize=<%=PageSize%>&expression=<%=expression%>">上一页</a>
        </td>
        <td>
            <span>第</span>
            <input id="Page" type="number" name="Page" value="<%=Page%>">
            <span>页</span>
        </td>
        <td>
            <span>/</span>
            <span>共</span>
            <span><%=TotalPage%></span>
            <span>页</span>
        </td>
        <td><a><button type="button" id="jumpButton">跳转</button></a></td>
        <td>
            <span>每页</span>
            <input type="number" value="<%=PageSize%>" name="PageSize">
            <span>条</span>
        </td>
        <td>
            <a href="userDataTable.jsp?Page=<%=Page + 1%>&PageSize=<%=PageSize%>&expression=<%=expression%>">下一页</a>
        </td>
    </tr>
</table>
</form>
</body>
</html>
