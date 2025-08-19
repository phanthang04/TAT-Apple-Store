/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tnteheh
 */
public class ProductVariant {
    private int variantId;
    private int productId;
    private String capacity;
    private double price;
    private int stock;
    private String createdAt;

    public ProductVariant() {
    }
    
    public ProductVariant(int variantId, int productId, String capacity, double price, int stock, String createdAt) {
        this.variantId = variantId;
        this.productId = productId;
        this.capacity = capacity;
        this.price = price;
        this.stock = stock;
        this.createdAt = createdAt;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
    
    
}
