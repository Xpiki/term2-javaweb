package Servlet;

import SqlBean.IfExistUser;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;

/**
 * Created by Administrator on 2018/6/5.
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String userPhone = request.getParameter("userPhone");
        String address = request.getParameter("address");
        MD5Util md5Util = new MD5Util();
        String password = md5Util.getMD5(request.getParameter("password"));
        User user = new User();
        user.setPhone(userPhone);
        user.setUsername(userName);
        IfExistUser ifExistUser = new IfExistUser();
        boolean ifExsisUserNmae=ifExistUser.ifExistUserName(user);
        boolean ifExsisUserPhone = ifExistUser.ifExistUserPhone(user);
        if (ifExsisUserNmae){
//            JOptionPane.showMessageDialog(null, "账号名称已经存在，请重新注册");
            request.getRequestDispatcher("Register.jsp?flag=1").forward(request,response);
        }
        else if (ifExsisUserPhone){
//            JOptionPane.showMessageDialog(null, "该手机帐号已经被注册，请重新注册或者找回密码");
            request.getRequestDispatcher("Register.jsp?flag=2").forward(request,response);
        }
        else{
            user.setAddress(address);
            user.setPassword(password);
            ifExistUser.insertUser(user);
//            JOptionPane.showMessageDialog(null, "成功注册，请登录");
            request.getRequestDispatcher("Login.jsp?flag=2").forward(request,response);
        }
    }
}
