<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/4
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no,width=device-width,initial-scale=1,maximum-scale=1">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <style>
        body {
            height: auto;
            width: auto;
            background-repeat: no-repeat;
            -webkit-background-size: 100%;
            background-size: 100%;
        }
        .input{
            background:none;
        }
    </style>
</head>
<%
    String flag = request.getParameter("flag");
    if (flag.equals("1")){
%>
<script>
    (function tck() {
        alert("账号名称已经存在，请重新注册")
    })();
</script><%
    }else if (flag.equals("2")){
%>
<script>
    (function tck() {
        alert("该手机帐号已经被注册，请重新注册或者找回密码")
    })();
</script><%
    }
%>
<body background="image/registerBG.png" id="background">
<div class="login_cont">
    <div class="login_nav">
        <div class="nav_slider">
            <a href="Register.jsp" class="signup focus">注册</a>
            <a href="Login.jsp?flag=1" class="signin">登录</a>
        </div>
    </div>
    <form>
        <div class="input_signup active">
            <input class="input" id="user_name" type="text" placeholder="用户名">
            <div class="hint">请填写符合格式的用户名</div>
            <input class="input" id="user_email" type="text" placeholder="邮箱">
            <div class="hint">请填写邮箱</div>
            <input class="input" id="phone" type="text" class="account" placeholder="手机号（仅支持中国大陆）">
            <div class="hint">请填写手机号</div>
            <input class="input" id="address" type="text" value="温州市瓯海区" placeholder="详细地址">
            <div class="hint">请填写地址</div>
            <input class="input" id="password" type="password" placeholder="密码（不少于 6 位）">
            <div class="hint">请填写符合格式的密码</div>
            <input class="input" id="repassword" type="password" placeholder="再次输入密码">
            <div class="hint">请再次输入密码</div>
            <input type="button" id="submit" class="button" value="注册">
        </div>
    </form>
</div>
</body>
</html>
<script>
    (function () {
        var hintText = {
            user_name: {right: "√用户名格式正确", wrong: "×用户名格式有误，请重新输入"},
            user_email: {right: "√邮箱格式正确", wrong: "×邮箱格式有误，请重新输入"},
            phone: {right: "√电话号码输入正确", wrong: "×电话号码输入有误，请重新输入"},
            address: {right: "√地址输入正确", wrong: "×该地址不在配送范围内，请重新输入（在提示信息后添加详细地址）"},
            password: {right: "√密码输入格式正确", wrong: "×请输入符合格式的密码"},
            repassword: {right: "√再次输入密码正确", wrong: "×两次输入不一致或密码格式不正确，请重新输入或密码格式不正确"}
        };
        var regEvent = function (node, event, func) {
            if (node.addEventListener)
                node.addEventListener(event, func);
            else if (node.attachEvent)
                node.attachEvent("on" + event, func);
            else
                node["on" + event] = func;
        };

        function regValue(id, i) {
            var flag = false,
                input = document.getElementById(id),
                value = input.value;
            switch (id) {
                case "user_name":
                    flag = /^[a-zA-Z0-9_]{4,16}$/.test(value.replace(/[\u0391-\uFFE5]/g, "nn"));
                    id = "user_name";
                    break;
                case "password":
                    flag = /^\S{6,16}$/.test(value);
                    id = "password";
                    break;
                case "repassword":
                    flag = document.getElementById("password").value == value && value != "" && value != null && (/^\S{6,16}$/.test(value));
                    break;
                case "user_email":
                    flag = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}/.test(value);
                    id = "user_email";
                    break;
                case "phone":
                    flag = /^((\(\d{2,3}\))|(\d{3}\-))?1[3,8,5,7]{1}\d{9}$/.test(value);
                    id = "phone";
                    break;
                case "address":
                    if (document.getElementById("address").value.substring(0, 6) == "温州市瓯海区")
                        flag = true;
                    break;
                default:
                    break;
            }
            if (flag) {
                index = 0;
                input.className = "right input";
                hint[i].className = "hint hint_right";
                hint[i].innerHTML = hintText[id].right;
            } else {
                input.className = "wrong input";
                hint[i].className = "hint hint_wrong";
                hint[i].innerHTML = hintText[id].wrong;
                index = 1;
            }
        };
        var inputs = document.getElementsByClassName("input"), id,
            hint = document.getElementsByClassName("hint"), index = 0;
        for (var j = 0; j < inputs.length; j++) {
            (function (i) {
                regEvent(inputs[i], "focus", function () {
                    hint[i].style.visibility = "visible";
                    id = inputs[i].id;
                });
                regEvent(inputs[i], "blur", function () {
                    regValue(id, i);
                });
            })(j)
        }
    })();
</script>
<script>
    $("#submit").click(function () {
        var userName = $("#user_name").val();
        var userPhone = $("#phone").val();
        var address = $("#address").val();
        var password = $("#password").val();
        if (userName==""||userPhone==null||address==null||password==null){
            alert("请填写完整信息！！");
        }else {
            location.href = "RegisterServlet?userName=" + userName + "&userPhone=" + userPhone + "&address=" + address + "&password=" + password;
        }
    })
</script>
