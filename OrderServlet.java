package com.admin.servlet;

import com.DAO.OrderDAOImpl;

import com.DB.DBconnect;
import com.entity.Order;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class OrderServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            OrderDAOImpl dao = new OrderDAOImpl(DBconnect.getConn());
            List<Order> orderList = dao.getAllOrders();
            
            HttpSession session = request.getSession();
            session.setAttribute("orderList", orderList);
            
            response.sendRedirect("admin/order.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}