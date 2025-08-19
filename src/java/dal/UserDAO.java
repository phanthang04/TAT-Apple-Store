/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import model.User;
import dal.DBContext;

/**
 *
 * @author tnteheh
 */
public class UserDAO{
    public User getUserByEmailAndPassword(String email, String password) {
        String sql = "SELECT * FROM Users WHERE Email = ? AND Password = ?";
        try {
            DBContext db = new DBContext();
            Connection conn = db.connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserID(rs.getInt("UserID"));
                u.setFullName(rs.getString("FullName"));
                u.setEmail(rs.getString("Email"));
                u.setPassword(rs.getString("Password"));
                u.setPhone(rs.getString("Phone"));
                u.setAddress(rs.getString("Address"));
                rs.close();
                ps.close();
                conn.close();
                return u;
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean insertUser(User user) {
        String sql = "INSERT INTO Users (FullName, Email, Password, Phone, Address) VALUES (?, ?, ?, ?, ?)";
        try {
            DBContext db = new DBContext();
            Connection conn = db.connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());
            int row = ps.executeUpdate();
            ps.close();
            conn.close();
            return row > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkEmailExists(String email) {
        String sql = "SELECT 1 FROM Users WHERE Email = ?";
        try {
            DBContext db = new DBContext();
            Connection conn = db.connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            boolean exists = rs.next();
            rs.close();
            ps.close();
            conn.close();
            return exists;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    //Lấy thông tin User cho trang profile
    public boolean updateUser(User user) {
        String sql = "UPDATE Users SET FullName = ?, Phone = ?, Address = ? WHERE UserID = ?";
        try {
            DBContext db = new DBContext();
            Connection conn = db.connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getAddress());
            ps.setInt(4, user.getUserID());
            int rows = ps.executeUpdate();
            ps.close();
            conn.close();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    //Thay mật khẩu
    public boolean updatePassword(String email, String newPassword) {
        String sql = "UPDATE Users SET Password = ? WHERE Email = ?";
        try {
            DBContext db = new DBContext();
            Connection conn = db.connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, email);
            int rows = ps.executeUpdate();
            ps.close();
            conn.close();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public int getUserIdByUsername(String username){
        int userId = -1;  // -1 nếu không tìm thấy user
        String sql = "SELECT id FROM Users WHERE email = ?";
        try {
            DBContext db = new DBContext();
            Connection conn = db.connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()){
                if(rs.next())
                    userId = rs.getInt("UserID");
            }
            
        }catch (SQLException e){
            e.printStackTrace();
        }
        return userId;
    }
}
