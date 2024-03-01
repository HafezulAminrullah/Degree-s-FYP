<%-- 
    Document   : indexProduct
    Created on : Jun 7, 2023, 6:41:24 PM
    Author     : HafezulAminrullah 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web-Based Hardware Ordering System</title>
    </head>
    <body>
        <h1>Users List</h1>
        <jsp:forward page="/productControllers?action=productList" />
    </body>
</html>
