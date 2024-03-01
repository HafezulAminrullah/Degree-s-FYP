package cn.techtutorial.connection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {

    private static Connection myConnection = null;
   private static String myURL = myURL = "jdbc:mysql://localhost:3306/ecommerce_cart";
//    private static String myURL = myURL = "jdbc:mysql://localhost:3306/s59914_ecommerce_cart";

    DbCon() {
    }

    public static Connection getConnection() throws ClassNotFoundException {
        if (myConnection != null) {
            return myConnection;
        } else
            try {
            //Establish and open MySQL database connection.....
            Class.forName("com.mysql.jdbc.Driver");
           myConnection = DriverManager.getConnection(myURL, "root", "");
//            myConnection = DriverManager.getConnection(myURL, "s59914", "Fsse1AW5qOx3");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return myConnection;
    }

    public void closeConnection() throws ClassNotFoundException {
        try {
            myConnection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
