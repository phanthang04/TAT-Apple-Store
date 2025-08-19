/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;


import java.sql.*;
import java.util.*;
import model.ProductVariant;

/**
 *
 * @author tnteheh
 */
public class ProductVariantDAO extends DBContext{
    
    //Lấy toàn bộ dữ liệu cho bảng
    public List<ProductVariant> getAllVariants() {
        List<ProductVariant> list = new ArrayList<>();
        String sql = "SELECT * FROM ProductVariants"; // bảng trong DB
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductVariant pv = new ProductVariant(
                    rs.getInt("VariantID"),
                    rs.getInt("ProductID"),
                    rs.getString("Capacity"),
                    rs.getDouble("Price"),
                    rs.getInt("Stock"),
                    rs.getString("CreatedAt")
                );
                list.add(pv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    //Gọi ProductVariant với ID  
    public ProductVariant getVariantById(int id) {
        String sql = "SELECT * FROM ProductVariants WHERE VariantID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new ProductVariant(
                    rs.getInt("VariantID"),
                    rs.getInt("ProductID"),
                    rs.getString("Capacity"),
                    rs.getDouble("Price"),
                    rs.getInt("Stock"),
                    rs.getString("CreatedAt")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    //Thêm variant
    public void insertVariant(ProductVariant variant) {
        String sql = "INSERT INTO ProductVariants (ProductID, Capacity, Price, Stock) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, variant.getProductId());
            st.setString(2, variant.getCapacity());
            st.setDouble(3, variant.getPrice());
            st.setInt(4, variant.getStock());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //Sửa Variant
    public void updateVariant(ProductVariant v) {
        String sql = "UPDATE ProductVariants SET ProductID=?, Capacity=?, Price=?, Stock=? WHERE VariantID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, v.getProductId());
            st.setString(2, v.getCapacity());
            st.setDouble(3, v.getPrice());
            st.setInt(4, v.getStock());
            st.setInt(5, v.getVariantId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //Xoá Variant
    public void deleteVariantById(int id) {
        String sql = "DELETE FROM ProductVariants WHERE VariantID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
