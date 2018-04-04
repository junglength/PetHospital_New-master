<%--
  Created by IntelliJ IDEA.
  User: hlzhang
  Date: 2018/1/30
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宠物查询页面</title>
    <link href="styles.css" rel="stylesheet"/>
</head>
<body>
<div>
    <div id="header">
        <%@ include  file="inc/header.inc"%>
    </div>
    <div id="main">
        <form action="PetServlet" method="post">
            <input type="hidden" name="m" value="search">
            <!-- type="hidden"  隐藏表单控件  用来传递值  这个控件在前台页面不显示 -->
            <table>
                <tr>
                    <td>宠物名字</td>
                    <td><input  name="petName" title="按宠物名字查询"/></td>
                </tr>
                <tr>
                    <td>宠物主人</td>
                    <td><input  name="ownerName" title="按宠物主人姓名查询"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input  type="submit" value="查询" /> <input type="reset" value="清空"/><a href="PetServlet?m=newPetAdd"  title="转到添加新宠物页面">添加新宠物</a></td>
                </tr>
            </table>
        </form>
        <h4 align="center" style="color:red" ><%=request.getAttribute("msg")==null?"":request.getAttribute("msg") %></h4>
    </div>
    <div id="footer">

    </div>
</div>
</body>
</html>
