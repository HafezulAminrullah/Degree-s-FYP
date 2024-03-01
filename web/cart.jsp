<%-- 
    Document   : cart
    Created on : Jun 12, 2022, 9:34:33 PM
    Author     : ADMIN
--%>

<%@page import="cn.techtutorial.dao.product1Dao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
    product1Dao pDao = new product1Dao();
    cartProduct = pDao.getCartProducts(cart_list);
    double total = pDao.getTotalCartPrice(cart_list);
    request.setAttribute("total", total);
    request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>Azro Hardware & Electrical</title>
    <style type="text/css">
        .table tbody td {
            vertical-align: middle;
        }
        .btn-incre,
        .btn-decre {
            box-shadow: none;
            font-size: 25px;
        }
        .cart-total {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .cart-total h3 {
            margin-bottom: 0;
            color: #ffffff; /* Updated font color */
        
        }
        .cart-actions {
            margin-top: 20px;
        }
        .cart-actions .btn-checkout {
            margin-right: 10px;
        }
        .btn-decre,
        .btn-incre {
            padding: 0;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border: none;
        }
        .btn-decre:hover,
        .btn-incre:hover {
            background-color: #0062cc;
        }
        .quantity-input {
            width: 50px;
            text-align: center;
        }
        .btn-remove {
            padding: 5px 10px;
            font-size: 12px;
        }
        .btn-remove:hover {
            background-color: #dc3545;
            border-color: #dc3545;
        }
    </style>
</head>

<body style="background-color: black;">
    <%@include file="/includes/navbar.jsp"%>

    <div class="container my-3">
        <div class="cart-total">
            <h3>Total Price: RM ${(total > 0) ? dcf.format(total) : 0}</h3>
            <div>
                <a class="btn btn-primary btn-checkout" href="cart-check-out">Check Out</a>
                <a class="btn btn-secondary" href="index.jsp">Continue Shopping</a>
            </div>
        </div>
        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">Item</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Cancel</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (cart_list != null) {
                    for (Cart c : cartProduct) {
                %>
                <tr>
                    <td>
<div class="d-flex align-items-center">
    <img style="height: 250px; width: 200px; border-radius: 10px;" src="image.jsp?id=<%= c.getId() %>" alt="Product Image" class="cart-product-image">
</div>
                    </td>
                    <td><%= c.getName() %></td>
                    <td>RM <%= dcf.format(c.getPrice())%></td>
                    <td>
                        <form action="order-now" method="post" class="form-inline">
                            <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                            <div class="form-group d-flex justify-content-between align-items-center">
                                <a class="btn btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>">
                                    <i class="fa fa-minus"></i>
                                </a>
                                <input type="text" name="quantity" class="form-control quantity-input" value="<%=c.getQuantity()%>" readonly>
                                <a class="btn btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>">
                                    <i class="fa fa-plus"></i>
                                </a>
                            </div>
                        </form>
                    </td>
                    <td>
                        <a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-danger btn-remove">Remove</a>
                    </td>
                </tr>
                <%
                }}%>
            </tbody>
        </table>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>
