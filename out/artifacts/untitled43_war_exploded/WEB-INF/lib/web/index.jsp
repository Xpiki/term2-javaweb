<%@ page import="entity.Food" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/indexcss.css">
<script src="js/shopnav.js"></script>
<link rel="stylesheet" href="css/service.css">

<link href="css/demo.css" rel="stylesheet" media="all">
<script src="jquery.nav.js"></script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>首页</title>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
%>
<!-- header -->
<div class="navbar-fixed-top top" role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="Login.jsp"><b>饿了吗</b></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="IndexServlet">首页</a></li>
                <li><a id="cusOrder">我的订单</a></li>
                <li><a href="OwnerLogin.jsp?flag=1">卖家入口</a></li>
                <li><a href="questionlist.html">问答</a></li>

            </ul>
            <%
                if (user == null) {
            %>
            <div class="user" id="logControll" ng-controller="navUserController"
                 style="position: absolute; top: 25px; right: 60px;">
                <span class="glyphicon glyphicon-user"></span>
                <span id="userlongin"><a href="Login.jsp?flag=1">登录</a>|<a href="Register.jsp">注册</a></span>
                <%--<span class="user-name" style="cursor:pointer"onclick="personalPage(this)">{{navUsername}}</span>--%>
                <%--<span id="logout" onclick="logout()" style="display:none;margin-right:20px;color:#DDD;cursor:pointer;">退出</span>--%>
            </div>
            <%
            } else {
            %>
            <div class="user" id="logControll" ng-controller="navUserController"
                 style="position: absolute; top: 25px; right: 60px;">
                <span style="font-family: 宋体;font-size: 15px"> 欢迎光临小店</span>&nbsp;&nbsp;
                <span id="userlongin" style="font-family: 宋体;font-size: 15px"><%= user.getUsername()%>&nbsp;|&nbsp;<span
                        type="text" id="exite" value=""> 退出登录</span></span>
                <%--<span class="user-name" style="cursor:pointer"onclick="personalPage(this)">{{navUsername}}</span>--%>
                <%--<span id="logout" onclick="logout()" style="display:none;margin-right:20px;color:#DDD;cursor:pointer;">退出</span>--%>
            </div>
            <%
                }%>

        </div>
    </div>

</div>
<!-- //header -->
<%--ad--%>
<div id="ad-carousel" class="carousel slide" data-ride="carousel">
    <%--圆点按钮--%>
    <ol class="carousel-indicators">
        <li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#ad-carousel" data-slide-to="1"></li>
        <li data-target="#ad-carousel" data-slide-to="2"></li>
    </ol>
    <%--圆点按钮--%>
    <div class="carousel-inner">
        <%--food1--%>
        <div class="item active">
            <img src="image/food1.jpg" alt="0 slide">
            <div class="container">
                <div class="carousel-caption"
                     style="position: absolute; top: 185px;width:250px;margin-left:auto;margin-right:auto;">

                </div>
            </div>

        </div>
        <%--food2--%>
        <div class="item">
            <img src="image/food2.jpg" alt="1 slide">
            <div class="container">
                <div class="carousel-caption"
                     style="position: absolute; top: 185px;width:250px;margin-left:auto;margin-right:auto;">
                </div>
            </div>
        </div>
        <%--food3--%>
        <div class="item">
            <img src="image/food3.jpg" alt="2 slide">
            <div class="container">
                <div class="carousel-caption"
                     style="position: absolute; top: 185px;width:250px;margin-left:auto;margin-right:auto;">
                </div>
            </div>
        </div>


    </div>
    <a class="left carousel-control" href="#ad-carousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span></a>
    <a class="right carousel-control" href="#ad-carousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span></a>
    <div style="position: absolute; left: 100px; top: 100px;"></div>
</div>
<%--ad--%>
<div id="shopnav">
    <div class="find_nav">
        <div class="find_nav_left">
            <div class="find_nav_list">
                <ol id="olclick" class="ololol">
                    <li class="find_nav_cur" >所有商品</li>
                    <li class="">用户评价</li>
                    <li class="">商家信息</li>
                    <li class="sideline" id="side"></li>
                </ol>
            </div>
        </div>

        <a class="search_logo" href="">搜索</a>
    </div>
</div>

<div id="main">

    <div class="container-fluid" ID="container">
        <div class="row-fluid" id="menunav">
            <div class="scrollspy-nav col-sm-8">
                <div id="shopmenunav">
                    <ul id="nav">
                        <li class="current"><a href="#热销">热销</a></li>
                        <li><a href="#套餐">套餐</a></li>
                        <li><a href="#优惠">优惠</a></li>
                        <li><a href="#米饭">米饭</a></li>
                        <li><a href="#饮料">饮料</a></li>
                    </ul>
                </div>
                <div id="shopmenumain">
                    <%
                        request.setCharacterEncoding("utf-8");
                        String[] type = {"热销", "套餐", "优惠", "米饭", "饮料"};
                        List<List<Food>> allTypeFood = (List<List<Food>>) request.getAttribute("allTypeFood");
                        for (int i = 0; i < allTypeFood.size(); i++) {
                    %>
                    <div id="<%=type[i]%>">
                        <h3 style="padding: 20px 0 10px 15px;font-size: 20px;"><%=type[i]%>
                            <span style="font-size: 12px;color: #999;">大家喜欢吃，才叫真好吃。</span></h3>
                        <%
                            for (int j = 0; j < allTypeFood.get(i).size(); j++) {
                                Food food = allTypeFood.get(i).get(j);
                        %>
                        <form action="shopcart.jsp">
                        <div class="menufood">
                            <span class="col-1"><img class="menufoodimg" src="<%=food.getImage()%>"></span>
                            <div class="col-2">
                                <h3 class="menufoodname"><%=food.getFoodname()%>
                                    <span class="evaluation icon-star">(当前余量:<%=food.getInventory()%>)</span>
                                    <input type="hidden" name="foodname" VALUE="<%=food.getFoodname()%>">
                                    <% if (user!=null){
                                        %>

                                    <input type="hidden" name="username" VALUE="<%=user.getUsername()%>">
                                    <%
                                    }
                                    %>
                                </h3>

                                <span>简介:<%=food.getIntroduct()%></span>
                            </div>
                            <span class="col-3 menufoodprice">¥<%=food.getPrice()%></span>
                            <% if (user!=null){
                            %>
                            <span class="col-4" ><input  type="submit" class="menubutton" value="加入购物车"></span>
                            <%
                                }
                                else {
                            %>
                            <span class="col-4" ><input  type="button" class="menubutton" value="请先登录"></span>
                            <%
                            }
                            %>
                        </div>
                        </form>
                        <%
                            }
                        %>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="col-sm-4" style="margin-top: 10px;float: right;">
                <div id="shopnotice">
                    <h4 class="shoptitle">商家公告</h4>
                    <p class="noticefont">本店已开张，欢迎新老顾客光临！</p>
                    <div id="deliverynote">
                        <b class="noticefont" style="">配送说明:</b>
                        <p class="noticefont">配送费¥2||起送价¥20||平均送达时间28分钟</p>
                    </div>
                    <div class="box">
                        <ul>
                            <li class="weixin">
                                <div class="weixin-logo"></div>
                            </li>
                            <li class="idea"></li>
                            <li class="app">
                                <div class="app-logo"></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script type="text/javascript">
     document.getElementById("olclick").onclick = function (e) {//当点击ol时
         var target = e.target;//获取当前点击的li 赋给target
         var children = this.children;    //获取ol里面的所有li元素集合children
         var ddd = document.getElementById("side");//将id=side 的 li 赋给ddd
         for (i = 0; i < children.length; i++) {//遍历所有li（children）
             if(target == children[i]){//当点击的li(target)=children[i],取出i值 就能知道点击的li（target）是ol中第几个（i+1）li了
                 if(i==0){
                     children[0].className="find_nav_cur";//如果是第一个li就把第一个li的classname 改成 find_nav_cur 其他li改成空
                     children[1].className="";
                     children[2].className="";
                     ddd.style.left='0px'//改变ddd的位置·
                 }else if(i==1){
                     children[1].className="find_nav_cur";
                     children[0].className="";
                     children[2].className="";
                     ddd.style.left='100px'
                 }else if(i==2){
                     children[2].className="find_nav_cur";
                     children[0].className="";
                     children[1].className="";
                     ddd.style.left = '200px'
                 }
             }
         }
     };
</script>
<script>
    $(window).scroll(function () {
        if ($(".navbar").offset().top > 50) {
            $(".navbar-fixed-top").addClass("top-nav");
        } else {
            $(".navbar-fixed-top").removeClass("top-nav");
        }
    })
</script>
<script>
    document.getElementById("cusOrder").onclick = function () {
        <% if (user==null){%>
        alert("请先登录，或者注册后登录,亲！");
        <%}
        else{
            String username = user.getUsername();
        %>
            location.href = "CusOrderMangementServlet?username=<%=username%>";
        <%}%>
    };
    document.getElementById("exite").onclick = function () {
        <%session.removeAttribute("user");%>
        location.href = "toServlet.jsp?method=1";
    };
</script>
<%--左侧导航栏--%>
<script>

    $(document).ready(function() {

        $('#nav').onePageNav();

    });

</script>