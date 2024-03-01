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
import cn.techtutorial.model.User;
/**
 *
 * @author ADMIN
 */
public class UserService {
    

    private Connection con;

    public UserService() throws ClassNotFoundException, SQLException {
        con = DbCon.getConnection();
    }
    
     //Get All Appointments
    //R - Read
    public List<User> getAllUsers() {
        List<User> Users = new ArrayList<User>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from users");
            while (rs.next()) {
                User User = new User();
                User.setId(rs.getInt("id"));
                User.setName(rs.getString("name"));
                User.setEmail(rs.getString("email"));
                Users.add(User);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Users;
    }
    
    //Get appointment by id
     public User getUserById(int id) {
        User User = new User();
        try {
            PreparedStatement preparedStatement = con.prepareStatement
        ("select * from users where id=?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                User.setId(rs.getInt("id"));
                User.setName(rs.getString("name"));
                User.setEmail(rs.getString("email"));
                

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return User;
    }
    
    
}