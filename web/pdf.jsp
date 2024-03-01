<%-- 
    Document   : pdf
    Created on : Jun 28, 2023, 11:14:43 PM
    Author     : HafezulAminrullah 
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.YearMonth"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="cn.techtutorial.model.User"%>
<%@page import="cn.techtutorial.dao.UserDao"%>
<%@page import="cn.techtutorial.dao.PaymentDao"%>
<%@page import="cn.techtutorial.model.Payment"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="cn.techtutorial.model.Order"%>
<%@page import="java.util.List"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="css/pdf.css" />
        <script src="js/pdf.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

    </head>


    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart", "root", "");

        List<Payment> paymentList = new ArrayList<>();
        PaymentDao paymentDao = new PaymentDao();
        paymentList = paymentDao.getAllPayments();

        request.getSession().setAttribute("paymentList", paymentList);

        OrderDao dao = new OrderDao(con);
        //                List<Order> Orders = dao.getAllOrders();
        //
        //                request.getSession().setAttribute("Orders", Orders);
    %>


    <%
        // Initialize a map to store the monthly total sales
        Map<String, BigDecimal> monthlySales = new HashMap<>();

        // Loop through the paymentList to calculate the total sales per month
        for (Payment payment : paymentList) {
            BigDecimal paymentAmount = new BigDecimal(payment.getPaymentamount());
            LocalDate paymentDate = LocalDate.parse(payment.getPaymentdate());
            String paymentMonth = YearMonth.from(paymentDate).format(DateTimeFormatter.ofPattern("yyyy-MM"));

            if (monthlySales.containsKey(paymentMonth)) {
                BigDecimal currentTotal = monthlySales.get(paymentMonth);
                monthlySales.put(paymentMonth, currentTotal.add(paymentAmount));
            } else {
                monthlySales.put(paymentMonth, paymentAmount);
            }
        }
    %>

    <%
        // Calculate the total sales overall
        BigDecimal totalSalesOverall = BigDecimal.ZERO;
        for (BigDecimal value : monthlySales.values()) {
            totalSalesOverall = totalSalesOverall.add(value);
        }
    %>


    <body>                      

        <div class="container d-flex justify-content-center mt-50 mb-50">
            <div class="row">
                <div class="col-md-12 text-right mb-3">
                    <button class="btn btn-primary" id="download"> Download pdf</button>
                    <button class="btn btn-primary" onclick="window.location.href = 'dashboard.jsp';"> Back</button>
                </div>
                <div class="col-md-12">
                    <div class="card" id="invoice">
                        <div class="card-header bg-transparent header-elements-inline">
                            <h6 class="card-title text-primary">Sale report</h6>
                        </div>
                        <div class="card-body">

                            <div class="d-md-flex flex-md-wrap">
                                <div class="mb-4 mb-md-2 text-left"> <span class="text-muted">Report To:</span>
                                    <ul class="list list-unstyled mb-0">
                                        <li>
                                            <h5 class="my-2">Azri bin Ali</h5>
                                        </li>
                                        <li><span class="font-weight-semibold">Azro Hardware & Electrical</span></li>
                                        <li>Lot pt 16224 Jalan Tepuh,</li>
                                        <li>Kampung Padang Nenas,</li>
                                        <li>21030 Kuala Terengganu, Terengganu</li>
                                        <li>09-669 6358</li>
                                        <li><a href="#" data-abc="true">customercare@azrohardware.com</a></li>
                                    </ul>
                                </div>
                                <div class="mb-2 ml-auto"> 

                                    <!-- Display the total sales per month -->
                                    <div class="col-md-12">
                                        <!-- Display the total sales overall -->

                                        <div class="card">
                                            <div class="card-body">
                                                <h5>Overall Sales : </h5>
                                                <p>RM <%= totalSalesOverall%></p>
                                            </div>


                                            <div class="card-body">
                                                <h5>Sales per Month:</h5>
                                                <ul>
                                                    <% for (Map.Entry<String, BigDecimal> entry : monthlySales.entrySet()) {%>
                                                    <li><%= entry.getKey()%>: RM <%= entry.getValue()%></li>
                                                        <% } %>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>


                        <div id="page-wrapper">
                            <div class="container-fluid">

                                <!-- /.row -->

                                <!-- Form Order List -->
                                <br>
                                <div class="container bootdey" >   
                                    <div class="col-md-12" <span class="text-muted">Details:</span>  

                                        <div class="col-md-12"> 
                                            <div class="portlet light bordered">
                                                <div class="portlet-title tabbable-line">
                                                    <div class="caption caption-md">
                                                        <i class="icon-globe theme-font hide"></i>
                                                        <!--                                            <span class="caption-subject font-blue-madison bold uppercase">History</span>-->
                                                    </div>
                                                </div>
                                                <div class="portlet-body">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>Payment ID</th>
                                                                <th>Order ID</th>
                                                                <th>Customer Name</th>
                                                                <th>Orders</th>
                                                                <th>Total Price</th>
                                                                <th>Date</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                for (Payment payment : paymentList) {
                                                                    out.print("<tr>");
                                                                    out.print("<td>" + payment.getPaymentid() + "</td>");
                                                                    out.print("<td>" + payment.getO_id() + "</td>");

                                                                    Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection myConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart", "root", "");

                                                                    UserDao userDao = new UserDao(myConnection);
                                                                    User user = userDao.getUserDetails(payment.getU_id());

                                                                    out.print("<td>" + user.getName() + "</td>");

                                                                    List<Order> orders = dao.getAllOrdersByOrderId(payment.getO_id());

                                                                    out.print("<td>");

                                                                    for (Order order : orders) {
                                                                        out.print("<li class='flex-body'> &#x2022;");
                                                                        out.print("<div>" + order.getName() + "  x" + order.getQuantity() + "</div>");
                                                                        out.print("<div> RM" + order.getPrice() + "</div>");
                                                                        out.print("</li>");
                                                                    }

                                                                    out.print("</td>");
                                                                    out.print("<td>RM " + payment.getPaymentamount() + "</td>");
                                                                    out.print("<td>" + payment.getPaymentdate() + "</td>");

                                                                }
                                                            %>



                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </body>




                                </html>