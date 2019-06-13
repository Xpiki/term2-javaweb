package SqlBean;

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
public class IfExistUser extends SqlBean {
    public boolean ifExistUserName(User users) {
        String sql = "Select * from customers WHERE customername=?";
        Connection conn = sqlconnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Object> pValues = new ArrayList<>();
        pValues.add(users.getUsername());
        try {
            pstmt = conn.prepareStatement(sql);
            if (pValues != null && pValues.size() > 0) {
                for (int i = 0; i < pValues.size(); i++) {
                    pstmt.setObject(1 + i, pValues.get(i));
                }
            }
            rs = pstmt.executeQuery();
            if (!rs.next()) {
                return false;
            }else  return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        } finally {
            this.closeSql(conn, pstmt, rs);
        }
    }

    public boolean ifExistUserPhone(User users) {
        String sql = "Select * from customers WHERE cphone=?";
        Connection conn = sqlconnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Object> pValues = new ArrayList<>();
        pValues.add(users.getPhone());
        try {
            pstmt = conn.prepareStatement(sql);
            if (pValues != null && pValues.size() > 0) {
                for (int i = 0; i < pValues.size(); i++) {
                    pstmt.setObject(1 + i, pValues.get(i));
                }
            }
            rs = pstmt.executeQuery();
            if (!rs.next()) {
                return false;
            }else  return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        } finally {
            this.closeSql(conn, pstmt, rs);
        }
    }

    public int insertUser(User user) {
        String sql = "insert customers VALUES (?,?,?,?)";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(user.getUsername());
        pValues.add(user.getPassword());
        pValues.add(user.getPhone());
        pValues.add(user.getAddress());
        int row = 0;
        try {
            row = this.executeUpdate(sql, pValues);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }
}
