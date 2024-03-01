/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cn.techtutorial.model;

import javax.servlet.http.Part;

/**
 *
 * @author HafezulAminrullah
 */
public class Product1 {

    private int productid;
    private String productName;
    private String description;
    private int quantity;
    private String category;
    private String price;
    private Part image;

    public Product1() {
    }

    public Product1(int productid, String productName, String description, int quantity, String category, String price, Part image) {
        this.productid = productid;
        this.productName = productName;
        this.description = description;
        this.quantity = quantity;
        this.category = category;
        this.price = price;
        this.image = image;
    }
    
    

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Part getImage() {
        return image;
    }

    public void setImage(Part image) {
        this.image = image;
    }
    
    
    
}
