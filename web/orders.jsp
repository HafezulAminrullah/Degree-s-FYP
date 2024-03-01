<%--
    Document   : orders
    Created on : Jun 12, 2022, 9:35:19 PM
    Author     : ADMIN
--%>

<%@page import="cn.techtutorial.dao.PaymentDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    List<List<Order>> ordersList = new ArrayList<>();
    List<Order> orders = null;
    List<String> orderIdList = null;
    PaymentDao paymentDao = new PaymentDao();
    if (auth != null) {
        request.setAttribute("person", auth);
        OrderDao orderDao = new OrderDao(DbCon.getConnection());
        orderIdList = orderDao.getUserOrdersId(auth.getId());

        for (String s : orderIdList) {
            ordersList.add(orderDao.getAllOrdersByOrderId(s));
        }
    } else {
        response.sendRedirect("login.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }

%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>Azro Hardware & Electrical</title>
    <style>
        body {
            background-color: whitesmoke;
        }
        .card-header {
            background-color: #f8f9fa;
            padding: 1rem;
            border-bottom: 1px solid #dee2e6;
            font-weight: bold;
        }
        .order-container {
            margin-top: 2rem;
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: .25rem;
            padding: 1rem;
        }
        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }
        .order-header p {
            margin: 0;
            font-size: 1.25rem;
            font-weight: bold;
        }
        .order-actions {
            display: flex;
            align-items: center;
        }
        .order-actions a {
            margin-left: 1rem;
        }
        .order-table {
            width: 100%;
        }
        .order-table th {
            text-align: left;
        }
        .order-table td,
        .order-table th {
            padding: .75rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }
        .remove-button {
            padding: .25rem .5rem;
            font-size: .875rem;
            line-height: 1.5;
            border-radius: .2rem;
        }
    </style>
</head>
<body style="background-color: black;">
    <%@include file="/includes/navbar.jsp"%>
    <div class="container">
       

        <div class="order-container">
            <%  
                int i = 0;
                for (List<Order> orderList : ordersList) {
                    if(paymentDao.checkOrderPaymentStatus(orderList.get(0).getOrderId()) > 0) {
                        continue;
                    }
            %>
            <div class="order-header">
                <p><%=orderList.get(0).getOrderId()%></p>
                <div class="order-actions">
                    <a class="btn btn-danger remove-button" href="cancel-order?action=cancelOrder&id=<%=orderList.get(0).getOrderId()%>">Cancel</a>
                    <a class="btn btn-warning remove-button" href="payment1.jsp?id=<%=orderList.get(0).getOrderId()%>">Pay</a>
                </div>
            </div>
            <table class="order-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Order o : orderList) { %>
                    <tr>
                        <input type="hidden" name="orderSize" value="<%=orderList.size()%>"/>
                        <td><%=o.getDate()%></td>
                        <td><%=o.getName()%></td>
                        <td><%=o.getCategory()%></td>
                        <td><%=o.getQuantity()%></td>
                        <td><%=dcf.format(o.getPrice())%></td>
                        <td><a class="btn btn-sm btn-danger remove-button" href="cancel-order?action=removeOrder&id=<%=o.getOrderId()%>&p_id=<%=o.getId()%>&orderSize=<%=orderList.size()%>">Remove</a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% i++; } %>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>
