<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/4
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no,width=device-width,initial-scale=1,maximum-scale=1">
    <title>查询订单信息</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
</head>
<body>
<div class="wrap">
    <div class="header">
        <div class="logo"><a href="index.html"><img src="image/logo.png" /></a></div>
        <div class="search">
            <form>
                <input type="text" value="" />
                <input type="submit" value="" />
            </form>
        </div>
        <div class="social">
            <ul>
                <li><a href="#">关于我们</a></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    <div align=center>
        <div style=“width:960px; margin:0 auto; height:90px;”>
            <script>
                (function() {
                    var s = "_" + Math.random().toString(36).slice(2);
                    document.write('<div id="' + s + '"></div>');
                    (window.slotbydup=window.slotbydup || []).push({
                        id: '730419',
                        container: s,
                        size: '960,90',
                        display: 'inlay-fix'
                    });
                })();
            </script>
            <script src="http://dup.baidustatic.com/js/os.js"></script>
        </div>
    </div>
    <div class="content">
        <div class="sidebar">
            <div class="side">
                <h3>店家管理</h3>
                <ul>
                    <li><a href="OrderDinner.jsp">修改菜单</a></li>
                    <li><a href="EmployeeInfor.jsp">员工信息</a></li>
                    <li><a href="Order.jsp">订单信息</a></li>
                    <li><a href="OrderMangement.jsp">接单管理</a></li>
                    <li><a href="category.html">......</a></li>
                    <li><a href="category.html">......</a></li>

                </ul>
            </div>

        </div>
        <div class="nav">
            <ul>
                <li><a href="#">销量统计</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">...</a></li>
            </ul>
        </div>
        <div class="main">
            <div class="grid">
                <div class="prev"><a href="#"><img src="http://lorempixel.com/150/150/food/" alt="" /></a></div>
                <ul class="details">
                    <li><a href="single.html">红烧大排骨</a></li>
                    <li><a href="#">月售 10</a></li>
                    <li><a href="#">好评率 99%</a></li>
                    <div class="jia"><img src="Image/+++.psd/" alt=""/></div>

                </ul>
                <div class="clear"></div>
            </div>
            <div class="grid">
                <div class="prev"><a href="#"><img src="http://lorempixel.com/150/150/food/" alt="" /></a></div>
                <ul class="details">
                    <li><a href="#">番茄炒蛋</a></li>
                    <li><a href="#">月售 20</a></li>
                    <li><a href="#">好评率 98%</a></li>

                </ul>
                <div class="clear"></div>
            </div>
            <div class="grid">
                <div class="prev"><a href="#"><img src="http://lorempixel.com/150/150/food/" alt="" /></a></div>
                <ul class="details">
                    <li><a href="#">宫保鸡丁</a></li>
                    <li><a href="#">月售 24</a></li>
                    <li><a href="#">好评率 98%</a></li>

                </ul>
                <div class="clear"></div>
            </div>
            <div class="grid">
                <div class="prev"><a href="#"><img src="http://lorempixel.com/150/150/food/" alt="" /></a></div>
                <ul class="details">
                    <li><a href="#">黑椒牛肉</a></li>
                    <li><a href="#">月售 23</a></li>
                    <li><a href="#">好评率 98%</a></li>
                </ul>
                <div class="clear"></div>
            </div>
            <div class="grid">
                <div class="prev"><a href="#"><img src="http://lorempixel.com/150/150/food/" alt="" /></a></div>
                <ul class="details">
                    <li><a href="#">黑椒牛肉</a></li>
                    <li><a href="#">月售 23</a></li>
                    <li><a href="#">好评率 98%</a></li>
                </ul>
                <div class="clear"></div>
            </div>
            <div class="grid">
                <div class="prev"><a href="#"><img src="http://lorempixel.com/150/150/food/" alt="" /></a></div>
                <ul class="details">
                    <li><a href="#">黑椒牛肉</a></li>
                    <li><a href="#">月售 23</a></li>
                    <li><a href="#">好评率 98%</a></li>
                </ul>
                <div class="clear"></div>
            </div>

        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="wrap">
    <div id="bg_footer">
        <div id="footer">
            <div class="column-4-1">
                <h3>关于我们</h3>
                <ul>
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">关于我们</a></li>

                </ul>
            </div>
            <div class="column-4-1">
                <h3>关于我们</h3>
                <ul>
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">关于我们</a></li>

                </ul>
            </div>
            <div class="column-4-1">
                <h3>关于我们</h3>
                <ul>
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">关于我们</a></li>

                </ul>
            </div>
            <div class="column-4-1">
                <h3>关于我们</h3>
                <ul>
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">关于我们</a></li>

                </ul>
            </div>
        </div>
        <div class="clear"></div>
        <div class="copy">Copyright &copy; </div>
    </div>
</div>
</body>
</html>
