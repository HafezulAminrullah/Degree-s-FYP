<%-- 
    Document   : orders
    Created on : Jun 12, 2022, 9:35:19 PM
    Author     : ADMIN
--%>

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
    if (auth != null) {
        request.setAttribute("person", auth);
        OrderDao orderDao = new OrderDao(DbCon.getConnection());
        orderIdList = orderDao.getUserOrdersId(auth.getId());
        
        for(String s : orderIdList) {
            ordersList.add(orderDao.getAllOrdersByOrderId(s));
        }
        orders = orderDao.userOrders(auth.getId());
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
    </head>
    <body style="background-color:whitesmoke;">
        <%@include file="/includes/navbar.jsp"%>
        <div class="container">
            <div class="card-header my-3">All Orders</div>
            
            <%
                for(List<Order> orderList : ordersList) {
                    for(Order o : orderList) {
            %>        
            <%        
                    }
                }
            %>
            
            <%for(int i = 0; i < 1; i++){%>
            <div style="background-color: white; font-weight: bold; padding: 20px 10px 10px 20px">
                <p>
                    <%=orders.get(i).getOrderId()%>
                </p>
            </div>
            <%}%>
            <br>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Date</th>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%  if (orders != null) {
                            for (Order o : orders) {%>
                                <tr>
                                    <input type="hidden" name="orderSize" value="<%=orders.size()%>"/>
                                    <td><%=o.getDate()%></td>
                                    <td><%=o.getName()%></td>
                                    <td><%=o.getCategory()%></td>
                                    <td><%=o.getQuantity()%></td>
                                    <td><%=dcf.format(o.getPrice())%></td>
                                    <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>&p_id=<%=o.getId()%>&orderSize=<%=orders.size()%>">Cancel</a></td>
                                </tr>
                    <%}
                        }
                    %>
                </tbody>
            </table>

            <div class="card">
                <div class="card-body">
                    <button type="button" class="btn btn-warning btn-block btn-lg" onclick="hrefFunction()">Proceed to Pay</button>
                </div>
            </div>
        </div>

        <%@include file="/includes/footer.jsp"%>
    </body>


    <script>

        //Function demonstrating the Href Method

        function hrefFunction() {
            window.location.href = "payment1.jsp";
        }



    </script>


</html>