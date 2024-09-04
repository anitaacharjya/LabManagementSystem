package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.lms.daoimpl.UserDaoImpl;
import com.lms.vo.User;

@WebServlet("/ULoginServlet")
public class UserLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        UserDaoImpl dao = new UserDaoImpl();
        HttpSession session = req.getSession();
        
        try {
            String username = req.getParameter("username");
            String password = req.getParameter("password");


            if(username!=null && password !=null) {
            // Regular user login
             int loging = dao.login(username, password);
            if (loging>0) {
                // Store user details in session
                //session.setAttribute("user", user);
                session.setAttribute("username", username);
                res.sendRedirect("home.jsp");
            } else {
                session.setAttribute("Failed", "Username and password invalid");
                res.sendRedirect("index.jsp");
            }
		    }else {
		    	res.sendRedirect("error.jsp"); 
		    }
		        
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("error.jsp"); // Optionally, redirect to an error page
        }
    }
}
