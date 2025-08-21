package com.pahanaedu.servlet;

import com.pahanaedu.dao.ItemDAO;
import com.pahanaedu.model.Item;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/items")
public class ItemListServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ItemDAO dao = new ItemDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Item> list = dao.findAll();
        req.setAttribute("items", list);
        req.getRequestDispatcher("items.jsp").forward(req, resp);
    }
}
