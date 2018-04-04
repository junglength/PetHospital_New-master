<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2017/12/26
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="ph.po.Speciality"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>医生添加页面</title>
    <link href="styles.css" rel="stylesheet"/>
</head>
<body>
  <div>
    <!-- 将各个页面相同的公用代码保存成外部文件 使用静态导入的方式导入到当前页面 方便后期维护 -->
    <div id="header">
        <%@include file="inc/header.inc" %>
    </div>
    <div id="main">
        <form action="VetServlet" method="post">
            <input type="hidden" name="m" value="addVet">
            <table>
                <tr>
                    <td>医生姓名</td>
                    <td><input  name="vname"/></td>
                </tr>
                <tr>
                    <td>专业特长</td>
                    <td>
                        <select name="sid" style="width: 152px;" multiple="multiple">
                            <option disabled="disabled">请至少选择一项</option>
                            <%
                                List<Speciality>  specs=(List<Speciality>)request.getAttribute("specs");
                                if(specs!=null){
                                    for(Speciality s:specs){
                            %>
                            <option value="<%=s.getId()%>"><%=s.getName() %></option>
                            <%
                                    }

                                }
                            %>

                        </select>

                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td><input  type="submit" value="保存" /> <input type="reset" value="清空"/><input value="取消" type="button" onclick="location.href='vetsearch.jsp'" /></td>
                </tr>
            </table>

        </form>
        <h4><%=request.getAttribute("msg")==null?"":request.getAttribute("msg") %></h4>
    </div>
    <div id="footer">

    </div>
</div>
</body>
</html>
