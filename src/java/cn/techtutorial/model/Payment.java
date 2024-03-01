/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cn.techtutorial.model;

import javax.servlet.http.Part;

/**
 *
 * @author Muhammad Haikal Aiman Bin Mohd Puat S59419
 */
public class Payment {
    int paymentid;
    int u_id;
    String o_id;
    Part receipt;
    double paymentamount;
    String paymentdate;

    public int getPaymentid() {
        return paymentid;
    }

    public void setPaymentid(int paymentid) {
        this.paymentid = paymentid;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getO_id() {
        return o_id;
    }

    public void setO_id(String o_id) {
        this.o_id = o_id;
    }

    public Part getReceipt() {
        return receipt;
    }

    public void setReceipt(Part receipt) {
        this.receipt = receipt;
    }

    public double getPaymentamount() {
        return paymentamount;
    }

    public void setPaymentamount(double paymentamount) {
        this.paymentamount = paymentamount;
    }

    public String getPaymentdate() {
        return paymentdate;
    }

    public void setPaymentdate(String paymentdate) {
        this.paymentdate = paymentdate;
    }
    
    
}
