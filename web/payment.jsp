<%-- 
    Document   : payment
    Created on : Jun 12, 2022, 9:35:32 PM
    Author     : ADMIN
--%>



<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <%@include file="/includes/head.jsp"%>
        <title>Azro Hardware & Electrical</title>
    </head>
        
        

<div class="bodys">
    <body>
      <div class="container py-5">
        <div class="row mb-4">
            <div class="col-lg-8 mx-auto text-center">
                <h1 class="display-6">Payment Forms</h1>
            </div>
        </div> <!-- End -->

        <div class="row">
            <div class="col-lg-6 mx-auto">
                <div class="card ">
                    <div class="card-header">
                        <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">

                            <!-- Credit card form tabs -->
                            <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                                <li class="nav-item"> <a data-toggle="pill" href="#credit-card" class="nav-link active "> <i class="fa fa-credit-card"></i> Credit Card </a> </li>
                                
                            </ul>
                        </div> <!-- End -->

                        <!-- Credit card form content -->
                        <div class="tab-content">
                            <!-- credit card info-->
                            <div id="credit-card" class="tab-pane fade show active pt-3">
                                <form role="form" onsubmit="event.preventDefault()">
                                    <div class="form-group"> <label for="username">
                                            <h6>Card Owner</h6>
                                        </label> <input type="text" name="username" placeholder="Card Owner Name" required class="form-control "> </div>
                                    <div class="form-group"> <label for="cardNumber">
                                            <h6>Card number</h6>
                                        </label>
                                        <div class="input-group"> <input type="text" name="cardNumber" placeholder="Valid card number" class="form-control " required>
                                            <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fa fa-cc-visa"></i> &nbsp;  
                                              <i class="fa fa-cc-mastercard"></i> &nbsp; <i class="fa fa-cc-amex"></i> </span> </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <div class="form-group"> <label><span class="hidden-xs">
                                                        <h6>Expiration Date</h6>
                                                    </span></label>
                                                <div class="input-group"> <input type="number" placeholder="MM" name="" class="form-control" required> 
                                                  <input type="number" placeholder="YY" name="" class="form-control" required> </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group mb-4"> <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                                    <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                                </label> <input type="text" required class="form-control"> </div>
                                        </div>
                                    </div>
                                    <div class="card-footer"> <button type="button" class="subscribe btn btn-primary btn-block shadow-sm"> Confirm Payment </button>
                                </form>
                            </div>
                        </div> <!-- End -->

                        <!-- Cod info -->
                        <div id="paypal" class="tab-pane fade pt-3">
                           <button type="button" class="subscribe btn btn-primary btn-block shadow-sm" > Confirm Payment </button> 
                           <%response.sendRedirect("orders.jsp");%>
                                    
                        </div> <!-- End -->

                        <!-- End -->
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
    <!-- ALL JS FILES -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
	<script src="js/jquery.superslides.min.js"></script>
	<script src="js/images-loded.min.js"></script>
	<script src="js/isotope.min.js"></script>
	<script src="js/baguetteBox.min.js"></script>
	<script src="js/form-validator.min.js"></script>
  <script src="js/contact-form-script.js"></script>
  <script src="js/custom.js"></script>

  <script>
    $(function() {
        $('[data-toggle="tooltip"]').tooltip()
    })
    </script>
    

  </body>
        
    
    </body>
</html>
