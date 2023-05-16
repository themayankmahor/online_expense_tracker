package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDao userDao = new UserDao(HibernateUtil.getSessionFactory());

		User user = userDao.login(email, password);

		HttpSession session = req.getSession();

		if (user == null) {
			session.setAttribute("msg", "Invalid Email & Password");
			resp.sendRedirect("login.jsp");
		} else {
			session.setAttribute("loginUser", user);
			resp.sendRedirect("user/home.jsp");
		}
	}

}
