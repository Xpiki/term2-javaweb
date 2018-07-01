<%@ page import="java.util.List" %>
<%@ page import="entity.Order" %>
<%@ page import="entity.Distributor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no,width=device-width,initial-scale=1,maximum-scale=1">
    <title>接单管理</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
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
                    <li><a href="IndexServlet?who=own">修改菜单</a></li>
                    <li><a href="EmployeeInfor.jsp">送餐员信息</a></li>
                    <li><a href="Order.jsp">订单信息</a></li>
                    <li><a>接单管理</a></li>
                    <li><a>......</a></li>
                    <li><a>......</a></li>
                </ul>
            </div>
        </div>
        <div class="nav">
            <ul id="ululul">
                <li><a>已接单</a></li>
                <li><a>配送中</a></li>
                <li><a>已送达</a></li>
                <li><a>退单</a></li>
            </ul>
        </div>
        <%
            List<List<Order>> orders = (List<List<Order>>) request.getAttribute("orders");
            List<Distributor> distributors = (List<Distributor>) request.getAttribute("distributors");
            String[] state = {"已接单", "配送中", "已送达", "退单"};
            for (int i = 0; i < orders.size(); i++) {
                if (state[i].equals("已接单")) {%>
        <div class="main" id="已接单">
            <%} else {%>
            <div class="hidden" id="<%=state[i]%>">
                <%
                    }
                    for (int j = 0; j < orders.get(i).size(); j++) {
                %>
                <div class="gridd">
                    <ul class="details">
                        <li><a>顾客姓名:<%=orders.get(i).get(j).getCustomerName()%>
                        </a></li>
                        <li><a>点餐内容:<%=orders.get(i).get(j).getFoodName()%>
                        </a></li>
                        <li><a>订单编号:<%=orders.get(i).get(j).getOrderid()%>
                        </a></li>
                        <li><a>送餐地址:<%=orders.get(i).get(j).getAddress()%>
                        </a></li>
                    </ul>
                    <div class="clear"></div>
                    <%
                        if (state[i].equals("已接单")) {
                    %>
                    <form action="PeisongServlet">
                        <div style="float: right;margin-right: 50px;margin-top: -100px">
                            <select name="dname"
                                    style="width: 70px;height: 25px;float: right;margin-right:30px;margin-top: 10px;border-color: #0F88EB">
                                <%
                                    for (int k = 0; k < distributors.size(); k++) {
                                %>
                                <option><%=distributors.get(k).getDname()%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                            <label style="float: right;margin-top: 10px;line-height: 25px;font-size: 13px">选择配送员：</label>
                        </div>
                        <input type="submit" value="确认订单并配送"
                               style="width: 120px;font-size: 13px;color:white;float: right;margin-top: -40px;line-height: 25px;margin-right:100px;background-color: #0f9ae0;border: 0px;border-radius: 20px">
                        <input type="hidden" name="orderid" value="<%=orders.get(i).get(j).getOrderid()%>">
                        <%}%>
                    </form>
                </div>
                <% }
                %>
            </div>
            <%
                }
            %>
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
    }
</script>