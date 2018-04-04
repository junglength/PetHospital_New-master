<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2018/1/12
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="ph.po.Pet"%>
<%@page import="ph.po.User"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>客户详细信息页面</title>
    <link href="styles.css" rel="stylesheet" />
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
    <div id="header">
        <%@ include file="inc/header.inc"%>
    </div>
    <div id="main">
        <%
            User user = (User) request.getAttribute("user");
        %>
        <table>
            <tr>
                <td>客户姓名</td>
                <td><input disabled="disabled" value="<%=user.getName()%>" /></td>
            </tr>
            <tr>
                <td>联系电话</td>
                <td><input disabled="disabled" value="<%=user.getTel()%>" /></td>
            </tr>
            <tr>
                <td>家庭地址</td>
                <td><input disabled="disabled" value="<%=user.getAddress()%>" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <a href="PetServlet?m=toAdd&cid=<%=user.getId()%>&cname=<%=URLEncoder.encode(user.getName(), "utf-8")%>">添加新宠物</a>
                    <%--<input value="返回" type="button" onclick="history.back(-1)"/用history.back不合理，导致如果在添加宠物页面保存宠物成功并跳转到本页后，又返回了添加宠物页面，改为指定跳转到客户查询页 --%>
                    <input value="返回" type="button" onclick="location.href='customersearch.jsp'"/>

                </td>
            </tr>
        </table>
<%--比较request.getAttribute()和request.getAttribute()的区别--%>
        <h4 align="center" style="color:red"><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%><%=request.getParameter("msg") == null ? "" : request.getParameter("msg")%></h4>
        <hr>
        <table>
            <tr>
                <td colspan="2">宠物信息</td>
                <td>操作</td>
            </tr>

            <%
                for (Pet pet : user.getPets())
                {
            %>
            <tr>
                <td><img src="<%=pet.getPhoto()%>" width="48px" height="48px"></td>
                <td class="minWidth">姓名:<%=pet.getName()%><br/>生日:<%=pet.getBirthdate()%>
                </td>
                <td class="minWidth">
                    <a href="PetServlet?m=delete&pid=<%=pet.getId()%>&cid=<%=user.getId()%>" onclick=" return confirmDialog();">删除</a>|
                    <a href="VisitServlet?m=toAdd&customerId=<%=user.getId()%>&petId=<%=pet.getId()%>&petName=<%=URLEncoder.encode(pet.getName(), "UTF-8")%>">添加病例</a>|
                    <a href="VisitServlet?m=showHistory&petId=<%=pet.getId()%>">浏览病例</a></td>
            </tr>
            <%
                }
            %>

        </table>

    </div>
    <div id="footer"></div>
</div>
</body>
</html>
