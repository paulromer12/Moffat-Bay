package com.moffatbay.models;

import java.math.BigDecimal;

public class Reservation {
    private int reservationId;
    private String guestName;
    private String roomType;
    private String checkIn;
    private String checkOut;
    private int numGuests;
    private BigDecimal totalPrice;

    public Reservation(int reservationId, String guestName, String roomType,
                       String checkIn, String checkOut, int numGuests, BigDecimal totalPrice) {
        this.reservationId = reservationId;
        this.guestName = guestName;
        this.roomType = roomType;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.numGuests = numGuests;
        this.totalPrice = totalPrice;
    }

    // getters
    public int getReservationId() { return reservationId; }
    public String getGuestName() { return guestName; }
    public String getRoomType() { return roomType; }
    public String getCheckIn() { return checkIn; }
    public String getCheckOut() { return checkOut; }
    public int getNumGuests() { return numGuests; }
    public BigDecimal getTotalPrice() { return totalPrice; }
}