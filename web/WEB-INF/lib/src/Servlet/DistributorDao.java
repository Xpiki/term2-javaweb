package Servlet;

import SqlBean.SqlBean;
import entity.Distributor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DistributorDao extends SqlBean{
    public List<Distributor> getDistributor(){
        String sql = "select dname,dphone from deliveryman";
        Connection conn = sqlconnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Distributor> distributors = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while(rs.next()){
                Distributor distributor = new Distributor();
                distributor.setDname(rs.getString(1));
                distributor.setDphone(rs.getString(2));
                distributors.add(distributor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeSql(conn, pstmt, rs);
        }
        return  distributors;
    }
}
