/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;
import cn.techtutorial.model.supplier;
import cn.techtutorial.connection.DbCon;
/**
 *
 * @author ADMIN
 */
public class supplierDao {
    

    private Connection con;

    public supplierDao() throws ClassNotFoundException, SQLException {
        con = DbCon.getConnection();
    }

    
        public void addSupplier(supplier Supplier) {
        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("insert into suppliers(suppliername,supplieraddress,contact) values (?,?,?)");

            //Parameters start with 1
            preparedStatement.setString(1, Supplier.getSupplierName());
            preparedStatement.setString(2, Supplier.getSupplierAddress());
             preparedStatement.setString(3, Supplier.getContact());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
    
    //D - Delete
    public void deleteSupplier(int supplierId) {
        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("delete from suppliers where supplierid=?");

            //Parameters start with 1
            preparedStatement.setInt(1, supplierId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
     //U - Update
    public void updateSupplier(supplier Supplier) {
        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("update suppliers set suppliername=?, supplieraddress=?, contact=? "
                            + " where supplierid=?");
            //Parameters start with 1   
            preparedStatement.setString(1, Supplier.getSupplierName());
            preparedStatement.setString(2, Supplier.getSupplierAddress());
            preparedStatement.setString(3, Supplier.getContact());
            preparedStatement.setInt(4, Supplier.getSupplierid());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //Get All Appointments
    //R - Read
    public List<supplier> getAllSuppliers() {
        List<supplier> suppliers = new ArrayList<supplier>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from suppliers");
            while (rs.next()) {
                supplier Supplier = new supplier();
                Supplier.setSupplierid(rs.getInt("supplierid"));
                Supplier.setSupplierName(rs.getString("suppliername"));
                Supplier.setSupplierAddress(rs.getString("supplieraddress"));
                Supplier.setContact(rs.getString("contact"));
                suppliers.add(Supplier);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return suppliers;
    }
    
    //Get appointment by id
     public supplier getSupplierById(int supplierId) {
        supplier Supplier = new supplier();
        try {
            PreparedStatement preparedStatement = con.prepareStatement
        ("select * from suppliers where supplierid=?");
            preparedStatement.setInt(1, supplierId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Supplier.setSupplierid(rs.getInt("supplierid"));
                Supplier.setSupplierName(rs.getString("suppliername"));
                Supplier.setSupplierAddress(rs.getString("supplieraddress"));
                Supplier.setContact(rs.getString("contact"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Supplier;
    }
}