package com.pahanaedu.servlet;

import com.pahanaedu.dao.ItemDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteItem")
public class DeleteItemServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ItemDAO dao = new ItemDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("item_id"));
        dao.deleteItem(id);
        resp.sendRedirect("items");
    }
}
