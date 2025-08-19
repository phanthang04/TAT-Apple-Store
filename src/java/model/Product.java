package model;

import java.util.List;

public class Product {
    private int productID;
    private int brandID;
    private int categoryID;
    private String productName;
    private String description;
    private double basePrice;
    private String imageURL;
    private String imageColorURL;
    private String createdAt;

    public Product() {
    }

    public Product(int productID, int brandID, int categoryID, String productName, String description,
                   double basePrice, String imageURL, String imageColorURL, String createdAt) {
        this.productID = productID;
        this.brandID = brandID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.description = description;
        this.basePrice = basePrice;
        this.imageURL = imageURL;
        this.imageColorURL = imageColorURL;
        this.createdAt = createdAt;
    }

    // Getters
    public int getProductID() { return productID; }
    public int getBrandID() { return brandID; }
    public int getCategoryID() { return categoryID; }
    public String getProductName() { return productName; }
    public String getDescription() { return description; }
    public double getBasePrice() { return basePrice; }
    public String getImageURL() { return imageURL; }
    public String getImageColorURL() { return imageColorURL; }
    public String getCreatedAt() { return createdAt; }
    
        // Add vào class Product
    private List<ProductVariant> variants;

    public List<ProductVariant> getVariants() {
        return variants;
    }

    public void setVariants(List<ProductVariant> variants) {
        this.variants = variants;
    }
}