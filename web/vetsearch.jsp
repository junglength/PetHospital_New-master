<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2017/12/24
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>医生查询页面</title>
    <link href="styles.css" rel="stylesheet"/>
</head>
<body>
    <div>
    <div id="header">
        <%@ include  file="inc/header.inc"%>
    </div>
    <div id="main">
        <form action="VetServlet" method="post">
            <input type="hidden" name="m" value="search">
            <!-- type="hidden"  隐藏表单控件  用来传递值  这个控件在前台页面不显示 -->
            <table>
                <tr>
                    <td>医生姓名</td>
                    <td><input  name="vname" title="按医生姓名查询"/></td>
                </tr>
                <tr>
                    <td>所属专业</td>
                    <td><input  name="sname" title="按所属专业查询"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input  type="submit" value="查询" /> <input type="reset" value="清空"/><a href="VetServlet?mode=newVet"  title="转到添加新医生页面">添加新医生</a><a href="VetServlet?mode=newSpec"  title="转到添加新专业页面">添加新专业</a></td>
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
