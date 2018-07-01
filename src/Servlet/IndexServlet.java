package Servlet;

import SqlBean.FoodDao;
import entity.Food;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FoodDao foodDao=new FoodDao();
        List<List<Food>> allTypeFood = foodDao.getAllFood();
        request.setAttribute("allTypeFood",allTypeFood);
        if(request.getParameter("who").equals("cus")){
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }else if (request.getParameter("who").equals("own")){
            request.getRequestDispatcher("OrderDinner.jsp").forward(request,response);
        }
    }
}
