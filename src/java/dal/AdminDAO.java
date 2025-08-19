/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Admin;
import dal.DBContext;

/**
 *
 * @author tnteheh
 */
public class AdminDAO {
    public Admin login(String email, String password) {
        try (Connection conn = new DBContext().connection) {
            String sql = "SELECT * FROM Admins WHERE Email = ? AND Password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Admin(
                    rs.getInt("AdminID"),
                    rs.getString("FullName"),
                    rs.getString("Email"),
                    rs.getString("Password"),
                    rs.getString("Phone"),
                    rs.getString("CreatedAt")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
