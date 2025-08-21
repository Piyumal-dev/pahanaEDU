package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@jakarta.servlet.annotation.WebServlet("/addCustomer")
public class AddCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private CustomerDAO dao = new CustomerDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws jakarta.servlet.ServletException, IOException {
        try {
            int accountNo = Integer.parseInt(req.getParameter("account_no"));
            String name = req.getParameter("name");
            String address = req.getParameter("address");
            String tel = req.getParameter("telephone");
            int units = Integer.parseInt(req.getParameter("units"));

            Customer c = new Customer(accountNo, name, address, tel, units);
            boolean ok = dao.addCustomer(c);
            if (ok) resp.sendRedirect("customers");
            else {
                req.setAttribute("error", "Failed to add customer (maybe duplicate account_no).");
                req.getRequestDispatcher("add_customer.html").forward(req, resp);
            }
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid numeric input.");
            req.getRequestDispatcher("add_customer.html").forward(req, resp);
        }
    }
}
