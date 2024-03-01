<%@page import="java.time.YearMonth"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@page import="cn.techtutorial.dao.PaymentDao"%>
<%@page import="cn.techtutorial.model.Payment"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"><!-- benda paling function utk bootstrap -->
        <title>Admin Dashboard</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="css/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

     
        
          <!-- Add Chart.js library and stylesheets -->
          <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
          <style>
            canvas {
              max-width: 100%;
            }
          </style>
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
                </div>
            </nav>

            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Dashboard</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-bar-chart fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"></div>
                                            <div>Sales Report</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="pdf.jsp">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-user fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"></div>
                                            <div>New User!</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="userList.jsp">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-yellow">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-shopping-cart fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"></div>
                                            <div>New Orders!</div>
                                        </div>
                                    </div>
                                </div>
                                <a href="">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                        <div class="clearfix"></div>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-bar-chart-o fa-fw"></i> Bar Chart 
                                    <div class="pull-right">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-xs dropdown-toggle"
                                                    data-toggle="dropdown">
                                                Actions
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#">Action</a>
                                                </li>
                                                <li><a href="#">Another action</a>
                                                </li>
                                                <li><a href="#">Something else here</a>
                                                </li>
                                                <li class="divider"></li>
                                                <li><a href="#">Separated link</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    

                                    <!-- Add a canvas element for the bar chart -->
                                    <div class="col-md-12">
                                        <canvas id="salesChart"></canvas>
                                    </div>

                                   

                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-bar-chart-o fa-fw"></i> 
                                    <div class="pull-right">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-xs dropdown-toggle"
                                                    data-toggle="dropdown">
                                                Actions
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#">Action</a>
                                                </li>
                                                <li><a href="#">Another action</a>
                                                </li>
                                                <li><a href="#">Something else here</a>
                                                </li>
                                                <li class="divider"></li>
                                                <li><a href="#">Separated link</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="table-responsive">
                                                
                                            </div>
                                            <!-- /.table-responsive -->
                                        </div>
                                                                                <!-- /.col-lg-8 (nested) -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                           
                            
                        </div>
                        <!-- /.col-lg-8 -->
                        <div class="col-lg-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-bell fa-fw"></i> Notifications Panel
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-comment fa-fw"></i> New Comment
                                            <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                            <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-envelope fa-fw"></i> Message Sent
                                            <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-tasks fa-fw"></i> New Task
                                            <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                            <span class="pull-right text-muted small"><em>11:32 AM</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                                            <span class="pull-right text-muted small"><em>11:13 AM</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-warning fa-fw"></i> Server Not Responding
                                            <span class="pull-right text-muted small"><em>10:57 AM</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-shopping-cart fa-fw"></i> New Order Placed
                                            <span class="pull-right text-muted small"><em>9:49 AM</em>
                                            </span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <i class="fa fa-money fa-fw"></i> Payment Received
                                            <span class="pull-right text-muted small"><em>Yesterday</em>
                                            </span>
                                        </a>
                                    </div>
                                    <!-- /.list-group -->
                                    <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                            


                            <!-- /.panel-body -->

                            <!-- /.panel-footer -->
                        </div>
                        <!-- /.panel .chat-panel -->
                    </div>
                    <!-- /.col-lg-4 -->
                </div>
                <!-- /.row -->
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

    <!-- Morris Charts JavaScript -->
    <script src="js/raphael.min.js"></script>
    <script src="js/morris.min.js"></script>
    <script src="js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/startmin.js"></script>
    
    
    <!-- JavaScript code for the bar chart -->
    <script>
      // Retrieve the monthly sales data from the server-side code
      const monthlySalesData = [
        <% for (Map.Entry<String, BigDecimal> entry : monthlySales.entrySet()) {%>
        <%= entry.getValue()%>,
        <% } %>
      ];

      // Retrieve the dates for the sales data
      const salesDates = [
        <% for (Map.Entry<String, BigDecimal> entry : monthlySales.entrySet()) {%>
          '<%= entry.getKey()%>',
        <% }%>
      ];

      // Create the bar chart using Chart.js
      const ctx = document.getElementById('salesChart').getContext('2d');
      new Chart(ctx, {
        type: 'bar',
        data: {
          labels: salesDates,
          datasets: [{
            label: 'Total Sales',
            data: monthlySalesData,
            backgroundColor: 'rgba(54, 162, 235, 0.6)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1
          }]
        },
        options: {
          responsive: true,
          scales: {
            x: {
              title: {
                display: true,
                text: 'Month'
              }
            },
            y: {
              title: {
                display: true,
                text: 'Total Sales'
              },
              ticks: {
                beginAtZero: true
              }
            }
          }
        }
      });
    </script>

</body>
</html>
