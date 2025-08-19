/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author tnteheh
 */
public class CategoriesDAO extends DBContext{
    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT CategoryID, CategoryName, Description FROM Categories";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int categoryID = rs.getInt("CategoryID");
                String categoryName = rs.getString("CategoryName");
                String description = rs.getString("Description");
                categories.add(new Category(categoryID, categoryName, description));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return categories;
    }
    
    
    //Thêm Category
    public void insertCategory(String name, String description) {
        String sql = "INSERT INTO Categories (CategoryName, Description) VALUES (?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, description);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //Sửa Category
    public void updateCategory(int id, String name, String description) {
        String sql = "UPDATE Categories SET CategoryName = ?, Description = ? WHERE CategoryID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //Xoá Category
    public void deleteCategory(int id) {
            String sql = "DELETE FROM Categories WHERE CategoryID = ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, id);
                st.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
}
