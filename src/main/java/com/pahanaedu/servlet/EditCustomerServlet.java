package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@jakarta.servlet.annotation.WebServlet("/editCustomer")
public class EditCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private CustomerDAO dao = new CustomerDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws jakarta.servlet.ServletException, IOException {
        int accountNo = Integer.parseInt(req.getParameter("account_no"));
        Customer c = dao.findByAccount(accountNo);
        req.setAttribute("customer", c);
        req.getRequestDispatcher("edit_customer.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws jakarta.servlet.ServletException, IOException {
        try {
            int accountNo = Integer.parseInt(req.getParameter("account_no"));
            String name = req.getParameter("name");
            String address = req.getParameter("address");
            String telephone = req.getParameter("telephone");
            int units = Integer.parseInt(req.getParameter("units_consumed"));

            Customer c = new Customer(accountNo, name, address, telephone, units);
            boolean ok = dao.updateCustomer(c);
            if (ok) resp.sendRedirect("customers");
            else {
                req.setAttribute("error", "Failed to update customer.");
                req.getRequestDispatcher("edit_customer.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("error", "Invalid input.");
            req.getRequestDispatcher("edit_customer.jsp").forward(req, resp);
        }
    }
}
