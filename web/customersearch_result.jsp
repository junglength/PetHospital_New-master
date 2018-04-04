<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2018/1/12
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="ph.po.User"%>
<%@page import="ph.po.Speciality"%>
<%@page import="ph.po.Vet"%>
<%@page import="java.util.List"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>客户查询结果页面</title>
    <link href="styles.css" rel="stylesheet"/>
    <SCRIPT type="text/javascript">
        function confirmDialog()
        {
            if(confirm("确定要删除该客户信息吗?"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    </SCRIPT>
</head>
<body>
    <div>
        <div id="header"><%@include file="/inc/header.inc" %></div>
        <div id="main">
        <table>
            <tr>
                <td align="center">客户姓名</td>
                <td align="center">客户电话</td>
                <td align="center">客户地址</td>
            </tr>
            <%
                List<User> users = (List<User>) request.getAttribute("users");
                for (User user:users) {
            %>
            <tr class="result">
                <td><%=user.getName()%></td>
                <td><%=user.getTel()%></td>
                <td><%=user.getAddress()%></td>
                <td><a href="CustomerServlet?id=<%=user.getId() %>">查看</a></td>
                <td><a href="CustomerServlet?mode=delete&cid=<%=user.getId()%>" onclick=" return confirmDialog();">删除</a></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td></td>
                <td><input value="返回" type="button" onclick="location.href='customersearch.jsp'" /></td>
            </tr>
        </table>

        <h4><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%></h4>
    </div>
        <div id="footer"></div>
    </div>
</body>
</html>
