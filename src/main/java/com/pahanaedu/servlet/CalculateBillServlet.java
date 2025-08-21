package com.pahanaedu.servlet;

import com.pahanaedu.dao.BillDAO;
import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@jakarta.servlet.annotation.WebServlet("/calculateBill")
public class CalculateBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private CustomerDAO customerDAO = new CustomerDAO();
    private BillDAO billDAO = new BillDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws jakarta.servlet.ServletException, IOException {
        int accountNo = Integer.parseInt(req.getParameter("account_no"));
        Customer c = customerDAO.findByAccount(accountNo);
        req.setAttribute("customer", c);
        req.getRequestDispatcher("bill.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int accountNo = Integer.parseInt(req.getParameter("account_no"));
        int units = Integer.parseInt(req.getParameter("units"));
        int itemId = Integer.parseInt(req.getParameter("item_id"));
        double unitPrice = Double.parseDouble(req.getParameter("unit_price"));
        double total = units * unitPrice;

        billDAO.saveBill(accountNo, units, unitPrice, total); // Consider adding itemId too

        req.setAttribute("billAccount", accountNo);
        req.setAttribute("units", units);
        req.setAttribute("unitPrice", unitPrice);
        req.setAttribute("total", total);
        req.getRequestDispatcher("bill.jsp").forward(req, resp);
    }

}
