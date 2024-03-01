<%-- 
    Document   : login
    Created on : Jun 12, 2022, 9:34:56 PM
    Author     : ADMIN
--%>

<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("dashboard.jsp");
	}
	
	%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>Azro Hardware & Electrical</title>
</head>
<body style="background-color:#0e0f0f;">
	

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Staff Login</div>
			<div class="card-body">
				<form action="staff-login" method="post">
					<div class="form-group">
						<label>Email address</label> 
						<input type="email" name="login-email" class="form-control" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label>Password</label> 
						<input type="password" name="login-password" class="form-control" placeholder="Password">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
                                    <div class="d-flex justify-content-center links">
					Don't have an account?<a href="register.jsp"> Sign Up</a>
				</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>