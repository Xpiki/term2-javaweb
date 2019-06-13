<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/4
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no,width=device-width,initial-scale=1,maximum-scale=1">
    <title>个人信息页</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
</head>
<body>
<div class="login_cont">
    <div class="login_nav">
        <div class="nav_slider">
            <a  class="signup focus">修改信息</a>

        </div>
    </div>
    <form>
        <div class="input_signup active">
            <div>请输入新的的用户名</div>
            <input class="input" id="user_name" type="text" aria-label="用户名（包含字母／数字／下划线" placeholder="用户名">
            <div class="hint">请填写符合格式的用户名</div>
            <div >请输入新的邮箱</div>
            <input class="input" id="user_email" type="text" aria-label="邮箱" placeholder="邮箱">
            <div class="hint">请填写邮箱</div>
            <div>请输入新的手机号</div>
            <input class="input" id="phone" type="text" class="account" aria-label="手机号（仅支持中国大陆）" placeholder="手机号（仅支持中国大陆）">
            <div class="hint">请输入手机号</div>
            <div >请输入新的的密码</div>
            <input class="input" id="password" type="password" aria-label="密码" placeholder="密码（不少于 6 位）">
            <div class="hint">请填写符合格式的密码</div>
            <div >请再次输入密码</div>
            <input class="input" id="repassword" type="password" aria-label="密码" placeholder="再次输入密码">
            <div class="hint">请再次输入密码</div>
            <input type="submit" id="submit" class="button" name="button" value="提交">
        </div>
    </form>

</div>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/form.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/login_ajax.js"></script>
</body>
</html>
