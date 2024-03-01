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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
    </head>

    <body>
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
                <div class="col-lg-12">
                    <h1 class="text-center mt-5"><b>Receipt</b></h1>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card mt-4">
                        <div class="card-body text-center">
                            <img class="img-fluid" src="receipt.jsp?id=<%=request.getParameter("id")%>" style="max-width: 100%">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col text-end">
                    <a href="userHistory.jsp" class="btn btn-primary">Back</a>
                </div>
            </div>
        </div>

        <%@include file="/includes/footer.jsp"%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
