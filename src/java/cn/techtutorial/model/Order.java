package cn.techtutorial.model;

public class Order extends Product {

    private String orderId;
    private int uid;
    private int quantity;
    private int p_id;
    private String date;

    public Order() {
    }

    public Order(String orderId, int uid, int quantity, String date) {
        super();
        this.orderId = orderId;
        this.uid = uid;
        this.quantity = quantity;
        this.date = date;
    }

    public Order(int uid, int quantity, String date) {
        super();
        this.uid = uid;
        this.quantity = quantity;
        this.date = date;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
