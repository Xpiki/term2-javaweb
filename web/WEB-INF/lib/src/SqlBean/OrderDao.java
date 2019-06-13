package SqlBean;

import entity.Evaluation;
import entity.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
//0612改
public class OrderDao extends SqlBean{
    //获取订单表中的信息，为顾客查询自己的订单信息
    public List<Order> getCusOrder(String username){
        String sql = "select orderid,foodname,image,note,quantity,sumprice,ordertime,state from orders WHERE customername ="+"'"+username+"'"+" order by orderid DESC ";
        Connection conn = sqlconnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Order> orders = new ArrayList<Order>();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                Order order = new Order();
                order.setOrderid(rs.getInt("orderid"));
                order.setFoodName(rs.getString("foodname"));
                order.setImage(rs.getString("image"));
                order.setNote(rs.getString("note"));
                order.setQuantity(rs.getInt("quantity"));
                order.setSumPrice(rs.getInt("sumprice"));
                order.setOrderTime( rs.getString("ordertime"));
                order.setState(rs.getString("state"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeSql(conn, pstmt, rs);
        }
        return orders;
    }
// 管理员分类（订单状态）查询所有订单信息
    List<List<Order>> allStateOrder = new ArrayList<List<Order>>();
    String[] orderState = {"已接单","配送中","已送达","退单","已评价"};
    public List<List<Order>> getOrders(){
        for (int i = 0; i < orderState.length; i++) {
            String sql = "select orderid,foodname,orders.customername,image,note,quantity,sumprice,ordertime,state,caddress from orders,customers WHERE orders.customername=customers.customername and state = " +"'"+orderState[i]+"' order by orderid DESC ";
            Connection conn = sqlconnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            List<Order> orders = new ArrayList<Order>();
            try {
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()){
                    Order order = new Order();
                    order.setOrderid(rs.getInt("orderid"));
                    order.setCustomerName(rs.getString("customername"));
                    order.setFoodName(rs.getString("foodname"));
                    order.setImage(rs.getString("image"));
                    order.setNote(rs.getString("note"));
                    order.setQuantity(rs.getInt("quantity"));
                    order.setSumPrice(rs.getInt("sumprice"));
                    order.setOrderTime( rs.getString("ordertime"));
                    order.setState(rs.getString("state"));
                    order.setAddress(rs.getString("caddress"));
                    orders.add(order);
                }
                allStateOrder.add(orders);
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                this.closeSql(conn, pstmt, rs);
            }
        }
        return allStateOrder;
    }

    //插入订单 顾客确认订单时插入一条订单
    public int insert(Order order){
        String sql="insert into orders(customername,foodname,quantity,sumprice,note,image)" +
                " values (?,?,?,?,?,?)";
        List<Object>pValues=new ArrayList<Object>();
        pValues.add(order.getCustomerName());
        pValues.add(order.getFoodName());
        pValues.add(order.getQuantity());
        pValues.add(order.getSumPrice());
        pValues.add(order.getNote());
        pValues.add(order.getImage());
        int rows=0;
        try {
            rows=this.executeUpdate(sql,pValues);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows;
    }

    public int ConfirmOrder(Order order){
        String sql="update orders set state='已送达' where orderid=?";
        List<Object>pValues=new ArrayList<Object>();
        pValues.add(order.getOrderid());

        int rows=0;
        try {
            rows=this.executeUpdate(sql,pValues);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows;
    }
    public int ChargeBack(Order order){
        String sql="update orders set state='退单' where orderid=?";
        List<Object>pValues=new ArrayList<Object>();
        pValues.add(order.getOrderid());
        int rows=0;
        try {
            rows=this.executeUpdate(sql,pValues);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows;
    }
    //为订单插入一名配送员（数据库中会执行触发器自动将订单状态修改为 配送中 ）
    public int addDritroduce(int orderid,String dname){
        CallableStatement cstmt = null;
        Connection conn = sqlconnection();
        int row = 0;
        try {
            cstmt = conn.prepareCall("{call p_delivery(?,?)}");
            cstmt.setInt(2,orderid);
            cstmt.setString(1,dname);
            row = cstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }
    public int inserteva(Evaluation evaluation){
        String sql="insert into evaluation(orderid,evaluation)" +
                " values (?,?)";
        List<Object>pValues=new ArrayList<Object>();
        pValues.add(evaluation.getOrderid());
        pValues.add(evaluation.getEvaluation());


        int rows=0;
        try {
            rows=this.executeUpdate(sql,pValues);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows;
    }
}
