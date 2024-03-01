<%-- 
    Document   : userEdit
    Created on : Jan 22, 2023, 11:10:48 PM
    Author     : ADMIN
--%>

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
                    <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span></a></li>
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
    %>

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="card mt-4">
                    <div class="card-body text-center">
                        <div class="user-profile">
                            <div class="user-avatar">
                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin" style="width:200px;height:242px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mt-4">
                    <div class="card-body">
                        <form action="UserServlet" method="POST">
                            <input type="hidden" name="id" value="<%=auth.getId()%>">
                            <h6 class="mb-4 text-primary">Personal Details</h6>
                            <div class="form-group row">
                                <label for="fullName" class="col-md-3 col-form-label">Full Name</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="name" value="<%=auth.getName()%>" id="fullName" placeholder="Enter full name">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email" class="col-md-3 col-form-label">Email</label>
                                <div class="col-md-9">
                                    <input type="email" class="form-control" name="email" value="<%=auth.getEmail()%>" id="email" placeholder="Enter email ID">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="password" class="col-md-3 col-form-label">Password</label>
                                <div class="col-md-9">
                                    <input type="password" class="form-control" name="password" value="<%=auth.getPassword()%>" id="password" placeholder="Enter password">
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" id="submit" name="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="/includes/footer.jsp"%>
</body>
</html>
