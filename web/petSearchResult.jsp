<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2018/1/30
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="ph.po.Pet"%>
<%@page import="java.util.List"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宠物查询结果页面</title>
    <link href="styles.css" rel="stylesheet"/>
    <SCRIPT type="text/javascript">
        function confirmDialog()
        {
            if(confirm("确定要删除该宠物信息吗?"))
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
                <td align="center">宠物姓名</td>
                <td align="center">宠物生日</td>
                <td align="center">宠物照片</td>
                <td align="center">宠物主人</td>
            </tr>
            <%
                List<Pet> pets = (List<Pet>) request.getAttribute("pets");
                for (Pet pet:pets) {
            %>
            <tr class="result">
                <td><%=pet.getName()%></td>
                <td><%=pet.getBirthdate()%></td>
                <td><img src="<%=pet.getPhoto()%>" width="50px" height="50px"></td>
                <td><%=pet.getOwnerName()%></td>
                <td><a href="PetServlet?m=deletePet&petId=<%=pet.getId()%>&petName=<%=pet.getName()%>" onclick=" return confirmDialog();">删除</a></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td></td>
                <td><input value="返回" type="button" onclick="location.href='petSearch.jsp'" /></td>
            </tr>
        </table>

        <h4 align="center" style="color:red"><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%></h4>
    </div>
    <div id="footer"></div>
</div>
</body>
</html>
