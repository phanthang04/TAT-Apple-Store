/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import model.Cart;
import dal.DBContext;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Product;
/**
 *
 * @author phant
 */
public class CartDAO extends DBContext{
    public List<Cart> getAllCart(int userID){
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT * FROM Carts WHERE userID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Cart cart = new Cart();
                cart.setCartId(rs.getInt("cartID"));
                cart.setUserID(rs.getInt("userID"));
                cart.setProductName(rs.getString("productName"));
                cart.setPrice(rs.getInt("price"));
                cart.setVariant(rs.getString("variant"));
                cart.setCount(rs.getInt("count"));
                list.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean insertCart(Cart c) {
        
        String sql = "INSERT INTO Carts (userID, productName, variant, price, count) "
                   + "VALUES (?, ?, ?, ?, 0)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            String checkSql = "SELECT count FROM Carts WHERE userID = ? AND productName = ? AND price = ? AND variant = ?";
            PreparedStatement checkStmt = connection.prepareStatement(checkSql);
            checkStmt.setInt(1, c.getUserID());
            checkStmt.setString(2, c.getProductName());
            checkStmt.setDouble(3, c.getPrice());
            checkStmt.setString(4, c.getVariant());
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()){
                int currentCount = rs.getInt("count");
                String updateSql = "UPDATE Carts SET count = ? WHERE userID = ? AND productName = ? AND price = ? AND variant = ?";
                PreparedStatement updateStmt = connection.prepareStatement(updateSql);
                updateStmt.setInt(1, currentCount + 1);
                updateStmt.setInt(2, c.getUserID());
                updateStmt.setString(3, c.getProductName());
                updateStmt.setDouble(4, c.getPrice());
                updateStmt.setString(5, c.getVariant());
                int rowsAffected = updateStmt.executeUpdate();
                return rowsAffected > 0;
            }else {
                // Nếu không tồn tại, thêm mới
                String insertSql = "INSERT INTO Carts (userID, productName, price, variant, count) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = connection.prepareStatement(insertSql);
                insertStmt.setInt(1, c.getUserID());
                insertStmt.setString(2, c.getProductName());
                insertStmt.setDouble(3, c.getPrice());
                insertStmt.setString(4, c.getVariant());
                insertStmt.setInt(5, 1); // count mặc định là 1 khi thêm mới
                int rowsAffected = insertStmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean deleteProduct(int cartID) {
        String sql = "DELETE FROM Carts WHERE CartID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, cartID);
            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}