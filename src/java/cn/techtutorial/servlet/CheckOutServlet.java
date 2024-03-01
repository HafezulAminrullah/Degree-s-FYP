package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.dao.OrderDao;
import cn.techtutorial.model.*;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
            User auth = (User) request.getSession().getAttribute("auth");
            if (cart_list != null && auth != null) {

                OrderDao oDao = new OrderDao(DbCon.getConnection());

                String orderID = "";
                int startRange = 10000;
                int endRange = 99999;
                String str = "";
                int status = 0;

                for (int i = 0; i < startRange; i++) {
                    int rand = startRange + (int) (Math.random() * ((endRange - startRange) + 1));
                    str = "ORD-" + rand;
                    status = oDao.findIDByString(str);
                    if (status == 0) {
                        orderID = str;
                        break;
                    }
                }

                Order o = new Order();
                o.setOrderId(orderID);
                o.setUid(auth.getId());
                o.setDate(formatter.format(date));

                boolean r = oDao.insertOrder(o);

                if (r) {
                    for (Cart c : cart_list) {
                        Order order = new Order();
                        order.setOrderId(orderID);
                        order.setP_id(c.getId());
                        order.setUid(auth.getId());
                        order.setQuantity(c.getQuantity());

                        oDao = new OrderDao(DbCon.getConnection());
                        boolean result = oDao.insertIntoOrderList(order);
                        if (!result) {
                            break;
                        }
                    }
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Error in checkout. Please try again');");
                    out.println("location=history.back(-2);");
                    out.println("</script>");
                }

                cart_list.clear();
                response.sendRedirect("orders.jsp");
            } else if (auth == null) {

                response.sendRedirect("login.jsp");

            } else {
                response.sendRedirect("cart.jsp");
            }
        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
