/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cn.techtutorial.dao;

/**
 *
 * @author HafezulAminrullah
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;
import cn.techtutorial.connection.DbCon;
import cn.techtutorial.model.Cart;
import cn.techtutorial.model.Product;
import cn.techtutorial.model.Product1;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

public class product1Dao {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public product1Dao() throws ClassNotFoundException, SQLException {
        con = DbCon.getConnection();
    }

    //c - Create
//    public void addSupplier(supplier Supplier) {
//        try {
//            PreparedStatement preparedStatement = con.
//                    prepareStatement("insert into suppliers(supplierid,suppliername,supplieraddress,contact) values (?,?,?,?)");
//
//            //Parameters start with 1
//            preparedStatement.setInt(1, Supplier.getSupplierid());
//            preparedStatement.setString(2, Supplier.getSupplierName());
//            preparedStatement.setString(3, Supplier.getSupplierAddress());
//             preparedStatement.setString(4, Supplier.getContact());
//
//            preparedStatement.executeUpdate();
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//
//        }
//    }
    public static int addProduct(Product1 Product){
        int status = 0;

        try {
            Connection con = DbCon.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("insert into product(productname,description,quantity,category,price,image) values (?,?,?,?,?,?)");

            //Parameters start with 1
            preparedStatement.setString(1, Product.getProductName());
            preparedStatement.setString(2, Product.getDescription());
            preparedStatement.setInt(3, Product.getQuantity());
            preparedStatement.setString(4, Product.getCategory());
            preparedStatement.setString(5, Product.getPrice());

            Part filePart = Product.getImage();
            InputStream inputStream = null;
            if (filePart != null){
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }
            
            if(inputStream != null) {
                preparedStatement.setBlob(6, inputStream);
            }

            status = preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        }
        return status;
    }

    //D - Delete
    public void deleteProduct(int productId) {
        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("delete from product where productid=?");

            //Parameters start with 1
            preparedStatement.setInt(1, productId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //U - Update
    public void updateProduct(Product1 Product) throws IOException {
        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("update product set productname=?, description=?, quantity=?, category=?, price=?, image=? "
                            + " where productid=?");
            //Parameters start with 1   
            
//            Part filePart = Product.getImage();
//            InputStream inputStream = null;
//            
//            inputStream = filePart.getInputStream();
            
            // fetches input stream of the upload file for the blob column
            
            
            preparedStatement.setString(1, Product.getProductName());
            preparedStatement.setString(2, Product.getDescription());
            preparedStatement.setInt(3, Product.getQuantity());
            preparedStatement.setString(4, Product.getCategory());
            preparedStatement.setString(5, Product.getPrice());
            
            Part filePart = Product.getImage();
            InputStream inputStream = null;
            if (filePart != null){
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }
            
            if(inputStream != null) {
                preparedStatement.setBlob(6, inputStream);
            }
            
            preparedStatement.setInt(7, Product.getProductid());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Get All Appointments
    //R - Read
    public List<Product1> getAllProducts() {
        List<Product1> products = new ArrayList<Product1>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from product");
            while (rs.next()) {
                Product1 Product = new Product1();
                Product.setProductid(rs.getInt("productid"));
                Product.setProductName(rs.getString("productname"));
                Product.setDescription(rs.getString("description"));
                Product.setQuantity(rs.getInt("quantity"));
                Product.setCategory(rs.getString("category"));
                Product.setPrice(rs.getString("price"));
 
                products.add(Product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //Get appointment by id
    public Product1 getProductById(int productId) {
        Product1 Product = new Product1();
        try {
            PreparedStatement preparedStatement = con.prepareStatement("select * from product where productid=?");
            preparedStatement.setInt(1, productId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Product.setProductid(rs.getInt("productid"));
                Product.setProductName(rs.getString("productname"));
                Product.setDescription(rs.getString("description"));
                Product.setQuantity(rs.getInt("quantity"));
                Product.setCategory(rs.getString("category"));
                Product.setPrice(rs.getString("price"));
              

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Product;
    }
    
    	 public Product1 getSingleProduct(int id) {
		 Product1 row = null;
	        try {
	            query = "select * from product where productid=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new Product1();
	                row.setProductid(rs.getInt("productid"));
	                row.setProductName(rs.getString("productname"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(Double.toString(rs.getDouble("price")));
//	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
    
    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from product where productid=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }

    
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> book = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from product where productid=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("productid"));
                        row.setName(rs.getString("productname"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
}



