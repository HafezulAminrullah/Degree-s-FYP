package cn.techtutorial.dao;

import cn.techtutorial.connection.DbCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import cn.techtutorial.model.*;
import java.sql.Statement;

public class OrderDao {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public OrderDao(Connection con) {
        super();
        this.con = con;
    }

    public boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "insert into orders (o_id, u_id, o_date) values(?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1, model.getOrderId());
            pst.setInt(2, model.getUid());
            pst.setString(3, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public boolean insertIntoOrderList(Order model) {
        boolean result = false;
        try {
            query = "insert into orderlist (o_id, p_id, o_quantity) values(?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1, model.getOrderId());
            pst.setInt(2, model.getP_id());
            pst.setInt(3, model.getQuantity());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

//    public List<Order> userOrders(int id) {
//        List<Order> list = new ArrayList<>();
//        try {
//            query = "select * from orders where u_id=? order by orders.o_id desc";
//            pst = this.con.prepareStatement(query);
//            pst.setInt(1, id);
//            rs = pst.executeQuery();
//            while (rs.next()) {
//                Order order = new Order();
//                product1Dao productDao = new product1Dao();
//                int pId = rs.getInt("p_id");
//                Product1 product = productDao.getSingleProduct(pId);
//                order.setOrderId(rs.getInt("o_id"));
//                order.setId(pId);
//                order.setName(product.getProductName());
//                order.setCategory(product.getCategory());
//                order.setPrice(Double.parseDouble(product.getPrice()) * rs.getInt("o_quantity"));
//                order.setQuantity(rs.getInt("o_quantity"));
//                order.setDate(rs.getString("o_date"));
//                list.add(order);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println(e.getMessage());
//        }
//        return list;
//    }
    public static int findIDByString(String id) {
        int status = 0;
        try {
            Connection connection = DbCon.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "SELECT o_id FROM orders where o_id='" + id + "'";
            ResultSet rs = stmt.executeQuery(sqlSelect);

            if (rs.next()) {
                status++;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public List<String> getUserOrdersId(int id) {
        List<String> list = new ArrayList<>();
        try {
            query = "SELECT o_id FROM orders WHERE u_id=" + id;

            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;

    }

    public List<Order> getAllOrdersByOrderId(String id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "SELECT ol.id, ol.o_id, ol.p_id, ol.o_quantity, o.o_date, o.u_id"
                    + " from orderlist ol"
                    + " INNER JOIN orders o ON ol.o_id = o.o_id"
                    + " WHERE ol.o_id=? "
                    + " ORDER BY o.o_id desc";
            pst = this.con.prepareStatement(query);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                product1Dao productDao = new product1Dao();
                int pId = rs.getInt("p_id");
                Product1 product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getString("ol.o_id"));
                order.setId(pId);
                order.setName(product.getProductName());
                order.setCategory(product.getCategory());
                order.setPrice(Double.parseDouble(product.getPrice()) * rs.getInt("o_quantity"));
                order.setQuantity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "SELECT ol.id, ol.o_id, ol.p_id, ol.o_quantity, o.o_date, o.u_id"
                    + " from orderlist ol"
                    + " INNER JOIN orders o ON ol.o_id = o.o_id"
                    + " WHERE u_id=? "
                    + " ORDER BY o.o_id desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                product1Dao productDao = new product1Dao();
                int pId = rs.getInt("p_id");
                Product1 product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getString("ol.o_id"));
                order.setId(pId);
                order.setName(product.getProductName());
                order.setCategory(product.getCategory());
                order.setPrice(Double.parseDouble(product.getPrice()) * rs.getInt("o_quantity"));
                order.setQuantity(rs.getInt("o_quantity"));
                order.setDate(rs.getString("o_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    // list order//
    public List<Order> getAllOrders() {
        List<Order> Orders = new ArrayList<Order>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from orders");
            while (rs.next()) {
                Order Order = new Order();
                Order.setOrderId(rs.getString("o_id"));
                Order.setUid(rs.getInt("u_id"));
                Order.setQuantity(rs.getInt("o_quantity"));
                Orders.add(Order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Orders;
    }

    //end order list//
    public void cancelOrderList(String o_id, int p_id) {
        //boolean result = false;
        try {
            query = "delete from orderlist where o_id=? AND p_id=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, o_id);
            pst.setInt(2, p_id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
    
        public void cancelOrderListByOrderId(String o_id) {
        //boolean result = false;
        try {
            query = "delete from orderlist where o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, o_id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }

    public void cancelOrder(String id) {
        //boolean result = false;
        try {
            query = "delete from orders where o_id=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
}
