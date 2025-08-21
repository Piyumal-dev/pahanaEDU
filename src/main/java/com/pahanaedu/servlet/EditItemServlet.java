package com.pahanaedu.servlet;

import com.pahanaedu.dao.ItemDAO;
import com.pahanaedu.model.Item;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editItem")
public class EditItemServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ItemDAO dao = new ItemDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("item_id"));
        Item item = dao.findById(id);
        req.setAttribute("item", item);
        req.getRequestDispatcher("edit_item.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("item_id"));
        String code = req.getParameter("item_code");
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));

        Item item = new Item(id, code, name, price);
        if (dao.updateItem(item)) {
            resp.sendRedirect("items");
        } else {
            req.setAttribute("error", "Failed to update item.");
            req.getRequestDispatcher("edit_item.jsp").forward(req, resp);
        }
    }
}
