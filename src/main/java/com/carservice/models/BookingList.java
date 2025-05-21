package com.carservice.models;

public class BookingList {
    private BookingNode head;

    public void add(Booking booking) {
        BookingNode newNode = new BookingNode(booking);
        if (head == null) {
            head = newNode;
        } else {
            BookingNode current = head;
            while (current.next != null) {
                current = current.next;
            }
            current.next = newNode;
        }
    }

    public void selectionSortByDate() {
        for (BookingNode i = head; i != null; i = i.next) {
            BookingNode min = i;
            for (BookingNode j = i.next; j != null; j = j.next) {
                if (j.booking.getDateAsObject().before(min.booking.getDateAsObject())) {
                    min = j;
                }
            }
            if (min != i) {
                Booking temp = i.booking;
                i.booking = min.booking;
                min.booking = temp;
            }
        }
    }

    public BookingNode getHead() {
        return head;
    }
}
