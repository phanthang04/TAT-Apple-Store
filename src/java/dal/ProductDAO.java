/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author tnteheh
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ProductDAO extends DBContext {
    
    public List<Product> getAllProducts() throws SQLException {
        String sql = "SELECT * FROM Products ORDER BY ProductID DESC";
        List<Product> list = new ArrayList<>();
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product(
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
                list.add(p);
            }
        }
        return list;
    }
    
    
    
    //Lấy toàn sản phẩm theo Category VD: iphone, ipad
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT ProductID, BrandID, CategoryID, ProductName, Description, BasePrice, ImageURL, ImageColorURL, CreatedAt FROM Products WHERE CategoryID = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Product product = new Product(
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
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    
    //Lấy 5 sản phẩm mới nhất
    public List<Product> getFeaturedProducts(int limit) {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT TOP 5 ProductID, BrandID, CategoryID, ProductName, Description, BasePrice, ImageURL, ImageColorURL, CreatedAt "
                       + "FROM Products ORDER BY CreatedAt DESC";

            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = new Product(
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
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    //Lấy Banner theo từng category
    public String getBannerByCategoryID(int categoryID) {
        String bannerURL = null;
        String sql = "SELECT BannerURL FROM Banners WHERE CategoryID = ?";
        
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, categoryID);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                bannerURL = rs.getString("BannerURL");
            }
            
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return bannerURL;
    }
    //Tìm kiếm theo tên sản phẩm
    public List<Product> searchProductsByName(String keyword) {
        List<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT ProductID, BrandID, CategoryID, ProductName, Description, BasePrice, ImageURL, ImageColorURL, CreatedAt "
                       + "FROM Products WHERE ProductName LIKE ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = new Product(
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
                products.add(product);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    
    // Thêm hàm insert
    public boolean insertProduct(Product p) {
        String sql = "INSERT INTO Products (BrandID, CategoryID, ProductName, Description, BasePrice, ImageURL, ImageColorURL, CreatedAt) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE())";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, p.getBrandID());
            stmt.setInt(2, p.getCategoryID());
            stmt.setString(3, p.getProductName());
            stmt.setString(4, p.getDescription());
            stmt.setDouble(5, p.getBasePrice());
            stmt.setString(6, p.getImageURL());
            stmt.setString(7, p.getImageColorURL());
            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Thêm hàm update
    public boolean updateProduct(Product p) {
        String sql = "UPDATE Products SET BrandID = ?, CategoryID = ?, ProductName = ?, Description = ?, BasePrice = ?, ImageURL = ?, ImageColorURL = ? WHERE ProductID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, p.getBrandID());
            stmt.setInt(2, p.getCategoryID());
            stmt.setString(3, p.getProductName());
            stmt.setString(4, p.getDescription());
            stmt.setDouble(5, p.getBasePrice());
            stmt.setString(6, p.getImageURL());
            stmt.setString(7, p.getImageColorURL());
            stmt.setInt(8, p.getProductID());
            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

        public boolean deleteProduct(int productID) {
        String sql = "DELETE FROM Products WHERE ProductID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, productID);
            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Lấy sản phẩm theo ID để sửa
    public Product getProductById(int productID) {
            Product product = null;
            String sql = "SELECT * FROM Products WHERE ProductID = ?";
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
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
    
    
    //Lấy 5 sản phẩm mới của các Category cho Home
    public List<Product> getNewestProductsByCategory(int categoryId, int number) {
        List<Product> list = new ArrayList<>();
        try {
            // Tránh dùng TOP (?) → ghép chuỗi trực tiếp
            String sql = "SELECT TOP " + number + " * FROM Products WHERE CategoryID = ? ORDER BY CreatedAt DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
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
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}