package Servlet;

import SqlBean.UserDao;
import entity.Admin;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2018/6/5.
 */
@WebServlet( "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String i = request.getParameter("login");
        UserDao userDao = new UserDao();
        String username = request.getParameter("username");
//        String pwd = request.getParameter("pwd");
        MD5Util md5Util = new MD5Util();
        String pwd = md5Util.getMD5(request.getParameter("pwd"));
        if (i.equals("0")){//登陆成功 记录下登录名
            User user = userDao.getUser(username,pwd);
            if (user!=null&&user.getUsername()!=null&&user.getPassword()!=null){
                HttpSession session = request.getSession();
                session.setAttribute("user",user);
                request.getRequestDispatcher("toServlet.jsp").forward(request,response);
            }
            else {//登录失败 重新跳转到登录界面
                response.sendRedirect("Login.jsp?flag=0");
            }
        }
        else if (i.equals("1")){
            Admin admin = userDao.getAdmin(username,pwd);
            if (admin!=null&&admin.getAdminName()!=null&&admin.getPassword()!=null){
                HttpSession session = request.getSession();
                session.setAttribute("admin",admin);
                request.setAttribute("userd","own");
                response.sendRedirect("IndexServlet?who=own");
            }
            else {
                response.sendRedirect("OwnerLogin.jsp?flag=0");
            }
        }
    }
}
