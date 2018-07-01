<%@ page import="entity.Food" %>
<%@ page import="java.util.List" %>
<%@ page import="SqlBean.FoodDao" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/4
  Time: 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no,width=device-width,initial-scale=1,maximum-scale=1">
    <title>菜单修改</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <style>
        #addFood {
            width: 50px;
            height: 35px;
            background: #4096ee;
            background: -moz-linear-gradient(top, #4096ee 0%, #60abf8 56%, #7abcff 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #4096ee), color-stop(56%, #60abf8), color-stop(100%, #7abcff));
            background: -webkit-linear-gradient(top, #4096ee 0%, #60abf8 56%, #7abcff 100%);
            background: -o-linear-gradient(top, #4096ee 0%, #60abf8 56%, #7abcff 100%);
            background: -ms-linear-gradient(top, #4096ee 0%, #60abf8 56%, #7abcff 100%);
            background: linear-gradient(to bottom, #4096ee 0%, #60abf8 56%, #7abcff 100%);
            border-radius: 5px;
            color: white;
            text-align: center;
            line-height: 35px;
            margin-top: -37px;
        }

        .zhezhao {
            width: 100%;
            height: 100%;
            background-color: #000;
            filter: alpha(opacity=50);
            -moz-opacity: 0.5;
            opacity: 0.5;
            position: absolute;
            left: 0px;
            top: 0px;
            display: none;
            z-index: 1000;
        }

        .login
        {
            width:320px;
            height:400px;
            position:absolute;
            top:100px;
            left:50%;
            background-color: #FFFFFF;
            margin-left:-140px;
            display:none;
            z-index:1500;
            border-radius: 0.5%;
        }
        .login2
        {
            width:320px;
            height:460px;
            position:absolute;
            top:100px;
            left:50%;
            background-color: #FFFFFF;
            margin-left:-140px;
            display:none;
            z-index:1500;
            border-radius: 0.5%;
        }
        .input{
            width: 200px;
            height: 30px;
            margin-bottom: 15px;
            margin-right: 15px;
            float: right;
        }
        .lable{
            float: left;
            height: 30px;
            margin-bottom: 15px;
            margin-left: 15px;
            line-height: 30px;
        }

        .nav_slider a {
            display: inline-block;
            width: 100px;
            line-height: 35px;
            font-size: 18px;
            text-decoration: none;
            border-bottom: 2px solid #3cf;
        }
    </style>
</head>
<body>
<div class="wrap">
    <div class="header">
        <div class="logo" style="margin-top: 20px"><a class="navbar-brand" href="IndexServlet?who=cus"><img style="height: 40px" src="image/icon1.png"></a>
        </div>
        <div class="search">
            <form>
                <input type="text" value=""/>
                <input type="submit" value=""/>
            </form>
        </div>
        <div class="social">
            <ul>
                <li><a href="#">关于我们</a></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    <div class="content">
        <div class="sidebar">
            <div class="side">
                <h3>店家管理</h3>
                <ul>
                    <li><a >修改菜单</a></li>
                    <li><a href="EmployeeInfor.jsp">员工信息</a></li>
                    <li><a >订单信息</a></li>
                    <li><a href="OrderMangementServlet?flag=own">接单管理</a></li>
                    <li><a href="category.html">......</a></li>
                    <li><a href="category.html">......</a></li>
                </ul>
            </div>

        </div>
        <div class="nav">
            <ul id="ululul">
                <li><a class="chilern">热销</a></li>
                <li><a class="chilern">套餐</a></li>
                <li><a class="chilern">优惠</a></li>
                <li><a class="chilern">米饭</a></li>
                <li><a class="chilern">饮料</a></li>
            </ul>
            <div style="float: right;margin-right: 45px" id="addFood" onclick="insertfood()">添加</div>
        </div>

        <%
            request.setCharacterEncoding("utf-8");
            List<List<Food>> allTypeFood = (List<List<Food>>) request.getAttribute("allTypeFood");
            String[] type = {"热销", "套餐", "优惠", "米饭", "饮料"};
            for (int i = 0; i < allTypeFood.size(); i++) {
                if (type[i].equals("热销")) {
        %>
        <div class="main" id="<%=type[i]%>"><%
        } else {
        %>
            <div class="hidden" id="<%=type[i]%>"><%
                }

                for (int j = 0; j < allTypeFood.get(i).size(); j++) {
            %>
                <div class="grid">
                    <div class="prev"><img src="<%=allTypeFood.get(i).get(j).getImage()%>" alt=""/></div>
                    <ul class="details">
                        <li><a><%=allTypeFood.get(i).get(j).getFoodname()%>
                        </a></li>
                        <li><a>数量：<%=allTypeFood.get(i).get(j).getInventory()%>
                        </a></li>
                        <li><a>介绍：<%=allTypeFood.get(i).get(j).getIntroduct()%>
                        </a></li>
                    </ul>
                    <div style="margin-top: 135px">&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" value="修改" style="background-color: #0e93d7;color:#FFFFFF;border: 0px"
                               onclick='updatefood("<%=allTypeFood.get(i).get(j).getFoodname()%>","<%=allTypeFood.get(i).get(j).getInventory()%>","<%=allTypeFood.get(i).get(j).getPrice()%>","<%=allTypeFood.get(i).get(j).getType()%>","<%=allTypeFood.get(i).get(j).getIntroduct()%>")'>&nbsp;&nbsp;&nbsp;
                        <input type="button" value="删除" style="background-color: #0e93d7;color:#FFFFFF;border: 0px"
                               onclick='detetefood("<%=allTypeFood.get(i).get(j).getFoodname()%>")'>
                    </div>
                    <div class="clear"></div>
                </div>
                <%}%></div>
            <%
                }%>
            <div class="clear"></div>
        </div>
    </div>
    <div class="wrap">
        <div id="bg_footer">
            <div id="footer">
                <div class="copy">Copyright &copy;</div>
            </div>
        </div>
    </div>
    <div class="zhezhao" id="zhezhao"></div>
    <div class="login" id="login">
        <div class="login_nav">
            <div class="nav_slider" style="height: 50px;text-align: center;margin-top: 10px;margin-bottom: 20px">
                <a class="signin focus" style="width: 150px">修改菜品信息</a>
            </div>
        </div>
        <form action="UpdateServlet">
            <div class="input_signu">
                <label class="lable">菜品名称：</label><input class="input" id="foodname" type="text" name="foodname">
                <label class="lable">菜品数量：</label><input class="input" id="foodnum" type="text" name="foodnum">
                <label class="lable">菜品价格：</label><input class="input" id="foodprice" type="text" name="foodprice">
                <label class="lable">菜品介绍：</label><input class="input" id="introduce" type="text" name="introduce">
                <label class="lable">菜品类型：</label><input class="input" id="type" type="text" name="type">
                <input type="submit" id="bclose" class="button" value="确认" style="margin-left: 130px;margin-top: 20px">
                <input type="button" id="btclose" class="button" value="取消" style="margin-left: 10px;margin-top: 20px">
            </div>
        </form>
    </div>

    <div class="login2" id="addf">
        <div class="login_nav">
            <div class="nav_slider" style="height: 50px;text-align: center;margin-top: 10px;margin-bottom: 20px">
                <a class="signin focus" style="width: 150px">插入菜品信息</a>
            </div>
        </div>
        <form action="InsertFoodServlet">
            <div class="input_signu">
                <label class="lable">菜品名称：</label><input class="input" id="foodname2" type="text" name="foodname">
                <label class="lable">商家名字：</label><input class="input" id="bname" type="text" name="bname" value="商院小炒">
                <label class="lable">菜品数量：</label><input class="input" id="foodnum2" type="text" name="foodnum">
                <label class="lable">菜品价格：</label><input class="input" id="foodprice2" type="text" name="foodprice">
                <label class="lable">菜品介绍：</label><input class="input" id="introduce2" type="text" name="introduce">
                <label class="lable">菜品类型：</label><input class="input" id="type2" type="text" name="type">
                <label class="lable">菜品图片：</label><input class="input" id="image" type="text" name="image" value="image/noPicture.png">
                <input type="submit" id="bclose2" class="button" value="确认" style="margin-left: 130px;margin-top: 20px">
                <input type="button" id="btclose2" class="button" value="取消" style="margin-left: 10px;margin-top: 20px">
            </div>
        </form>
    </div>
</div>
</body>
</html>
<script>
    document.getElementById("ululul").onclick = function () {
        var src = event.srcElement || event.target;
        var a = document.getElementById(src.innerHTML);
        var b = document.getElementsByClassName("main");
        b[0].className = "hidden";
        a.className = "main";
    };


    var zhezhao = document.getElementById("zhezhao");
    var login=document.getElementById("login");
    var login2 = document.getElementById("addf");
    var btclose=document.getElementById("btclose");
    // var addfood = document.getElementById("addfood");
    var btclose2 = document.getElementById("btclose2");

    btclose.onclick=function()
    {
        zhezhao.style.display="none";
        login.style.display="none";
    };
    btclose2.onclick=function()
    {
        zhezhao.style.display="none";
        login2.style.display="none";
    };
    // addfood.onclick=function () {
    //     zhezhao.style.display = "block";
    //     login2.style.display="block";
    // };

    function detetefood(b) {
        location.href = "DeleteServlet?&foodName=" + b;
    }

    function insertfood() {
        zhezhao.style.display = "block";
        login2.style.display="block";
    }

    function updatefood(name, num, price, type, introduce) {
        zhezhao.style.display = "block";
        login.style.display="block";
        $("#foodname").val(name);
        $("#foodnum").val(num);
        $("#foodprice").val(price);
        $("#type").val(type);
        $("#introduce").val(introduce);
    }
</script>