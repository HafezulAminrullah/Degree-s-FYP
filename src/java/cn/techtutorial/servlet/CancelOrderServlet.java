package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.OrderDao;

@WebServlet("/cancel-order")
public class CancelOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try ( PrintWriter out = response.getWriter()) {
            if (request.getParameter("action").equals("cancelOrder")) {
                String id = request.getParameter("id");
                OrderDao orderDao = new OrderDao(DbCon.getConnection());
                orderDao.cancelOrder(id);
                orderDao.cancelOrderListByOrderId(id);
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert (\"Cancelled Order!\");");
                out.println("window.location.href = './orders.jsp';");
                out.println("</script>");
                
            } else if (request.getParameter("action").equals("removeOrder")) {
                String id = request.getParameter("id");
                int size = Integer.parseInt(request.getParameter("orderSize"));
                int p_id = Integer.parseInt(request.getParameter("p_id"));
                if (id != null) {
                    OrderDao orderDao = new OrderDao(DbCon.getConnection());
                    orderDao.cancelOrderList(id, p_id);
                }

                if (size == 1) {
                    OrderDao orderDao = new OrderDao(DbCon.getConnection());
                    orderDao.cancelOrder(id);
                }
                response.sendRedirect("orders.jsp");
            }
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
