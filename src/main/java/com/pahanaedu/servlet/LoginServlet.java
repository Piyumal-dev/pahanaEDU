package com.pahanaedu.servlet;

import com.pahanaedu.dao.UserDAO;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@jakarta.servlet.annotation.WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws jakarta.servlet.ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (userDAO.validate(username, password)) {
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            resp.sendRedirect("dashboard.jsp");
        } else {
            req.setAttribute("error", "Invalid username or password");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
