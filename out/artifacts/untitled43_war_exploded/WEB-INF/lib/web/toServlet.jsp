<%@ page import="java.util.function.ToIntBiFunction" %>
<%@ page import="java.io.IOException" %>
<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: AYF
  Date: 2018/6/8
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>toServlet.jsp</title>
</head>
<body>
//作为各个页面跳转到Servlet的中间页面 防止报错
<%

    User user = (User) session.getAttribute("user");
    //如果没有method（首次进入页面）或者method等于1 跳转到IndexServlet
        if(request.getParameter("method")==null||request.getParameter("method").equals("1")){
            response.sendRedirect("IndexServlet?who=1");
        }
        //如果method等于2 跳转到CusOrderMangementServlet
        else if(request.getParameter("method").equals("2")){
            response.sendRedirect("CusOrderMangementServlet");
        }
%>
</body>
</html>
