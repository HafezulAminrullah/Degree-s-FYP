<%--
    Document   : index
    Created on : Jan 9, 2023, 9:34:46 PM
    Author     : ADMIN
--%>
<%@page import="cn.techtutorial.dao.supplierDao"%>
<%@page import="cn.techtutorial.dao.product1Dao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> productss = pd.getAllProducts();

product1Dao dao = new product1Dao();
List<Product1> products = dao.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
    request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
   <style>
       
    .card-img-top {
        position: relative;
    }

    .card-img-top .hover-container {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        opacity: 0;
        transition: opacity 0.3s;
        background-color: rgba(0, 0, 0, 0.8);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card-img-top:hover .hover-container {
        opacity: 1;
    }

    .hover-text {
        color: white;
        font-size: 16px;
        padding: 10px;
        text-align: center;
    }
</style>
    <title>Azro Hardware & Electrical</title>
</head>
<body style="background-color:#0e0f0f;">
    <%@include file="/includes/navbar.jsp"%>

    <div class="container">
        <div class="card-header my-3"></div>
        <div class="row">
            <% if (!products.isEmpty()) {
            for (Product1 p : products) { %>
            <div class="col-md-3 my-3">
                <div class="card w-100">
                    <div class="card-img-top">
                        <img style="height: 500px; width: 304px;" src="image.jsp?id=<%=p.getProductid()%>" alt="Card image cap">
                        <div class="hover-container">
                            <div class="hover-text"><%=p.getDescription()%></div>
                        </div>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title"><%=p.getProductName()%></h4>
                        <h6 class="price">Price: RM<%=p.getPrice()%></h6>
                        <h7 class="category">Category: <%=p.getCategory()%></h7>
                        <div class="mt-3 d-flex justify-content-between">
                            <a class="btn btn-warning btn-block" href="add-to-cart?id=<%=p.getProductid()%>">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </div>
            <% } } else { out.println("There are no products"); } %>
        </div>
    </div>



    <section class="signup-section" id="signup">
        <!-- Rest of the code -->
    </section>

    <!-- Rest of the code -->
        
    <section class="contact-section bg-black">
        <!-- Rest of the code -->
    </section>

    <div>
        <%@include file="/includes/head2.jsp"%>
        <!-- Rest of the code -->
    </div>
    <!-- Contact-->
        <section class="contact-section bg-black">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-map-marked-alt text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">Address</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50">Lot pt 16224 Jalan Tepuh, Kampung Padang Nenas, 21030 Kuala Terengganu, Terengganu</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-envelope text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">Email</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50"><a href="#!">customercare@azrohardware.com</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-mobile-alt text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">Phone</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50">09-669 6358</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="social d-flex justify-content-center">
                    <a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                    <a class="mx-2" href="https://www.facebook.com/kedaicatazro/"><i class="fab fa-facebook-f"></i></a>
                    <a class="mx-2" href="#!"><i class="fab fa-github"></i></a>
                </div>
            </div>
        </section>
     <!-- Footer-->
        <footer class="footer bg-black small text-center text-white-50"><div class="container px-4 px-lg-5">Copyright &copy; Azro Hardware & Electrical 2022</div></footer>
    
</body>
 <%@include file="/includes/footer.jsp"%>
</html>