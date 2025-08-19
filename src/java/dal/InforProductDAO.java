/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author tnteheh
 */
import model.Product;
import model.ProductVariant;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InforProductDAO extends DBContext{
    // Lấy Product và danh sách variants
    public Product getProductWithVariants(int productID) {
        Product product = null;
        List<ProductVariant> variants = new ArrayList<>();

        String sql = "SELECT p.ProductID, p.BrandID, p.CategoryID, p.ProductName, p.Description, " +
                     "p.BasePrice, p.ImageURL, p.ImageColorURL, " +
                     "pv.VariantID, pv.Capacity, pv.Price, pv.Stock " +
                     "FROM Products p " +
                     "LEFT JOIN ProductVariants pv ON p.ProductID = pv.ProductID " +
                     "WHERE p.ProductID = ? " +
                     "ORDER BY CASE pv.Capacity " +
                     "WHEN '256GB' THEN 1 WHEN '512GB' THEN 2 WHEN '1TB' THEN 3 ELSE 4 END";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                if (product == null) {
                    product = new Product(
                        rs.getInt("ProductID"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("BasePrice"),
                        rs.getString("ImageURL"),
                        rs.getString("ImageColorURL"),
                        null
                    );
                }

                int variantID = rs.getInt("VariantID");
                if (variantID > 0) {
                    ProductVariant variant = new ProductVariant(
                        variantID,
                        productID,
                        rs.getString("Capacity"),
                        rs.getDouble("Price"),
                        rs.getInt("Stock"),
                        null
                    );
                    variants.add(variant);
                }
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Lưu danh sách variants vào product
        if (product != null) {
            product.setVariants(variants);
        }

        return product;
    }
    
    // Lấy thông tin sản phẩm theo productID (chỉ thông tin cơ bản, không có variants)
    public Product getProduct(int productID) {
        Product product = null;
        try {
            String sql = "SELECT * FROM Products WHERE ProductID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                product = new Product(
                    rs.getInt("ProductID"),
                    rs.getInt("BrandID"),
                    rs.getInt("CategoryID"),
                    rs.getString("ProductName"),
                    rs.getString("Description"),
                    rs.getDouble("BasePrice"),
                    rs.getString("ImageURL"),
                    rs.getString("ImageColorURL"),
                    rs.getString("CreatedAt")
                );
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return product;
    }
}
