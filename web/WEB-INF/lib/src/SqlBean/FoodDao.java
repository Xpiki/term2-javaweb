package SqlBean;

import entity.Food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class FoodDao extends SqlBean {

    List<List<Food>> allFood = new ArrayList<List<Food>>();
    private String[] type = {"热销", "套餐", "优惠", "米饭", "饮料"};

    //    查询type是热销的食品
    public List<List<Food>> getAllFood() {
        //循环遍历type并为数据库中不同类型的菜品添加到foodList当中，再将这些foodList添加到总的菜单allFood
        for (int i = 0; i < type.length; i++) {
            String sql = "Select foodname,price,inventory,type,image,introduct,avgeva from menus where type=" + "'" + type[i] + "'";
            Connection conn = sqlconnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            List<Food> foodList = new ArrayList<Food>();
            try {
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                DecimalFormat decimalFormat = new DecimalFormat(".00");
                while (rs.next()) {
                    Food objFood = new Food();
                    objFood.setFoodname(rs.getString("foodname"));
                    objFood.setPrice(rs.getInt("price"));
                    objFood.setInventory(rs.getInt("inventory"));
                    objFood.setType(rs.getString("type"));
                    objFood.setImage(rs.getString("image"));
                    objFood.setIntroduct(rs.getString("introduct"));
                    objFood.setAvgeva(decimalFormat.format(rs.getFloat("avgeva")));
                    foodList.add(objFood);
                }
                allFood.add(foodList);
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                this.closeSql(conn, pstmt, rs);
            }
        }
        return allFood;
    }


    //管理员删除某菜品后 将该菜品的类型改为下架
    public void deleteFood(String foodName) {
        String sql = "update  menus set type='下架' where foodname =" + "'" + foodName + "'";
        Connection conn = sqlconnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            this.closeSql(conn, pstmt, rs);
        }
    }

    //修改菜单
    public void updateFood(Food food) {
        String sql = "update menus set price=?,TYPE=?,introduct=?,inventory=? where foodname=?";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(food.getPrice());
        pValues.add(food.getType());
        pValues.add(food.getIntroduct());
        pValues.add(food.getInventory());
        pValues.add(food.getFoodname());
        int rows;
        try {
            rows = this.executeUpdate(sql, pValues);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //插入菜品到菜单
    public int insertFood(Food food) {
        String sql = "insert menus(foodname,bname,price,inventory,TYPE,image,introduct) values(?,?,?,?,?,?,?)";
        List<Object> pValues = new ArrayList<Object>();
        pValues.add(food.getFoodname());
        pValues.add(food.getBname());
        pValues.add(food.getPrice());
        pValues.add(food.getInventory());
        pValues.add(food.getType());
        pValues.add(food.getImage());
        pValues.add(food.getIntroduct());
        int rows = 0;
        try {
            rows = this.executeUpdate(sql, pValues);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows;
    }
}
