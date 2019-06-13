package SqlBean;

import entity.Admin;
import entity.Order;
import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/6/5.
 */
public class UserDao extends SqlBean {
    //根据登录表单中输入的用户名和密码从数据库中匹配相应用户的信息
    public User getUser(String username,String pwd){
        String sql = "select customername,cpassword,cphone,caddress from customers where customername=? and cpassword=?";
        Connection conn = sqlconnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = new User();
        String pValuse1 = username;
        String pValuse2 = pwd;
        try {
            pstmt = conn.prepareStatement(sql);
            if (pValuse1!=null&&pValuse2!=null){
                pstmt.setObject(1,pValuse1);
                pstmt.setObject(2,pValuse2);
            }
            rs = pstmt.executeQuery();
            while (rs.next()){
                user.setUsername(rs.getString("customername"));
                user.setPassword(rs.getString(2));
                user.setPhone(rs.getString(3));
                user.setAddress(rs.getString(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeSql(conn, pstmt, rs);
        }
        return user;
    }
    public Admin getAdmin(String username, String pwd){
        String sql = "select adminid,password,bname from admins where adminid=? and password=?";
        Connection conn = sqlconnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Admin admin = new Admin();
        String pValuse1 = username;
        String pValuse2 = pwd;
        try {
            pstmt = conn.prepareStatement(sql);
            if (pValuse1!=null&&pValuse2!=null){
                pstmt.setObject(1,pValuse1);
                pstmt.setObject(2,pValuse2);
            }
            rs = pstmt.executeQuery();
            while (rs.next()){
                admin.setAdminName(rs.getString(1));
                admin.setPassword(rs.getString(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeSql(conn, pstmt, rs);
        }
        return admin;
    }

}
