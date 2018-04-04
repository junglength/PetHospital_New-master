<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2018/1/17
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="ph.po.Visit"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="styles.css">
    <title>病历查询结果</title>
</head>
<body>
    <div id="container">
        <div id="header">
            <%@ include file="inc/header.inc"%>
        </div>
        <div id="content">
            <table class="wide">
                <thead>
                    <tr>
                        <td width="120">主治医生</td>
                        <td width="120">治疗时间</td>
                        <td width="200">病情描述</td>
                        <td width="200">治疗方案</td>
                    </tr>
                </thead>
            <%
                List<Visit> visits = (List<Visit>)request.getAttribute("visits");
                for (Visit v : visits) {
            %>
            <tr class="result">
                <td width="120">
                    <%=v.getVetName() %>
                </td>
                <td width="120">
                    <%=v.getVisitdate() %>
                </td>
                <td>
                    <%=v.getDescription() %>
                </td>
                <td>
                    <%=v.getTreatment() %>
                </td>
            </tr>
            <%
                }
            %>

            <tr class="cols4">
                <td colspan="4"><input type="button" value="返回" onclick="history.back(-1);" /></td>
            </tr>
            <tr class="cols4">
                <td colspan="4" class="info"><%=request.getAttribute("msg")==null?"":request.getAttribute("msg") %></td>
            </tr>
        </table>
    </div>
    <div id="footer"></div>
</div>
</body>
</html>
