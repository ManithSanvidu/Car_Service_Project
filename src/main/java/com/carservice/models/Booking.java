package com.carservice.models;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Booking {
    public String name;
    public String number;
    public String vehicle;
    public String make;
    public String date;
    public String service;

    public Booking(String name, String number, String vehicle, String make, String date, String service) {
        this.name = name;
        this.number = number;
        this.vehicle = vehicle;
        this.make = make;
        this.date = date;
        this.service = service;
    }

    public Date getDateAsObject() {
        try {
            return new SimpleDateFormat("yyyy-MM-dd").parse(date);
        } catch (Exception e) {
            return new Date(0);
        }
    }

    @Override
    public String toString() {
        return name + "," + number + "," + vehicle + "," + make + "," + date + "," + service;
    }
}
