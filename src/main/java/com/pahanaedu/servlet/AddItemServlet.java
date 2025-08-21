package com.pahanaedu.servlet;

import com.pahanaedu.dao.ItemDAO;
import com.pahanaedu.model.Item;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addItem")
public class AddItemServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ItemDAO dao = new ItemDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("item_code");
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));

        Item item = new Item();
        item.setItemCode(code);
        item.setName(name);
        item.setPrice(price);

        if (dao.addItem(item)) {
            resp.sendRedirect("items");
        } else {
            req.setAttribute("error", "Failed to add item.");
            req.getRequestDispatcher("add_item.html").forward(req, resp);
        }
    }
}
