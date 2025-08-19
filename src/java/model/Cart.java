/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phant
 */
public class Cart {
    private int cartId;
    private int userID;
    private String productName;
    private String variant;
    private double price;
    private int count;

    public Cart(int cartId, int userID, String productName, String variant, double price) {
        this.cartId = cartId;
        this.userID = userID;
        this.productName = productName;
        this.variant = variant;
        this.price = price;
        this.count = 0;
    }

    public Cart() {
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setVariant(String variant) {
        this.variant = variant;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCartId() {
        return cartId;
    }

    public int getUserID() {
        return userID;
    }

    public String getProductName() {
        return productName;
    }

    public String getVariant() {
        return variant;
    }

    public double getPrice() {
        return price;
    }

    public int getCount() {
        return count;
    }
}
