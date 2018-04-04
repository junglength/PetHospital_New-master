<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2018/2/2
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="ph.po.Pet"%>
<%@page import="ph.po.User"%>
<%@page import="java.util.List"%>
<%@ page import="ph.dao.UserDAO" %>
<%@page import="java.net.URLEncoder"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宠物查询结果页面</title>
    <link href="styles.css" rel="stylesheet"/>
</head>
<body>
<div>
    <div id="header"><%@include file="/inc/header.inc" %></div>
    <div id="main">
        <table border="1">
            <h4><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%></h4>
            <tr>
                <td colspan="2">宠物信息</td>
                <td>就诊管理</td>
            </tr>
            <%
                List<Pet> pets = (List<Pet>) request.getAttribute("pets");
                for (Pet pet : pets)
                {
                    User user = new UserDAO().getById(pet.getOwnerId());

            %>
            <tr>
                <td><img src="<%=pet.getPhoto()%>" width="80px" height="100px"></td>
                <td class="minWidth">姓名:<%=pet.getName()%><br/>生日:<%=pet.getBirthdate()%><br/>主人：<%=pet.getOwnerName()%><br/>电话：<%=user.getTel()%><br/>地址：<%=user.getAddress()%></td>
                <td class="minWidth">
                    <a href="TreatServlet?mode=showResume&petId=<%=pet.getId()%>">查看病例</a>|
                    <a href="TreatServlet?mode=toAdd&customerId=<%=user.getId()%>&petId=<%=pet.getId()%>&petName=<%=URLEncoder.encode(pet.getName(), "UTF-8")%>">添加病例</a></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>

</body>
</html>
