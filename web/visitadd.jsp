<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2018/1/16
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="ph.po.Vet"%>
<%@page import="ph.po.Speciality"%>
<%@page import="java.util.List"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宠物病历添加页面</title>
    <link href="styles.css" rel="stylesheet" />
</head>
<body>
    <div>
    <!-- 将各个页面相同的公用代码保存成外部文件 使用静态导入的方式导入到当前页面 方便后期维护 -->
    <div id="header">
        <%@include file="inc/header.inc"%>
    </div>
    <div id="main">
        <form action="VisitServlet" method="post">
            <input type="hidden" name="m" value="save">
            <table>
                <tr>
                    <td>宠物姓名</td>
                    <td>
                        <%--petName, customerId和petId，这三个参数都来自customerdetail.jsp的添加病历链接--%>
                        <input name="pname" value="<%=request.getParameter("petName")%>"  disabled="disabled"/>
                        <input type="hidden" name="cid" value="<%=request.getParameter("customerId")%>" />
                        <input type="hidden" name="pid" value="<%=request.getParameter("petId")%>" />
                    </td>
                </tr>
                <tr>
                    <td>主治医生</td>
                    <td>
                        <select name="vid" style="width: 152px;">
                        <%
                            List<Vet> vets = (List<Vet>) request.getAttribute("vets");
                            if (vets != null)
                            {
                                for (Vet vet : vets)
                                {
                        %>
                        <option value="<%=vet.getId()%>"><%=vet.getName()%></option>
                        <%
                                }
                            }
                        %>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>病情描述</td>
                    <td><textarea name="description"></textarea></td>
                </tr>
                <tr>
                    <td>治疗方案</td>
                    <td><textarea name="treatment"></textarea></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="保存" />
                        <input type="reset" value="清空" />
                        <input value="取消" type="button" onclick="location.href='customersearch.jsp'" />
                    </td>
                </tr>
            </table>

        </form>
        <h4><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%></h4>
    </div>
    <div id="footer"></div>
</div>
</body>
</html>
