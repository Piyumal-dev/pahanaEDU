package com.pahanaedu.model;

public class Item {
    private int itemId;
    private String itemCode;
    private String name;
    private double price;

    public Item() {}

    public Item(int itemId, String itemCode, String name, double price) {
        this.itemId = itemId;
        this.itemCode = itemCode;
        this.name = name;
        this.price = price;
    }

    // Getters and setters
    public int getItemId() { return itemId; }
    public void setItemId(int itemId) { this.itemId = itemId; }

    public String getItemCode() { return itemCode; }
    public void setItemCode(String itemCode) { this.itemCode = itemCode; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
