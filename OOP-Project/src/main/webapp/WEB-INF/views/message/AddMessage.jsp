<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="title" value="Contact Us"/>
</jsp:include>

<!-- Inline CSS for Styling -->
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f4ff; /* Light background */
        margin: 0;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: #3d43fb; /* Title color */
        margin-bottom: 20px;
    }

    .form-group {
        max-width: 500px; /* Limit form width */
        margin: 0 auto; /* Center the form */
        background-color: white; /* White background for form */
        border-radius: 8px; /* Rounded corners */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        padding: 20px; /* Padding inside the form */
    }

    .form-group label {
        display: block; /* Labels on new lines */
        margin-bottom: 5px; /* Space between label and input */
        color: #333; /* Label color */
        font-weight: bold; /* Bold labels */
    }

    .form-control {
        width: 100%; /* Full width for inputs */
        padding: 10px; /* Padding inside inputs */
        margin-bottom: 15px; /* Space between inputs */
        border: 1px solid #ccc; /* Border for inputs */
        border-radius: 4px; /* Rounded corners for inputs */
    }

    .form-control:focus {
        border-color: #3d43fb; /* Border color on focus */
        box-shadow: 0 0 5px rgba(61, 67, 251, 0.5); /* Shadow on focus */
    }

    .btn-primary {
        background-color: #007bff; /* Button color */
        color: white; /* Button text color */
        padding: 10px 20px; /* Button padding */
        border: none; /* No border */
        border-radius: 5px; /* Rounded corners for button */
        cursor: pointer; /* Pointer cursor on hover */
        font-size: 16px; /* Button text size */
        width: 100%; /* Full width button */
    }

    .btn-primary:hover {
        background-color: #0056b3; /* Darker blue on hover */
    }
</style>

<h1 class="text-3xl font-bold mb-4">Contact Us</h1>

<form class="flex justify-center" action="/contact-us" method="post">
    <div class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
        
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
        
        <label for="subject">Subject</label>
        <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required>
        
        <label for="message">Message</label>
        <textarea class="form-control" id="message" name="message" placeholder="Message" rows="5" required></textarea> <!-- Changed to textarea for better usability -->
        
        <button type="submit" class="btn btn-primary">Submit</button>  
    </div>
</form>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
