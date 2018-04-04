<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2018/1/30
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>专业添加页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="styles.css" rel="stylesheet"/>
</head>
<body>
<div>
    <div id="header"><%@include file="inc/header.inc" %></div>
    <div id="main">
        <form action="VetServlet" method="post">
            <input type="hidden" name="m" value="addSpec">
            <table>
                <tr>
                    <td>专业名称</td>
                    <td><input  name="specName"/></td>
                </tr>
                <tr>
                    <td>专业描述</td>
                    <td><input  name="specDesc"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input  type="submit" value="保存" /> <input type="reset" value="清空"/><input value="取消" type="button" onclick="location.href='vetsearch.jsp'" /></td>
                </tr>
            </table>

        </form>
        <h4><%=request.getAttribute("msg")==null?"":request.getAttribute("msg") %></h4>
    </div>
    <div id="footer"></div>
</div>
</body>
</html>
