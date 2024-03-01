<%-- 
    Document   : indexSupplier
    Created on : May 2, 2023, 4:27:11 PM
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
        <h1>Supplier Records</h1>
        <jsp:forward page="/supplierController?action=supplierList" />
    </body>
</html>
