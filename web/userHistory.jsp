<%-- 
    Document   : userEdit
    Created on : Jan 22, 2023, 11:10:48 PM
    Author     : ADMIN
--%>

<%@page import="cn.techtutorial.model.Order"%>
<%@page import="cn.techtutorial.model.Order"%>
<%@page import="cn.techtutorial.dao.UserDao"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@page import="cn.techtutorial.dao.PaymentDao"%>
<%@page import="cn.techtutorial.model.Payment"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="cn.techtutorial.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp"%>

    </head>

    <body style="background-color: black;">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="mainPage.jsp">Azro Hardware & Electrical </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>

                        <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                        <li class="nav-item"><a class="nav-link" href="userEdit.jsp">User Profile</a></li>
                        <li class="nav-item"><a class="nav-link" href="userHistory.jsp">History</a></li>
                        <li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>






                    </ul>
                </div>
            </div>
        </nav>
        <%
            User auth = (User) request.getSession().getAttribute("auth");

            if (auth != null) {
                request.setAttribute("person", auth);
            } else {
                response.sendRedirect("login.jsp");
            }
            
                Class.forName("com.mysql.jdbc.Driver");
                Connection myConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart", "root", "");

                List<Payment> paymentList = new ArrayList<>();
                PaymentDao paymentDao = new PaymentDao();
                paymentList = paymentDao.getAllPaymentsByU_id(auth.getId());

                request.getSession().setAttribute("paymentList", paymentList);

                OrderDao dao = new OrderDao(myConnection);
        %>

       <div id="page-wrapper">
                <div class="container-fluid">
                    
                    <!-- /.row -->

                    <!-- Form Order List -->
                    <br>
                    <div class="container bootdey">  
                        <div class="col-md-12">  

                            <div class="col-md-12"> 
                                <div class="portlet light bordered">
                                    <div class="portlet-title tabbable-line">
                                        <div class="caption caption-md">
                                            <i class="icon-globe theme-font hide"></i>
<!--                                            <span class="caption-subject font-blue-madison bold uppercase">History</span>-->
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <table class="table table-light" >
                                            <thead>
                                                <tr>
                                                    <th>Payment ID</th>
                                                    <th>Order ID</th>
                                                    <th>Orders</th>
                                                    <th>Total Price</th>
                                                    <th>Date</th>
                                                    <th>Receipt</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (Payment payment : paymentList) {
                                                        out.print("<tr>");
                                                        out.print("<td>" + payment.getPaymentid() + "</td>");
                                                        out.print("<td>" + payment.getO_id() + "</td>");

                                                        List<Order> orders = dao.getAllOrdersByOrderId(payment.getO_id());

                                                        out.print("<td>");

                                                        for (Order order : orders) {
                                                            out.print("<siv class='flex-body'> &#x2022;");
                                                            out.print("<div>" + order.getName() + "  x" + order.getQuantity() + "</div>");
                                                            out.print("<div> RM" + order.getPrice() + "</div>");
                                                            out.print("</div>");
                                                        }

                                                        out.print("</td>");
                                                        out.print("<td>RM " + payment.getPaymentamount() + "</td>");
                                                        out.print("<td>" + payment.getPaymentdate() + "</td>");
                                                        out.print("<td><a class='btn  btn-warning btn-block' href='showUserReceipt.jsp?id=" + payment.getPaymentid() + "'>Show Receipt</a></td>");
                                                        out.print("</tr>");
                                                    }
                                                %>



                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>

        <%@include file="/includes/footer.jsp"%>
    </body>
</html>
