<%-- 
    Document   : listProduct2
    Created on : May 7, 2023, 9:12:16 PM
    Author     : HafezulAminrullah 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Azro Hardware & Electrical</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <title>Azro Hardware & Electrical</title>

        <!-- Bootstrap Core CSS -->
        <!--        <link href="css/bootstrap.min.css" rel="stylesheet">-->

        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">




        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <style>
        body{
            margin-top:20px;
            background:#f8f8f8
        }
    </style>
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
                                <a href="dashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="indexSupplier.jsp" class="active"><i class="fa fa-bar-chart-o fa-fw"></i> Supplier</a>

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
        
        
        
        
        
        
        
        
        
        
        
        <div id="page-wrapper">
        <div class="container-fluid">
        <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Manage <b>Stock</b></h1>
                        </div>

                    </div>
        
        
       <!-- Start Form Supplier --> 
         <div class="container">
         <div class="table-wrapper">
         <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h2></h2>
                                    </div>
                                   <div class="col-sm-6">
           <a href="productControllers?action=insert" class="btn btn-success" data-toggle="modal"><i class="fa fa-plus-circle"></i> <span>Add New Stock</span></a>				
                                    </div>
                                </div>
                            </div>
             
             
        
        <p></p><b>
            <table  id="suppliers" class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th> 
                    <th>Quantity</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Image</th> 
                    <th>Action</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${products}" var="product">
                    <tr>
                        <td><c:out value="${product.productid}"/></td>
                        <td><c:out value="${product.productName}"/></td>
                        <td><c:out value="${product.description}"/></td>
                        <td><c:out value="${product.quantity}"/></td>
                        <td><c:out value="${product.category}"/></td>
                        <td><c:out value="${product.price}"/></td>
                        
                        <td><img style="width: 200px; height: 200px" src="image.jsp?id=<c:out value="${product.productid}"/>"></td>
                        <td><a href="productControllers?action=edit&productId=<c:out value="${product.productid}"/>"class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a></td>
                        <td><a href="productControllers?action=delete&productId=<c:out value="${product.productid}"/>"class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
                    </tr>  
                </c:forEach>
            </tbody>
        </table>
            
            
             </div>
                    </div>
        </div>
        </div>
       
        
        
        
        
        
        
        
        
        
        
        <!--                 jQuery -->
        <script src="js/jquery.min.js"></script>

        <!--                 Bootstrap Core JavaScript -->
        <!--                <script src="js/bootstrap.min.js"></script>-->

        <!--                 Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>

        <!--                Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>


        
        
        
        
        
    </body>
</html>
