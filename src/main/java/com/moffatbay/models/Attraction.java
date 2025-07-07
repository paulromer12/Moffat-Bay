package com.moffatbay.models;

import java.math.BigDecimal;

public class Attraction {
    private int attractionId;
    private String name;
    private String description;
    private BigDecimal price;
    private String availabilityStatus;

    // No-arg constructor
    public Attraction() {
    }

    // Constructor with all fields
    public Attraction(int attractionId, String name, String description, BigDecimal price, String availabilityStatus) {
        this.attractionId = attractionId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.availabilityStatus = availabilityStatus;
    }

    // Getters and setters
    public int getAttractionId() {
        return attractionId;
    }

    public void setAttractionId(int attractionId) {
        this.attractionId = attractionId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getAvailabilityStatus() {
        return availabilityStatus;
    }

    public void setAvailabilityStatus(String availabilityStatus) {
        this.availabilityStatus = availabilityStatus;
    }

    @Override
    public String toString() {
        return "Attraction{" +
                "attractionId=" + attractionId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", availabilityStatus='" + availabilityStatus + '\'' +
                '}';
    }
}
