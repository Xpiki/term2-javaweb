package SqlBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Administrator on 2018/5/21.
 */
public class SqlBean {
    public Connection sqlconnection() {
        Connection conn = null;
        try {
            Context icontext = new InitialContext();
            DataSource source = (DataSource) icontext.lookup("java:comp/env/jdbc/pmisdb");
            conn = source.getConnection();
        } catch (NamingException ne) {
            ne.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void closeSql(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (conn != null)
                conn.close();
            if (pstmt != null)
                pstmt.close();
            if (rs != null)
                rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int executeUpdate(String sql, List<Object> paramValues){
        Connection conn = sqlconnection();
        PreparedStatement pstmt = null;
        int row = 0;
        try {
            pstmt=conn.prepareStatement(sql);
            if (paramValues !=null&&paramValues.size()>0){
                for (int i = 0; i < paramValues.size(); i++) {
                    pstmt.setObject(1+i,paramValues.get(i));
                }
            }
            row = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeSql(conn,pstmt,null);
        }
        return row;
    }
}
