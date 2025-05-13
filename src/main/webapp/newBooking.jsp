<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Car Service Booking</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/newBooking.css" />
</head>
<body>
<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-light sticky-top p-0" style="background-color: oklch(0.511 0.262 276.966);">
    <a href="welcome.jsp" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
        <h2 class="m-0 text-white" style="font-family: 'Papyrus', serif;"><i class="fa fa-car me-3"></i>AutoCare Tracker</h2>
    </a>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <a href="index.jsp" class="nav-item nav-link">Home</a>
            <a href="newBooking.jsp" class="nav-item nav-link active">New Booking</a>
            <a href="serviceHistory.jsp" class="nav-item nav-link">Service History</a>
            <a href="User.jsp" class="nav-item nav-link">User</a>
        </div>
    </div>
</nav>
<!-- Navbar End -->

<div class="container">
    <h1>Car Service Booking</h1>

    <form action="AddBookingServlet" method="post" class="booking-form">
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" placeholder="Customer Name" required />

        <label for="carNumber">Car Number:</label>
        <input type="text" id="carNumber" name="carNumber" placeholder="ABC-1234" required />

        <label for="vehicleType">Vehicle Type:</label>
        <select id="vehicleType" name="vehicleType" required>
            <option value="">Select Vehicle</option>
            <option value="Car">Car</option>
            <option value="Bike">Bike</option>
            <option value="SUV/Jeep">SUV/Jeep</option>
            <option value="Pickup/Double Cab">Double Cab</option>
            <option value="Crew Cab">Crew Cab</option>
            <option value="Heavy Duty">Heavy Duty</option>
        </select>

        <label for="manufacturer">Manufacturer:</label>
        <select id="manufacturer" name="manufacturer" required>
            <option value="">Any Make</option>
            <option value="Audi">Audi</option>
            <option value="BMW">BMW</option>
            <option value="Benz">Benz</option>
            <option value="Suzuki">Suzuki</option>
            <option value="Toyota">Toyota</option>
            <option value="Nissan">Nissan</option>
            <option value="Honda">Honda</option>
            <option value="Mazda">Mazda</option>
        </select>

        <label for="serviceDate">Service Date:</label>
        <input type="date" id="serviceDate" name="serviceDate" required />

        <label for="serviceType">Service Type:</label>
        <select id="serviceType" name="serviceType" required>
            <option value="">Select Service Type</option>
            <option value="Oil Change">Oil Change</option>
            <option value="Engine Check">Engine Check</option>
            <option value="Tire Replacement">Tire Replacement</option>
            <option value="Battery Renewal">Battery Renewal</option>
            <option value="Car Wash">Car Wash</option>
        </select>

        <button type="submit">Book Service</button>
    </form>

</div>
</body>
</html>
