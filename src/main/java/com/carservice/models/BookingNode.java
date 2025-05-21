package com.carservice.models;

public class BookingNode {
    public Booking booking;
    public BookingNode next;

    public BookingNode(Booking booking) {
        this.booking = booking;
        this.next = null;
    }
}
