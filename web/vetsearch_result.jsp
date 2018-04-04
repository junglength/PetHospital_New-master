<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2017/12/26
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="ph.po.Speciality"%>
<%@page import="ph.po.Vet"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>医生查询页面</title>
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
        <%@include file="inc/header.inc" %>
    </div>
    <div id="main">
        <table>
            <tr>
                <td>医生姓名</td>
                <td>专业特长</td>
            </tr>

            <%
                List<Vet> vets = (List<Vet>) request.getAttribute("vets");
                for (Vet vet : vets) {
            %>
            <tr class="result">
                <td><%=vet.getName()%></td>
                <td>
                    <%
                        for(Speciality spec:vet.getSpecs()){
                    %>
                    <span><%=spec.getName()%></span>
                    <%
                        }
                    %>
                </td>
                <td><a href="VetServlet?mode=deleteVet&vetId=<%=vet.getId()%>&vetName=<%=vet.getName()%>" onclick=" return confirmDialog();">删除</a></td>
            </tr>
            <%
                }
            %>

            <tr>
                <td></td>
                <td><input value="返回" type="button" onclick="history.back(-1)" /></td>
            </tr>
        </table>

        <h4 align="center" style="color:red"><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%></h4>
    </div>
    <div id="footer"></div>
</div>
</body>
</html>
