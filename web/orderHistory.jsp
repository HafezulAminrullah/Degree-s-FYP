<%-- 
    Document   : orderAdmin
    Created on : Jan 17, 2023, 10:57:22 PM
    Author     : ADMIN
--%>
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

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />



        <title>Startmin - Bootstrap Admin Theme</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">

        <!--    User List Form CSS-->
        <link href="css/userListForm.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <style>
            .flex-body {
                display: flex;
                flex-direction: row;
                flex-wrap: nowrap;
                justify-content: space-between;
                align-items: stretch;
                align-content: stretch;
            }

            /*            th {
                            text-align: center
                        }*/
        </style>


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Azro Hardware & Electrical</a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav navbar-nav navbar-left navbar-top-links">
                    <li><a href="dashboard.jsp"><i class="fa fa-home fa-fw"></i></a></li>
                </ul>

                <ul class="nav navbar-right navbar-top-links">
                    <li class="dropdown navbar-inverse">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell fa-fw"></i> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-comment fa-fw"></i> New Comment
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                        <span class="pull-right text-muted small">12 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-tasks fa-fw"></i> New Task
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> Admin <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="mainPage.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <!-- /input-group -->
                            </li>
                            <!--Start sidebar-->
                            <li>
                                <a href="dashboard.jsp" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="indexSupplier.jsp"><i class="fa fa-bar-chart-o fa-fw"></i> Supplier</a>

                            </li>
                            <li>
                                <a href="orderHistory.jsp"><i class="fa fa-table fa-fw"></i> Order </a>
                            </li>

                            <li>
                                <a href="indexProduct.jsp"><i class="fa fa-edit fa-fw"></i> Stock</a>

                            </li>
                            <li>
                                <a href="userList.jsp"><i class="fa fa-user fa-fw"></i> User</a>

                            </li>
                            <!--  End Sidebar-->
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>



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



            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Order <b>List</b></h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
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
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Payment ID</th>
                                                    <th>Order ID</th>
                                                    <th>Customer Name</th>
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
                                                        out.print("<td><a class='btn  btn-warning btn-block' href='showReceipt.jsp?id=" + payment.getPaymentid() + "'>Show Receipt</a></td>");
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
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>

    </body>
</html>
