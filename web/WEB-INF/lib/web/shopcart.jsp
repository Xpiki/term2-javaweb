<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="SqlBean.SqlBean" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/6/8
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/allocate-info.css"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String foodname=request.getParameter("foodname");
    String username=request.getParameter("username");
    Connection conn = null;
    SqlBean sqlBean=new SqlBean();
    conn=sqlBean.sqlconnection();

    String sql = "Select foodname,price,inventory,type,image,introduct from menus where foodname=?";

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1,foodname);
        rs=pstmt.executeQuery();
        while(rs.next())
        {%>

<html>
<head>
    <title>Title</title>
</head>
<body>


<form action="/OrderInsertServlet">
    <div class="bg bg-blur"></div>
    <div id="iconimg"><img  src="image/shopicon.png"></div>
<div class="container-fluid  allocate"  style=" margin-top: 280px;width: 1000px;height: 600px;">
    <div class="row allocate-row">
        <label class="allocate_name"></label>
        <div class="col-xs-6">
            <div class="allocate_show">
                <input type="hidden" name="username" VALUE="<%=username%>">
                <h4 class="allocate_show_title">商品名称：<input  readonly="readonly" type="text"  name="foodname" value="<%=rs.getString("foodname")%>" ></h4>
                <h4 class="allocate_show_title">商品单价：<input id="foodprice" readonly="readonly" type="text" name="price" value="<%=rs.getString("price")%>" ></h4>
                <h4 class="allocate_show_title">商品库存：<input id="limitnum" style="color: red" readonly="readonly" type="text"  value="<%=rs.getInt("inventory")%>" ></h4>
                <h4 class="allocate_show_title">商品简介：<input  readonly="readonly" type="text"  value="<%=rs.getString("introduct")%>" ></h4>

                <h4 class="allocate_show_title">商品数量：
                    <input type="button" id="delone" value="-" onclick="delOne()" style="height: 100%;width:30px" />
                    <input type="text" name="quantity" id="num"  value="1"  onkeyup="limitInput(this);"/>
                    <input type="button" id="addone" value="+" onclick="addOne()" style="height: 100%;width:30px" /></h4>


                <h4 class="allocate_show_title">口味/偏好：</h4>
                <div class="allocate_list" id="show-spec"></div>
                <div class="allocate_show_para" id="show-fabric"></div>
                <p class="allocate_show_para" id="show-proposal"></p>
            </div>
        </div>
        <div class="col-xs-6">
            <div class="allocate-show-picbox">
                <img  class="img-responsive "  style="width: 100%;height:300px" src="<%=rs.getString("image")%>">
                <input type="hidden" name="image" VALUE="<%=rs.getString("image")%>">
            </div>
        </div>
    </div>

    <div class="row allocate-row">
        <label class="allocate_name">口味:</label>
        <div class="col-xs-12">
            <div class="checkbox" id="proposal">
                <label style="color: #daecef;">
                    <input type="checkbox" value="不加辣">不加辣
                </label>
                <label style="color: #daecef;">
                    <input type="checkbox" value="加辣"> 加辣
                </label>

            </div>
        </div>

    </div>
    <div class="row allocate-row">
        <label class="allocate_name">偏好(默认不加):</label>
        <div class="col-xs-12">
            <div class="allocate_list" id="hotpin">
                <button type="button" class="btn-allocate btn-normal" id="like1" value="加葱">加葱</button>
                <button type="button" class="btn-allocate btn-normal"  id="like2" value="加香菜">加香菜</button>
            </div>
        </div>
    </div>
    <div class="row allocate-row">
        <label class="allocate_name">总价:</label>
        <textarea type="text" id="numprice" readonly="readonly" style="margin-left: 10px;width: 50px;height: 20px;"></textarea>
    </div>

    <div class="row allocate-row">
        <label class="allocate_name">备注:</label>
        <textarea type="text" name="note" id="notes" style="margin-left: 10px;width: 100%;height: 50px;"></textarea>
    </div>

    <div class="row allocate-row text-center">
        <div class="btn-box">
            <input type="button" name="Submit" class="btn reset-btn" onclick="javascript:history.back(-1);" value="返回上一页"></button>
            <input type="submit" class="btn save-btn" value="确认">
        </div>
    </div>
</div>
</form>
    <% }
    } catch (SQLException e) {
    e.printStackTrace();
    } finally {
        sqlBean.closeSql(conn,pstmt,rs);
    }
    %>

</body>
</html>
<script>
    $(function(){
//        $("#proposal").click(function(){
//            var text1=$("#proposal").val();
//            $("#notes").val($("#notes").val()+text1);
//        })
//        $("#like1").click(function(){
//            var text2=$("#like1").val();
//            $("#notes").val($("#notes").val()+text2);
//        })
//        $("#like2").click(function(){
//            var text3=$("#like2").val();
//            $("#notes").val($("#notes").val()+text3);
//        })
        //偏好，多选
//        $("#spec button").each(function(){
//            $(this).click(function(){
//                if($("#show-spec button").hasClass("show-spec"+$(this).index())){
//                    $("#show-spec .show-spec"+$(this).index()).remove();
//                    var text=$(this).val();
//                    $("#notes").val($("#notes").val()+text);
//                }else{
//                    $("#show-spec").append("<button  class='btn-allocate btn-tick show-spec"+$(this).index()+"'>"+$(this).text()+"</button>")
//                    var text=$(this).val();
//                    $("#notes").val($("#notes").val()+text);
//                }
//            })
//        })
        $("#hotpin button").each(function(){
            $(this).click(function(){
                if($("#show-spec button").hasClass("show-hotpin"+$(this).index())){
//                    $("#show-spec .show-hotpin"+$(this).index()).remove()
                    var text=$(this).val();
                    $("#notes").val("");

                }else{
//                    $("#show-spec").append("<button  class='btn-allocate btn-tick show-hotpin"+$(this).index()+"'>"+$(this).text()+"</button>")
                    var text=$(this).val();
                    $("#notes").val($("#notes").val()+","+text);
                }
            })
        })
        //口味
        $("#proposal input[type='checkbox']").click(function(){
            $("#proposal input[type='checkbox']").removeAttr("checked");
            $(this).prop("checked","checked");
            var text=$(this).val();
            $("#notes").val("");
        })
        $("#proposal input[type='checkbox']").click(function(){
            $("#show-proposal span").remove();
            $("#show-proposal").append("<span>"+$(this).val()+"</span>")
            var text=$(this).val();
            $("#notes").val($("#notes").val()+text);
        })
    })
</script>

<script>
    var num = $("#num");
    var foodprice = $("#foodprice");
    var numprice = $("#numprice");
    var limitnum = $("#limitnum");

    numprice.text(foodprice.val());

    function updateMoney(){
        var tt = num.val(); //当前数量
        var price=foodprice.val();
        var total =  price*tt;   //输入框中的份额数与单价相乘得到总金额
        numprice.text(total);
        if(num.val()<=0){
            num.text(1);
            numprice.text(price);
        }
    }
    $(function() {
        $("#addone").click(function () {
            num.val(parseInt(num.val()) + 1); //点击加号输入框数值加1


            if (num.val() >parseInt(limitnum.val())) {
                num.val(parseInt(num.val())-1 ); //最大值为
            }
            updateMoney();  //显示总金额
        });
        $("#delone").click(function () {
            num.val(parseInt(num.val()) - 1); //点击减号输入框数值减1
            if (num.val() <= 0) {
                num.val(parseInt(num.val()) + 1); //最小值为1
            }
            updateMoney();
        });
    })
    function limitInput(o){
        var value=o.value;
        var min=1;
        var max=10;
        if(parseInt(value)<min){
            alert('订单数量不能小于1!请确认后重新输入!');
            o.value='1';
        }
        else if (parseInt(value)>parseInt(limitnum.val()))
        {
            alert('订单数量不能大于库存!请确认后重新输入!');
            o.value=parseInt(limitnum.val());
        }
        updateMoney();
    }

</script>
