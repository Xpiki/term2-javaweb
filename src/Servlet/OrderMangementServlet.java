package Servlet;

import SqlBean.OrderDao;
import entity.Distributor;
import entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/OrderMangementServlet")
public class OrderMangementServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag = request.getParameter("flag");
        OrderDao orderDao = new OrderDao();
        if (flag.equals("cus")) {
            List<Order> orders = orderDao.getCusOrder(request.getParameter("username"));
            request.setAttribute("orders", orders);
            request.setAttribute("username", request.getParameter("username"));
            request.getRequestDispatcher("CusOrderMangement.jsp").forward(request, response);
        } else if (flag.equals("own")) {
            List<List<Order>> orders = orderDao.getOrders();
            int q = 0, l = 0;
            for (int i = 0; i < orders.size(); i++) {
                if (orders.get(i).size() != 0) {
                    if (orders.get(i).get(0).getState().equals("已评价")) {
                        q = i;
                    } else if (orders.get(i).get(0).getState().equals("已送达")) {
                        l = i;
                    }
                }
            }
            orders.get(l).addAll(orders.get(q));
            orders.remove(q);
            DistributorDao distributorDao = new DistributorDao();
            List<Distributor> distributors = distributorDao.getDistributor();
            request.setAttribute("orders", orders);
            request.setAttribute("distributors", distributors);
            request.getRequestDispatcher("OrderMangement.jsp").forward(request, response);
        }
    }
}
