/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cn.techtutorial.dao.supplierDao;
import cn.techtutorial.model.supplier;
import java.sql.SQLException;

public class supplierController extends HttpServlet {


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static String INSERT = "/supplier2.jsp";
    private static String EDIT = "/editSupplier2.jsp";
    private static String LIST_SUPPLIER = "/listSupplier2.jsp";
    private supplierDao dao;

    public supplierController() throws ClassNotFoundException, SQLException {
        super();
        dao = new supplierDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")) {
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            dao.deleteSupplier(supplierId);
            forward = LIST_SUPPLIER;
            request.setAttribute("suppliers", dao.getAllSuppliers());
            
        } else if (action.equalsIgnoreCase("edit")) {
            forward = EDIT;
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            supplier Supplier = dao.getSupplierById(supplierId);
            request.setAttribute("Supplier", Supplier);
            
        } else if (action.equalsIgnoreCase("supplierList")) {
            forward = LIST_SUPPLIER;
            request.setAttribute("suppliers", dao.getAllSuppliers());
            
        } else if (action.equalsIgnoreCase("insert")) {
            forward = INSERT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        supplier Supplier = new supplier();
        Supplier.setSupplierid(Integer.parseInt(request.getParameter("supplierid")));
        Supplier.setSupplierName(request.getParameter("supplierName"));
        Supplier.setSupplierAddress(request.getParameter("supplierAddress"));
        Supplier.setContact(request.getParameter("contact"));


        if (action.equalsIgnoreCase("edit")) {
            dao.updateSupplier(Supplier);
        } else {
            dao.addSupplier(Supplier);
        }

        RequestDispatcher view = request.getRequestDispatcher(LIST_SUPPLIER);
        request.setAttribute("suppliers", dao.getAllSuppliers());
        view.forward(request, response);
    }
}