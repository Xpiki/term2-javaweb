package Servlet;

import SqlBean.FoodDao;
import entity.Food;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/InsertFoodServlet")
public class InsertFoodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FoodDao foodDao=new FoodDao();
        Food food = new Food();
        String foodName = request.getParameter("foodname");
        String foodNum = request.getParameter("foodnum");
        String foodPrice = request.getParameter("foodprice");
        String type = request.getParameter("type");
        String introduce = request.getParameter("introduce");
        String bname = request.getParameter("bname");
        String image = request.getParameter("image");
        food.setBname(bname);
        food.setImage(image);
        food.setFoodname(foodName);
        food.setInventory(Integer.parseInt(foodNum));
        food.setPrice(Integer.parseInt(foodPrice));
        food.setType(type);
        food.setIntroduct(introduce);
        int row = foodDao.insertFood(food);
        if (row!=0){
            response.sendRedirect("IndexServlet?who=own");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
