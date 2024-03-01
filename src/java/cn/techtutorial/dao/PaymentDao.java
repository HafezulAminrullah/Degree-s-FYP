/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cn.techtutorial.dao;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.model.Payment;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;

/**
 *
 * @author Muhammad Haikal Aiman Bin Mohd Puat S59419
 */
public class PaymentDao {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public PaymentDao() throws ClassNotFoundException, SQLException {
        con = DbCon.getConnection();
    }
    
    public int insertPayment(Payment payment) throws IOException {
        
        int result = 0;
        
        try {
            query = "insert into payment (u_id, o_id, receipt, paymentamount, paymentdate) values(?,?,?,?,?)";
            pst = this.con.prepareStatement(query);
            
            pst.setInt(1, payment.getU_id());
            pst.setString(2, payment.getO_id());
            
            Part filePart = payment.getReceipt();
            InputStream inputStream = null;
            if (filePart != null){
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }
            
            if(inputStream != null) {
                pst.setBlob(3, inputStream);
            }
            
            pst.setDouble(4, payment.getPaymentamount());
            pst.setString(5, payment.getPaymentdate());
            result = pst.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;

    }
    
    public int checkOrderPaymentStatus(String id) {
                int result = 0;
        
        try {
            query = "SELECT * from payment WHERE o_id='" + id + "'";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            
            if(rs.next()) {
                result++;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
    
    public List<Payment> getAllPayments() {
        List<Payment> list = new ArrayList<>();
        
        try {
            query = "SELECT * from payment";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            
            while(rs.next()) {
                Payment payment = new Payment();
                payment.setO_id(rs.getString("o_id"));
                payment.setPaymentid(rs.getInt("paymentid"));
                payment.setU_id(rs.getInt("u_id"));
                payment.setPaymentamount(rs.getDouble("paymentamount"));
                payment.setPaymentdate(rs.getString("paymentdate"));
                list.add(payment);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        
        return list;
    }
    
        public List<Payment> getAllPaymentsByU_id(int u_id) {
        List<Payment> list = new ArrayList<>();
        
        try {
            query = "SELECT * from payment where u_id=" + u_id + " ORDER BY paymentid DESC";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            
            while(rs.next()) {
                Payment payment = new Payment();
                payment.setO_id(rs.getString("o_id"));
                payment.setPaymentid(rs.getInt("paymentid"));
                payment.setU_id(rs.getInt("u_id"));
                payment.setPaymentamount(rs.getDouble("paymentamount"));
                payment.setPaymentdate(rs.getString("paymentdate"));
                list.add(payment);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        
        return list;
    }
}
