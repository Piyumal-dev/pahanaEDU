package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@jakarta.servlet.annotation.WebServlet("/customers")
public class CustomerListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private CustomerDAO dao = new CustomerDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws jakarta.servlet.ServletException, IOException {
        List<Customer> list = dao.findAll();
        req.setAttribute("customers", list);
        req.getRequestDispatcher("customers.jsp").forward(req, resp);
    }
}
