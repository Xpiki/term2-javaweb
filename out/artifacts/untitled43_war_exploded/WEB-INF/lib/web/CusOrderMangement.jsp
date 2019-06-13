<%@ page import="java.util.List" %>
<%@ page import="entity.Order" %>
<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/4
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%--0612改--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>顾客订单管理</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/indexcss.css">
    <link rel="stylesheet" href="css/cusordermangement.css">
</head>
<body>
<%

    String username = (String) request.getAttribute("username");
%>
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
            <a class="navbar-brand" href="index.jsp"><b>饿了吗</b></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <%--返回上一页--%>
                <li class="active"><a href="/IndexServlet?username=<%=username%>">首页</a></li>
                <li><a>我的订单</a></li>
                <li><a href="resouces.html">资源</a></li>
                <li><a href="questionlist.html">问答</a></li>
            </ul>
            <div class="user" id="logControll" ng-controller="navUserController"
                 style="position: absolute; top: 25px; right: 60px;">
                <span class="glyphicon glyphicon-user"></span>
                <span id="userlongin"><a><%=username%></a>&nbsp;|&nbsp;<a href="Register.jsp">我的信息</a></span>
            </div>
        </div>
    </div>
</div>
<div class="main" style="margin-top: 80px;width: 75%; margin-left:auto; margin-right:auto">
    <div style="border-bottom: 0px solid aliceblue;">
        <ol class="breadcrumb col-12" id="ol" style="background-color: #FFFFFF">
            <li class="liclick focue">全部订单</li>
            <li class="liclick">当月订单</li>
            <li class="liclick">当日订单</li>
        </ol>
        <div class="orderRight" id="right1">最多查看当年所有订单</div>
        <div class="orderRight hide" id="right2">
            <input type="button" value="" id="month" style="width: 100px">&nbsp;&nbsp;&nbsp;
            <input type="button" value="上个月" id="monthup">&nbsp;&nbsp;&nbsp;
            <input type="button" value="下个月" id="monthdown">
        </div>
        <div class="orderRight hide" id="right3">
            <input type="button" value="" id="day" style="width: 100px">&nbsp;&nbsp;&nbsp;
            <input type="button" value="上一天" id="dayup">&nbsp;&nbsp;&nbsp;
            <input type="button" value="下一天" id="daydown">
        </div>
    </div>
    <div style="margin-top: 30px" class="col-12">
        <table class="orderTable" style="width: 100%;border-collapse:collapse; border-spacing:0px 15px">
            <tr class="fristTr" style="background-color: #FFFFFF">
                <td class="col-1" style="width: 100px">商品信息</td>
                <td class="col-2">备注</td>
                <td class="col-2">数量</td>
                <td class="col-1">金额</td>
                <td class="col-2">日期</td>
                <td class="col-2">状态</td>
                <td class="col-2">操作</td>
            </tr>
            <tr style="height: 25px"></tr>
            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                for (int i = 0; i < orders.size(); i++) {
                    Order order = orders.get(i);
            %>
            <form action="/ConfirmServlet">
            <tr class="othertr" style="background-color: #FFFFFF">
                <td class="col-1" style="width: 100px"><img src="<%=order.getImage()%>"
                                                            style="width: 100px;height: 100px">
                    <h6>菜名:<%=order.getFoodName()%></h6></td>
                <td class="col-2"><%=order.getNote()%>
                    <input type="hidden" name="orderid" value="<%=order.getOrderid()%>">

                </td>
                <td class="col-2"><%=order.getQuantity()%>
                    <input type="hidden" name="username" value="<%=username%>">
                </td>
                <td class="col-1" style="color: #ea1328;font-weight: bold">¥<%=order.getSumPrice()%>
                </td>
                <td class="col-2" style="width: 50px;"><%=order.getOrderTime()%>
                </td>
                <td class="col-2" style="color: #ea1328;font-weight: bold"><%=order.getState()%>
                </td>
                <td class="col-2 tdinput">


                    <% String state=order.getState();
                        if(state.equals("已送达")){
                    %>
                    <%--已送达--%>
                    <input type="button" value="评价" style="margin-top: 5px"><br>
                    <input type="button" value="已送达">
                    <% }
                        else if (state.equals("已接单"))
                        {
                    %>
                    <%--method=1,退单操作--%>
                    <input type="hidden" name="method" value="1">
                    <input type="submit" value="退单"><br>
                    <input type="button" value="已接单">
                    <%
                        }
                        else if (state.equals("退单"))
                        {
                    %>
                    <%--已退单--%>
                    <input type="button" value="已退单">
                    <%
                        }
                        else
                        {
                    %>
                    <%--配送中，method=2,确认收货--%>
                    <input type="hidden" name="method" value="2">
                    <input type="button" value="配送中"><br>
                    <input type="submit" value="确认收货">
                    <%
                        }
                    %>
                </td>
            </tr>
            </form>
            <tr style="height: 25px"></tr>
            <%
                }
            %>
        </table>
    </div>
</div>
</body>
</html>
<script>
    var Date = new Date; //获取一个时间对象
    var year = Date.getFullYear();//获取系统时间的年
    var month = Date.getMonth() + 1;//月
    var day = Date.getDate();//日
    document.getElementById("monthdown").onclick = function () {//点击下个月月份加1
        if (month < 12)
            month++;
        else {
            month = 1;
            year++;
        }
        document.getElementById("month").value = year + "年" + month + "月"//更新年月
    };
    document.getElementById("monthup").onclick = function () {//点击下个月月份减1
        if (month > 1)
            month--;
        else {
            month = 12;
            year--;
        }
        document.getElementById("month").value = year + "年" + month + "月"
    };
    var getday = function(a) {//传入月份
        var days;
//当月份为二月时，根据闰年还是非闰年判断天数
        if (a == 2)
            days = (year % 4 == 0 && year % 100 != 0) ? 29 : 28;
        else if (a == 1 || a == 3 || a == 5 || a == 7 || a == 8 || a == 10 || a == 12)
            days = 31; //月份为：1,3,5,7,8,10,12 时，为大月.则天数为31；
        else
            days = 30;  //其他月份，天数为：30.
        return days;//返回天数
    };
    document.getElementById("daydown").onclick = function () {
        if (day < getday(month))
            day++;
        else {
            month ++;
            day=1;
        }
        document.getElementById("day").value = month + "月" + day + "日"
    };
    document.getElementById("dayup").onclick = function () {
        if (day > 1)
            day--;
        else {
            month --;
            day=getday(month)
        }
        document.getElementById("day").value = month + "月" + day + "日"
    };
    document.getElementById("ol").onclick = function (e) {
        var target = e.target;    //获取对应目标元素
        var children = this.children;    //获取ol里面的所有li元素集合
        for (i = 0; i < children.length; i++) {
            if (target == children[i]) { //对比目标元素和li集合元素
                if (i == 0) {
                    //如果是第一个li就将 id 名字是 right1 的改为orderRight right2 right3改为orderRight hide 下面同理
                    document.getElementById("right1").className = "orderRight";
                    document.getElementById("right2").className = "orderRight hide";
                    document.getElementById("right3").className = "orderRight hide";
                    //将该li的class样式改为liclick focue其他li改为liclick
                    target.className = "liclick focue";
                    children[1].className = "liclick";
                    children[2].className = "liclick"
                }
                else if (i == 1) {
                    document.getElementById("right2").className = "orderRight";
                    document.getElementById("right1").className = "orderRight hide";
                    document.getElementById("right3").className = "orderRight hide";
                    target.className = "liclick focue";
                    children[0].className = "liclick";
                    children[2].className = "liclick";
                    document.getElementById("month").value = year + "年" + month + "月";

                } else if (i == 2) {
                    document.getElementById("right3").className = "orderRight";
                    document.getElementById("right1").className = "orderRight hide";
                    document.getElementById("right2").className = "orderRight hide";
                    target.className = "liclick focue";
                    children[1].className = "liclick";
                    children[0].className = "liclick";
                    document.getElementById("day").value = month + "月" + day + "日"
                }
            }
        }
    };
</script>


