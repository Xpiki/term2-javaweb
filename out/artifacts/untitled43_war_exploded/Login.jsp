<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/4
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<%
        if (request.getParameter("flag").equals("0")) {
%>
<script>
    (function tck() {
        var boo = confirm('密码或者用户名错误点击确定重新登陆，取消退出登录');
        //confirm 会返回你选择的选项,然后可以依据选择执行逻辑
      if(boo==false){
            location.href="toServlet.jsp"
        }
    })();
</script>
<%
    }else if (request.getParameter("flag").equals("2")){
%>
<script>
    (function tck() {
        alert("成功注册，请登录");
    })();
</script>
<%
    }
%>
<div class="login_cont">
    <div class="login_nav">
        <div class="nav_slider">
            <a href="Register.jsp?flag=0" class="signup">注册</a>
            <a href="Login.jsp" class="signin focus">登录</a>
        </div>
    </div>
    <form action="/LoginServlet">
        <div class="input_signin active">
            <input class="input" id="login_user_name" type="text" aria-label="用户名" placeholder="用户名" name="username">
            <input type="hidden" name="login" value="0">
            <div class="hint">请输入用户名</div>
            <input class="input" id="login_password" type="password" aria-label="密码" placeholder="密码" name="pwd">
            <div class="hint">请输入密码</div>
            <input type="submit" id="button" class="button" value="登录">
            <div class="forget">
                <a href="forget.html">忘记密码？</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
