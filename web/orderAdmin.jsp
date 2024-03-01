<%-- 
    Document   : orderAdmin
    Created on : Jan 17, 2023, 10:57:22 PM
    Author     : ADMIN
--%>

<!DOCTYPE html>
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
        <link href="css/userListForm" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">



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
                            <i class="fa fa-user fa-fw"></i> HafezulAminrullah <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                                <a href="orderHistory.jsp"><i class="fa fa-table fa-fw"></i> Order History</a>
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

            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header"></h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->



                    <!-- Form Order List -->
                    <div class="container bootdey">
                        <div class="panel panel-default panel-order">
                            <div class="panel-heading">
                                <strong>New Orders !</strong>
                                <div class="btn-group pull-right">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">Filter <i class="fa fa-filter"></i></button>
                                        <ul class="dropdown-menu dropdown-menu-right">
                                            <li><a href="#">Approved orders</a></li>
                                            <li><a href="#">Pending orders</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-1"><img src="https://bootdey.com/img/Content/user_3.jpg" class="media-object img-thumbnail" /></div>
                                    <div class="col-md-11">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="pull-right"><label class="label label-danger">rejected</label></div>
                                                <span><strong>O-126</strong></span> <br />
                                                Quantity : 2, cost: RM323.13 <br />
                                                <a class="label label-danger"> Order has been rejected</a>

                                            </div>
                                            <div class="col-md-12">order made on: 05/31/2022 by <a href="#">Jane Doe </a></div>
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-1"><img src="https://bootdey.com/img/Content/user_1.jpg" class="media-object img-thumbnail" /></div>
                                    <div class="col-md-11">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="pull-right"><label class="label label-info">pending</label></div>
                                                <span><strong>O-98127</strong></span> <br />
                                                Quantity : 12, cost: RM623.13<br />
                                                <a data-placement="top" class="btn btn-success fa fa-check" href="#" title="View"></a>
                                                <a data-placement="top" class="btn btn-danger fa fa-times" href="#" title="Danger"></a>
                                            </div>
                                            <div class="col-md-12">order made on: 06/12/2022 by <a href="#">Jane Doe </a></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-1"><img src="https://bootdey.com/img/Content/user_3.jpg" class="media-object img-thumbnail" /></div>
                                    <div class="col-md-11">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="pull-right"><label class="label label-success">Approved</label></div>
                                                <span><strong>O-92891</strong></span> <br />
                                                Quantity : 4, cost: RM123.13<br />
                                                <a class="btn btn-info" href="#"> View</a>
                                            </div>
                                            <div class="col-md-12">order made on: 06/20/2022 by <a href="#">Jane Doe</a></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-1"><img src="https://bootdey.com/img/Content/user_2.jpg" class="media-object img-thumbnail" /></div>
                                    <div class="col-md-11">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="pull-right"><label class="label label-info">pending</label></div>
                                                <span><strong>O-1288</strong></span> <br />
                                                Quantity : 4, cost: RM123.13<br />
                                                <a data-placement="top" class="btn btn-success fa fa-check" href="#" title="View"></a>
                                                <a data-placement="top" class="btn btn-danger fa fa-times" href="#" title="Danger"></a>
                                            </div>
                                            <div class="col-md-12">order made on: 06/20/2022 by <a href="#">Jane Doe</a></div>
                                        </div>
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
