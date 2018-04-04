<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2018/1/15
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="ph.po.Speciality"%>
<%@page import="java.util.List"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宠物添加页面</title>
    <link href="styles.css" rel="stylesheet" />
</head>
<body>
    <div>
    <div id="header">
        <%@include file="inc/header.inc"%>  <!-- 将各个页面相同的公用代码保存成外部文件 使用静态导入的方式导入到当前页面 方便后期维护 -->
    </div>
    <div id="main">
        <form action="PetServlet" method="post" enctype="multipart/form-data"> <!-- 文件上传  要修改表单的enctype属性 -->
            <input type="hidden" name="m" value="addPet">
            <table>
                <tr>
                    <td>客户姓名</td>
                    <!-- 这里要取得数据来自于哪里？来自于超链接  是parameter -->
                    <td>
                        <input name="cname" value="<%=request.getParameter("cname")%>"/>
                        <input type="hidden" name="cid" value="<%=request.getParameter("cid")%>"/>
                    </td>
                </tr>
                <tr>
                    <td>宠物姓名</td>
                    <td><input name="name" /></td>
                </tr><tr>
                <td>宠物生日</td>
                <td><input name="birthdate" /></td>
            </tr>
                <tr>
                    <td>宠物照片</td>
                    <td><input name="photo" type="file" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="保存"/> <input type="reset" value="清空"/><input value="取消" type="button" onclick="location.href='customersearch.jsp'"/></td>
                </tr>
            </table>

        </form>
        <h4><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%></h4>
    </div>
    <div id="footer"></div>
</div>
</body>
</html>
