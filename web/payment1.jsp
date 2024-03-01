<%@page import="cn.techtutorial.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="java.util.List"%>
<%@page import="cn.techtutorial.model.Order"%>
<%@page import="cn.techtutorial.model.User"%>
<%@page import="java.text.DecimalFormat"%>
<!--
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <title>Azro Hardware & Electrical</title>

         Bootstrap Core CSS 
                <link href="css/bootstrap.min.css" rel="stylesheet">

         MetisMenu CSS 
        <link href="css/metisMenu.min.css" rel="stylesheet">

         Custom CSS 
        <link href="css/startmin.css" rel="stylesheet">
    <head>
        <style>

            body{
                background:#eee;
            }

            .card {
                box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: 1rem;
            }

            .card-body {
                -webkit-box-flex: 1;
                -ms-flex: 1 1 auto;
                flex: 1 1 auto;
                padding: 1.5rem 1.5rem;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="h3 mb-5">Payment</h1>
            <div class="row">
                 Left 
                <div class="col-lg-9">
                    <div class="accordion" id="accordionPayment">
                         Credit card 
                        <div class="accordion-item mb-3">
                            <h2 class="h5 px-4 py-3 accordion-header d-flex justify-content-between align-items-center">
                                <div class="form-check w-100 collapsed" data-bs-toggle="collapse" data-bs-target="#collapseCC" aria-expanded="false">



                                    <span>
                                        <svg width="34" height="25" xmlns="http://www.w3.org/2000/svg">
                                        <g fill-rule="nonzero" fill="#333840">
                                        <path d="M29.418 2.083c1.16 0 2.101.933 2.101 2.084v16.666c0 1.15-.94 2.084-2.1 2.084H4.202A2.092 2.092 0 0 1 2.1 20.833V4.167c0-1.15.941-2.084 2.102-2.084h25.215ZM4.203 0C1.882 0 0 1.865 0 4.167v16.666C0 23.135 1.882 25 4.203 25h25.215c2.321 0 4.203-1.865 4.203-4.167V4.167C33.62 1.865 31.739 0 29.418 0H4.203Z"></path>
                                        <path d="M4.203 7.292c0-.576.47-1.042 1.05-1.042h4.203c.58 0 1.05.466 1.05 1.042v2.083c0 .575-.47 1.042-1.05 1.042H5.253c-.58 0-1.05-.467-1.05-1.042V7.292Zm0 6.25c0-.576.47-1.042 1.05-1.042H15.76c.58 0 1.05.466 1.05 1.042 0 .575-.47 1.041-1.05 1.041H5.253c-.58 0-1.05-.466-1.05-1.041Zm0 4.166c0-.575.47-1.041 1.05-1.041h2.102c.58 0 1.05.466 1.05 1.041 0 .576-.47 1.042-1.05 1.042H5.253c-.58 0-1.05-.466-1.05-1.042Zm6.303 0c0-.575.47-1.041 1.051-1.041h2.101c.58 0 1.051.466 1.051 1.041 0 .576-.47 1.042-1.05 1.042h-2.102c-.58 0-1.05-.466-1.05-1.042Zm6.304 0c0-.575.47-1.041 1.051-1.041h2.101c.58 0 1.05.466 1.05 1.041 0 .576-.47 1.042-1.05 1.042h-2.101c-.58 0-1.05-.466-1.05-1.042Zm6.304 0c0-.575.47-1.041 1.05-1.041h2.102c.58 0 1.05.466 1.05 1.041 0 .576-.47 1.042-1.05 1.042h-2.101c-.58 0-1.05-.466-1.05-1.042Z"></path>
                                        </g>
                                        </svg>
                                    </span>

                                    <label class="form-check-label pt-1" for="payment1">
                                        Duit Now QR Payment Only Accepted
                                    </label>
                                </div>
                            </h2>
                            <div id="collapseCC" class="accordion-collapse collapse show" data-bs-parent="#accordionPayment" style="">
                                <div class="accordion-body">

                                    <div class="container">
                                        <p>Please Scan the QR Code</p>      
                                        <img src="assets/img/qr.jpg" alt="..."  class="img-rounded"  width="304" height="400"> 
                                    </div>



                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="mb-3">
                                                <p></p>
                                                <label class="form-label">Upload Receipt</label>
                                                <input type="file" class="form-control" placeholder="">
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                         PayPal 
                        <div class="accordion-item mb-3 border">
                            <h2 class="h5 px-4 py-3 accordion-header d-flex justify-content-between align-items-center">


                            </h2>
                            <div id="collapsePP" class="accordion-collapse collapse" data-bs-parent="#accordionPayment" style="">
                                <div class="accordion-body">
                                    <div class="px-2 col-lg-6 mb-3">
                                        <label class="form-label">Email address</label>
                                        <input type="email" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 Right 
                <div>
                    <div class="card position-sticky top-0">
                        <div class="p-3 bg-light bg-opacity-10">
                            <h6 class="card-title mb-3">Order Summary</h6>
                            <div class="d-flex justify-content-between mb-1 small">
                                <span>Total Amount</span> <span>RM 214.50</span>
                            </div>
                            <div class="d-flex justify-content-between mb-1 small">
                                <span>Shipping</span> <span>$20.00</span>
                            </div>
                            <div class="d-flex justify-content-between mb-1 small">
                                <span>Coupon (Code: NEWYEAR)</span> <span class="text-danger">-$10.00</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between mb-4 small">
                                <span>TOTAL</span> <strong class="text-dark">$224.50</strong>
                            </div>
                            
                            
                            <button class="btn btn-primary w-100 mt-2">Place order</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>-->




<! DOCTYPE html>  
<html>  
    <head>  
        <title> Bootstrap 4 Checkout Form Example  
        </title>  
        <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">  
        <meta name = "viewport" content = "width=device-width, initial-scale=1, shrink-to-fit=no">   
        <link rel = "stylesheet" href = "https://fonts.googleapis.com/css?family=Open+Sans:300,400,600|Raleway:300,400,600&subset=latin-ext">  
        <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css">  
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>  
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js  
<script src = "https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.min.js"> </script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"> </script>  
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"> </script>  
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"> </script>  
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"> </script>  
    </head>  
    <style>
        html, body
        {
            height: 100%;
            color: black;
            font-family: 'Open Sans', sans-serif;
            font-weight: 400;
        }
        body
        {
            font-size: 62.5%;
        }
        body
        {
            background:  url(assets/img/satu.jpg) no-repeat center center fixed;
            background-size: cover;
        }
        .main-wrapper
        {
            border-radius: 15px 15px 15px 15px;
            -moz-border-radius: 15px 15px 15px 15px;
            -webkit-border-radius: 15px 15px 15px 15px;
            border: none;
            -webkit-box-shadow: 0px 20px 10px 10px rgba(0,0,0,0.1);
            -moz-box-shadow: 0px 20px 10px 10px rgba(0,0,0,0.1);
            box-shadow: 0px 20px 10px 10px rgba(0,0,0,0.1);
        }
        .basket-header
        {
            border-radius: 15px 0 0 0;
            -moz-border-radius: 15px 0 0 0;
            -webkit-border-radius: 15px 0 0 0;
            padding-left: 25px !important;
        }
        .creditcard-header
        {
            border-radius: 0 15px 0 0;
            -moz-border-radius: 0 15px 0 0;
            -webkit-border-radius: 0 15px 0 0;
            padding-left: 35px !important;
        }
        .panel-header
        {
            background: #D4AF37;
            height: 70px;
            padding: 15px 20px 0 20px;
        }
        .panel-wrapper .basket-header .column-titles
        {
            color: #A2C6DD;
            padding: 0;
            margin: 0;
            display: none;
            visibility: hidden;
        }
        .fix-overflow
        {
            padding-right: 5px !important;
        }
        .panel-wrapper .basket-body
        {
            overflow-x: hidden;
            overflow-y: auto;
        }
        .panel-wrapper .creditcard-body
        {
            padding: 10px ;
        }
        .panel-wrapper .panel-body
        {
            font-weight: 400;
            font-size: 1.2em;
            outline: none !important;
            min-height: 500px;
            max-height: 500px;
        }
        .basket-body
        {
            background: #F9F9F9;
        }
        .creditcard-body
        {
            background: white;
        }
        .basket-body .row.product
        {
            margin: 5px 0 5px 0;
            padding:  5px 0 5px 0;
            border-bottom: solid 1px #eeeeee;
        }
        .basket-body .row.product div
        {
            color: #777879;
            padding: 0 10px 0 10px;
        }
        .product-image img
        {
            -o-object-fit: contain;
            object-fit: contain;
            width: 100%;
            min-width: 100%;
            max-width: 100%;
            max-height: 80px;
        }
        .card-wrapper
        {
            height: 100%;
        }
        .padding-top-10
        {
            padding-top: 10px !important;
        }

        .padding-top-20
        {
            padding-top: 20px !important;
        }
        .padding-horizontal-40
        {
            padding: 0 40px 0 40px;
        }
        .align-right
        {
            text-align: right;
        }
        .align-center
        {
            text-align: center;
        }
        .emphasized
        {
            font-family: 'Open Sans', sans-serif;
            font-weight: 600;
            font-size: 1.6em;
            color: white;
        }
        .description
        {
            font-family: 'Open Sans', sans-serif;
            font-weight: 400;
            font-size: 1.2em;
            color: #080808;
        }
        .panel-footer
        {
            padding-top: 10px;
            height: 150px;
        }
        .basket-footer
        {
            background: #D4AF37;
            border-radius: 0 0 0 15px;
            -moz-border-radius: 0 0 0 15px;
            -webkit-border-radius: 0 0 0 15px;
        }
        .creditcard-footer
        {
            background: white;
            border-radius: 0 0 15px 0;
            -moz-border-radius: 0 0 15px 0;
            -webkit-border-radius: 0 0 15px 0;
            padding: 75px 30px 0 30px;
        }
        .panel-footer hr
        {
            margin: 3px 0 3px 0;
            display: block;
            height: 1px;
            border: 0;
            border-top: 1px solid #197fb3;
            padding: 0;
        }
        .panel-footer button
        {
            border: solid 1px #D4AF37;
            background: #D4AF37;
            font-family: 'Open Sans', sans-serif;
            font-weight: 600;
            color: white;
            font-size: 1.3em;
            text-transform: uppercase;
            padding: 10px 15px 11px 15px;
            border-radius: 5px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
        }
        .panel-footer button:hover
        {
            cursor: pointer;
        }
        button.cancel:after {
            content: '';
            position: absolute;
            z-index: -1;
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            transition: all 0.3s;
        }
        button {
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            transition: all 150ms linear;
            text-align: center;
            white-space: nowrap;
            text-decoration: none !important;
            text-transform: none;
            text-transform: capitalize;
            color: #fff;
            border: 0 none;
            border-radius: var(--borderRadius);
            font-size: 13px;
            font-weight: 500;
            line-height: 1.3;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            box-shadow: 2px 5px 10px var(--color-smoke);
        }
        button.cancel:before {
            font-family: 'icomoon';
            speak: none;
            font-style: normal;
            font-weight: normal;
            font-variant: normal;
            text-transform: none;
            line-height: 1;
            position: relative;
            -webkit-font-smoothing: antialiased;
        }
        button.cancel
        {
            background: white;
            color: #D4AF37;
        }
        button.cancel:hover
        {
            background: #ff0000;
            border-color: #ff0000;
            color: white;
        }
        button.confirm:hover
        {
            background: #00b300;
            border-color: #00b300;
            color: white;
        }

        .dive
        {
            margin-top: 5px;
        }
        .sub
        {
            font-size: 75%;
            color: #aaaaaa;
        }
        .very
        {
            font-size: 2.2em;
        }
        .creditcard-body form
        {
            font-size: 1.3em;
        }
        .creditcard-body form i.fa
        {
            margin-right: 10px;
            color: #D4AF37;
        }
        .creditcard-body form fieldset
        {
            border-bottom: dotted 2px #D0D0D0;
            margin-bottom: 25px;
        }
        .creditcard-body form input
        {
            border: none;
            font-weight: 600;
            color: #555555;
            width: 70%;
            outline: none;
        }
        .creditcard-body form input::placeholder
        {
            color: #D0D0D0;
        }
        .creditcard-body form label
        {
            color:  #aaaaaa;
        }
        .additional
        {
            font-weight: 300;
            font-size: 80%;
        }
        .fa-info-circle
        {
            color: #aaaaaa !important;
        }
        span.month.focused.active
        {
            background: #D4AF37 !important;
            background-image: none !important;
        }

        .flex-body {
            display: flex;
            justify-content: center;
        }

        .flex-row {
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: space-around;
            align-items: stretch;
            align-content: stretch;
        }

        .flex-column {
            display: flex;
            flex-direction: column;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: stretch;
            align-content: stretch;
        }

        @media (max-width: 992px)
        {
        }
        @media (max-width: 767px)
        {
            .basket-header
            {
                border-radius: 15px 15px 0 0;
                -moz-border-radius: 15px 15px 0 0;
                -webkit-border-radius: 15px 15px 0 0;
            }
            .basket-footer
            {
                background: #D4AF37;
                border-radius: 0;
                -moz-border-radius: 0;
                -webkit-border-radius: 0;
            }
            .creditcard-header
            {
                border-radius: 0;
                -moz-border-radius: 0;
                -webkit-border-radius: 0;
            }
            .creditcard-footer
            {
                border-radius: 0 0 15px 15px;
                -moz-border-radius: 0 0 15px 15px;
                -webkit-border-radius: 0 0 15px 15px;
            }
        }
    </style>  
    <body>
        <%
            DecimalFormat dcf = new DecimalFormat("#.##");
            request.setAttribute("dcf", dcf);
            User auth = (User) request.getSession().getAttribute("auth");
            List<Order> orders = null;
            if (auth != null) {
                request.setAttribute("person", auth);
                OrderDao orderDao = new OrderDao(DbCon.getConnection());
//                orders = orderDao.userOrders(auth.getId());
                  orders = orderDao.getAllOrdersByOrderId(request.getParameter("id"));
            } else {
                response.sendRedirect("login.jsp");
            }
            ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
            if (cart_list != null) {
                request.setAttribute("cart_list", cart_list);
            }

            double totalPrice = 0;

        %>
        <div class = "container-fluid background">  
            <div class = "row padding-top-20">  
                <div class = "col-12 col-sm-12 col-md-10 col-lg-10 col-xl-8 offset-md-1 offset-lg-1 offset-xl-2 padding-horizontal-30">  
                    <div class = "row" style="padding-left: 250px">  
                        <div class = "col-12 main-wrapper">  
                            <div class = "row">                 
                                <div class="col-10">  
                                    <div class="row panel-wrapper">  
                                        <div class = "col-12 panel-header creditcard-header">  
                                            <div class = "row">  
                                                <div class = "col-12 creditcard-title">  
                                                    <span class = "description"> <b> Payment </b> </span> <br> <span class = "emphasized"> Duit Now QR </span>  
                                                </div>  
                                            </div>  
                                        </div>  
                                        <div class = "col-12 panel-body creditcard-body">

                                            <form id="myForm" action = "PaymentServlet?action=add" method = "post" enctype="multipart/form-data">  


                                                <div class="flex-body">
                                                    <img src="assets/img/code.jpg" alt="..."  class="img-rounded" width="250" height="250">
                                                </div>

                                                <div class="flex-row">
                                                    <div>
                                                        <div>
                                                            <div class="form-group">
                                                                <label for="date">Date:</label>
                                                                <p><%=orders.get(0).getDate()%></p>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="items">Orders:</label>
                                                                <div class="flex-column">
                                                                    <%  if (orders != null) {
                                                                        for (Order o : orders) {%>
                                                                        <input type="hidden" name="o_id" value="<%=o.getOrderId()%>" />
                                                                    <li><%=o.getName()%>    x<%=o.getQuantity()%>  <span style="float: right">RM<%=dcf.format(o.getPrice())%></span></li>
                                                                        <%
                                                                            totalPrice += o.getPrice();
                                                                        %>


                                                                    <%}
                                                                        }
                                                                    %>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div>

                                                        <div class="form-group">
                                                            <label for="paymentAmount">Total Price</label>
                                                            <p>RM <%=dcf.format(totalPrice)%></p>
                                                            <input type="hidden" name="paymentAmount" value="<%=dcf.format(totalPrice)%>" />
                                                            <input type="hidden" name="u_id" value="<%=auth.getId()%>" />
                                                        </div>
                                                        <fieldset>  
                                                            <label for=""> Upload Receipt </label> <br>  
                                                            <i class="fa fa-upload" aria-hidden = "true"> </i> 
                                                            <input type='file' id='receipt' name='receipt' accept="image/*"  title = 'receipt'>  
                                                        </fieldset>  
                                                        <div> 
                                                            <i class="fa fa-file-image-o" aria-hidden="true"> Please upload in image format </i>
                                                           
                                                        </div> 
                                                    </div>
                                                </div>

                                        </div>  
                                        <div class = "col-12 panel-footer creditcard-footer">  
                                            <div class = "row">  
                                                <div class="col-12 align-right"> 
                                                    <button type="button" class="cancel" onclick="window.location.href='orders.jsp';"> Cancel </button>   
                                                    <button type="submit" onclick="checkFileInput()" class="confirm"> Confirm & Pay </button> </div>  
                                            </div>  
                                        </div>  
                                        </form> 
                                    </div>  
                                </div>  
                            </div>  
                        </div>  
                    </div>  
                </div>  
            </div>  
        </div>  
        <script>
            
              function cancel() {
                  window.location.href="orders.jsp";
              }
              
              var fileInput = document.getElementById("receipt");
              
                  fileInput.addEventListener('change', validateFileType);

            // Function to validate the file type
            function validateFileType(event) {
              const file = event.target.files[0];
              const fileType = file.type.toLowerCase();

              // Allowed file types (images)
              const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];

              if (!allowedTypes.includes(fileType)) {
                // Clear the file input value
                fileInput.value = '';
                alert('Please select a valid image file (JPEG, PNG, or GIF).');
              }
            }
              
              
              function checkFileInput() {
                  var fileInput = document.getElementById("receipt");
                  if(fileInput.files.length === 0) {
                      event.preventDefault();
                      alert("File input is empty. Please select a file.");
                  } else {
                      document.getElementById("myForm").submit();               
                  }
              }                                    
        </script>
    </body>  
</html> 