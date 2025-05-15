<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Contact</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Google Web Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@600;700&family=Ubuntu:wght@400;500&display=swap" rel="stylesheet">

  <!-- Icon Font Stylesheet -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

  <!-- Libraries Stylesheet -->
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

  <!-- Customized Bootstrap Stylesheet -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Template Stylesheet -->
  <link href="css/welcome.css" rel="stylesheet">
</head>

<body>

<!-- Topbar Start -->
<div class="container-fluid bg-light p-0">
  <div class="row gx-0 d-none d-lg-flex">
    <div class="col-lg-7 px-5 text-start">
      <div class="h-100 d-inline-flex align-items-center py-3 me-4">
        <small class="fa fa-map-marker-alt text-primary me-2"></small>
        <small>Union Place,Colombo,Sri Lanka</small>
      </div>
      <div class="h-100 d-inline-flex align-items-center py-3">
        <small class="far fa-clock text-primary me-2"></small>
        <small>Mon - Sat : 09.00 AM - 07.00 PM</small>
      </div>
    </div>
    <div class="col-lg-5 px-5 text-end">
      <div class="h-100 d-inline-flex align-items-center py-3 me-4">
        <small class="fa fa-phone-alt text-primary me-2"></small>
        <small>0112 345 6789</small>
      </div>
      <div class="h-100 d-inline-flex align-items-center">
        <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-facebook-f"></i></a>
        <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-twitter"></i></a>
        <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-linkedin-in"></i></a>
        <a class="btn btn-sm-square bg-white text-primary me-0" href=""><i class="fab fa-instagram"></i></a>
      </div>
    </div>
  </div>
</div>
<!-- Topbar End -->

<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-light sticky-top p-0" style="background-color: oklch(0.511 0.262 276.966);">
  <a href="welcome.jsp" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
    <h2 class="m-0 text-white" style="font-family: 'Papyrus', serif;"><i class="fa fa-car me-3"></i>AutoCare Tracker</h2>
  </a>
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <div class="navbar-nav ms-auto p-4 p-lg-0">
      <a href="welcome.jsp" class="nav-item nav-link">Home</a>
      <a href="newBooking.jsp" class="nav-item nav-link">New Booking</a>
      <a href="serviceHistory.jsp" class="nav-item nav-link">Service History</a>
      <a href="User.jsp" class="nav-item nav-link">User</a>
      <a href="FeedbackServlet" class="nav-item nav-link active">Contact</a>
    </div>
  </div>
</nav>
<!-- Navbar End -->

<!-- Page Header Start -->
<div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-bg-1.jpg);">
  <div class="container-fluid page-header-inner py-5">
    <div class="container text-center">
      <h1 class="display-3 text-white mb-3 animated slideInDown">Contact</h1>
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb justify-content-center text-uppercase">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item text-white active" aria-current="page">Contact</li>
        </ol>
      </nav>
    </div>
  </div>
</div>
<!-- Page Header End -->

<!-- Contact Start -->
<div class="container-xxl py-5">
  <div class="container">
    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
      <h6 class="text-primary text-uppercase">Contact Us </h6>
      <h1 class="mb-5">Contact For Any Query</h1>
    </div>
    <div class="row g-4">
      <div class="col-12">
        <div class="row gy-4">
          <div class="col-md-4">
            <div class="bg-light d-flex flex-column justify-content-center p-4">
              <h5 class="text-uppercase"> Booking </h5>
              <p class="m-0"><i class="fa fa-envelope-open text-primary me-2"></i>book@example.com</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="bg-light d-flex flex-column justify-content-center p-4">
              <h5 class="text-uppercase"> General </h5>
              <p class="m-0"><i class="fa fa-envelope-open text-primary me-2"></i>info@example.com</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="bg-light d-flex flex-column justify-content-center p-4">
              <h5 class="text-uppercase">Technical </h5>
              <p class="m-0"><i class="fa fa-envelope-open text-primary me-2"></i>tech@example.com</p>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-6 wow fadeIn" data-wow-delay="0.1s">
        <iframe class="position-relative rounded w-100 h-100"
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15842.94909736428!2d79.85094092102241!3d6.921978181772312!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae259158f32b4a3%3A0x9502607ad9719a99!2sUnion%20Place%2C%20Colombo!5e0!3m2!1sen!2slk!4v1746756262541!5m2!1sen!2slk" width="600" height="450"
                style="min-height: 350px; border:0;"
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"
                frameborder="0"
                aria-hidden="true"
                tabindex="0">
        </iframe>
      </div>
      <div class="col-md-6">
        <div class="wow fadeInUp" data-wow-delay="0.2s">
          <p class="mb-4">Get in touch with the AutoCare Tracker team for bookings, general inquiries, or technical support. Use the contact form or reach out via email. Our location map helps you find us easily—your car care questions are always welcome!</p>
          <form method="post" action="FeedbackServlet">
            <div class="row g-3">
              <div class="col-md-6">
                <div class="form-floating">
                  <input type="text" class="form-control" id="name" name="name" placeholder="Your Name">
                  <label for="name">Your Name</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-floating">
                  <input type="email" class="form-control" id="email" name="email" placeholder="Your Email">
                  <label for="email">Your Email</label>
                </div>
              </div>
              <div class="col-12">
                <div class="form-floating">
                  <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject">
                  <label for="subject">Subject</label>
                </div>
              </div>
              <div class="col-12">
                <div class="form-floating">
                  <textarea class="form-control" placeholder="Leave a message here" id="message" name="message" style="height: 100px"></textarea>
                  <label for="message">Message</label>
                </div>
              </div>
              <div class="col-12">
                <button class="btn w-100 py-3" style="color: white; background-color: #D81324;" type="submit">Send Message</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Contact End -->

<!-- Display Recent Feedback List -->
<div class="row mt-5">
  <div class="col-12">
    <h3 class="mb-4 text-center">Recent Feedbacks</h3>
    <%
      List<Map<String, String>> recentFeedbacks = (List<Map<String, String>>) request.getAttribute("recentFeedbacks");
      if (recentFeedbacks != null && !recentFeedbacks.isEmpty()) {
        for (Map<String, String> feedback : recentFeedbacks) {
          String name = feedback.get("Name");
          String subject = feedback.get("Subject");
          String message = feedback.get("Message");
          String date = feedback.get("Date");
    %>
    <div class="border rounded p-3 mb-3">
      <h5><%= subject != null ? subject : "No Subject" %></h5>
      <p><%= message != null ? message : "" %></p>
      <small class="text-muted">By <%= name != null ? name : "Anonymous" %> on <%= date != null ? date : "" %></small>
    </div>
    <%
      }
    } else {
    %>
    <p>No feedback available.</p>
    <%
      }
    %>
  </div>
</div>
<!-- Display Recent Feedbacks End -->

<!-- Footer Start -->
<div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
  <div class="container py-5">
    <div class="row g-5">
      <div class="col-lg-3 col-md-6">
        <h4 class="text-light mb-4">Address</h4>
        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Union Place,Colombo,Sri Lanka</p>
        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+94 765676890</p>
        <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@autocare.com</p>
        <div class="d-flex pt-2">
          <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
          <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
          <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
          <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
        </div>
      </div>
      <div class="col-lg-3 col-md-6">
        <h4 class="text-light mb-4">Opening Hours</h4>
        <h6 class="text-light">Monday - Friday:</h6>
        <p class="mb-4">09.00 AM - 09.00 PM</p>
        <h6 class="text-light">Saturday - Sunday:</h6>
        <p class="mb-0">09.00 AM - 12.00 PM</p>
      </div>
      <div class="col-lg-3 col-md-6">
        <h4 class="text-light mb-4">Services</h4>
        <p class="text-light mb-2">Diagnostic Test</p>
        <p class="text-light mb-2">Engine Servicing</p>
        <p class="text-light mb-2">Tires Replacement</p>
        <p class="text-light mb-2">Oil Changing</p>
        <p class="text-light mb-2">Vacuum Cleaning</p>
      </div>
      <div class="col-lg-3 col-md-6">
        <h4 class="text-light mb-4">Branches</h4>
        <p class="text-light mb-2">Colombo</p>
        <p class="text-light mb-2">Galle</p>
        <p class="text-light mb-2">Matara</p>
        <p class="text-light mb-2">Rathmalana</p>
        <p class="text-light mb-2">Udahamulla</p>
      </div>
    </div>
  </div>
</div>
<!-- Footer End -->

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/counterup/counterup.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>
