<%-- 
    Document   : image
    Created on : Jun 19, 2021, 12:44:30 AM
    Author     : Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%  
    String id = request.getParameter("id");
    Blob image = null;
    Connection con = null;
    byte[] imgData = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart", "root", "");
        stmt = con.createStatement();
        rs = stmt.executeQuery("select image from product where productid =" +id);
        if (rs.next()) {
            image = rs.getBlob(1);
            if (image.length() <= 5145728) { // 3MB = 3145728 bytes
            imgData = image.getBytes(1, (int) image.length());
        } else {
                out.println("Image size exceeds the limit of 3MB.");
                return;
            }
            } else {
            out.println("Display Blob Example");
            out.println("image not found for given id");
            return;
        }

        // display the image
        response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
    } catch (Exception e) {
        out.println("Unable To Display image");
        out.println("Image Display Error=" + e.getMessage());
        return;
    } finally {
        try {
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

