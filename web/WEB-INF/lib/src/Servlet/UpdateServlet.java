package Servlet;

import SqlBean.FoodDao;
import entity.Food;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FoodDao foodDao=new FoodDao();
        Food food = new Food();
        String foodName = request.getParameter("foodname");
        String foodNum = request.getParameter("foodnum");
        String foodPrice = request.getParameter("foodprice");
        String type = request.getParameter("type");
        String introduce = request.getParameter("introduce");
        food.setFoodname(foodName);
        food.setInventory(Integer.parseInt(foodNum));
        food.setPrice(Integer.parseInt(foodPrice));
        food.setType(type);
        food.setIntroduct(introduce);
        foodDao.updateFood(food);
        response.sendRedirect("IndexServlet?who=own");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
