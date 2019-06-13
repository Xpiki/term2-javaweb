package Servlet;

import SqlBean.OrderDao;
import entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.StringReader;

/**
 * Created by Administrator on 2018/6/11.
 */
@WebServlet("/OrderInsertServlet")
public class OrderInsertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username=request.getParameter("username");
        String foodname=request.getParameter("foodname");
        String price=request.getParameter("price");
        String quantity=request.getParameter("quantity");
        String image=request.getParameter("image");
        String note=request.getParameter("note");

        Order order=new Order();
        OrderDao orderDao = new OrderDao();
        int num=0;

        order.setCustomerName(username);
        order.setFoodName(foodname);
        order.setQuantity(Integer.parseInt(quantity));
        order.setSumPrice(Integer.parseInt(price)*Integer.parseInt(quantity));
        order.setImage(image);
        order.setNote(note);
        num=orderDao.insert(order);
        request.getRequestDispatcher("/OrderMangementServlet?flag=cus").forward(request,response);
    }
}
