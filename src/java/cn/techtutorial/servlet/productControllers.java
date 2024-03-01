/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.dao.product1Dao;
import cn.techtutorial.model.Product;
import cn.techtutorial.model.Product1;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)
public class productControllers extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static String INSERT = "/product2.jsp";
    private static String EDIT = "/editProduct2.jsp";
    private static String LIST_PRODUCT = "/listProduct2.jsp";
    private product1Dao dao;

    public productControllers() throws ClassNotFoundException, SQLException {
        super();
        dao = new product1Dao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            dao.deleteProduct(productId);
            forward = LIST_PRODUCT;
            request.setAttribute("products", dao.getAllProducts());

        } else if (action.equalsIgnoreCase("edit")) {
            forward = EDIT;
            int productId = Integer.parseInt(request.getParameter("productId"));
            Product1 Product = dao.getProductById(productId);
            request.setAttribute("Product", Product);

        } else if (action.equalsIgnoreCase("productList")) {
            forward = LIST_PRODUCT;
            request.setAttribute("products", dao.getAllProducts());

        } else if (action.equalsIgnoreCase("insert")) {
            forward = INSERT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();

        //String action = request.getParameter("action");
        //if (action.equals("insert")) {
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String price = request.getParameter("price");
        Part image = request.getPart("image");

        Product1 Product = new Product1();

        Product.setProductName(productName);
        Product.setDescription(description);
        Product.setCategory(category);
        Product.setQuantity(quantity);
        Product.setPrice(price);
        Product.setImage(image);

        int status = 0;
        
        if(request.getParameter("action").equals("edit")) {
            Product.setProductid(Integer.parseInt(request.getParameter("supplierid")));
            dao.updateProduct(Product);
            status = 1;
        } else {
            status = product1Dao.addProduct(Product);
        }

        if (status > 0) {
            List<Product1> products = dao.getAllProducts();
            request.getSession().setAttribute("products", products);
            response.sendRedirect("listProduct2.jsp");
        }

        
        
        
        
        /*else if (action.equalsIgnoreCase("edit")) {
            Product1 Product = new Product1();
            Product.setProductid(Integer.parseInt(request.getParameter("productid")));
            dao.updateProduct(Product);
        } else {
            dao.addProduct(Product);
        }

        RequestDispatcher view = request.getRequestDispatcher(LIST_PRODUCT);
        request.setAttribute("products", dao.getAllProducts());
        view.forward(request, response);*/
    }
}
