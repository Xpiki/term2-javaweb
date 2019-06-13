package Servlet;

import SqlBean.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PeisongServlet")
public class PeisongServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDao orderDao = new OrderDao();
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        String dname = request.getParameter("dname");
        int rows = orderDao.addDritroduce(orderid,dname);
        response.sendRedirect("OrderMangementServlet?flag=own");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
