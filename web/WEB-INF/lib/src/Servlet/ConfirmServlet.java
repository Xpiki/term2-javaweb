package Servlet;

import SqlBean.OrderDao;
import entity.Evaluation;
import entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2018/6/12.
 */
@WebServlet("/ConfirmServlet")
public class ConfirmServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderid = request.getParameter("orderid");
        String username = request.getParameter("username");
        String method = request.getParameter("method");
        Order order=new Order();
        OrderDao orderDao = new OrderDao();
        order.setOrderid(Integer.parseInt(orderid));
        int num=0;

        if(method.equals("3"))
        {
            String eva= request.getParameter("eva");
            Evaluation evaluation=new Evaluation();
            evaluation.setEvaluation(Float.parseFloat(eva));
            evaluation.setOrderid(Integer.parseInt(orderid));
            num=orderDao.inserteva(evaluation);
        }
        //         method=2,确认收货
        if(method.equals("2"))
        {
            num=orderDao.ConfirmOrder(order);
        }
        if(method.equals("1"))
        {

            num=orderDao.ChargeBack(order);
        }
        if (num>0)
        {
            response.sendRedirect("OrderMangementServlet?flag=cus&username="+username);

        }



    }
}
