<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="title" value="Add Event"/>
</jsp:include>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.category.Category"%>

<%
	ArrayList<Category> categories = (ArrayList<Category>)request.getAttribute("categories");
%>

<h1 class="flex justify-center text-3xl font-bold mb-4">Add Event</h1>

<form class="max-w-lg mx-auto" action="/add-event" method="post" onsubmit="return validateForm()">
    <div class="form-group">
        <label for="name">Event Name</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="Event Name" required minlength="3">

        <label for="description">Event Description</label>
        <input type="text" class="form-control" id="description" name="description" placeholder="Event Description" required minlength="10">

        <label for="date">Event Date</label>
        <input type="date" class="form-control" id="date" name="date" required>

        <label for="time">Event Time</label>
        <input type="time" class="form-control" id="time" name="time" required>

        <label for="available_tickets">Available Tickets</label>
        <input type="number" class="form-control" id="available_tickets" name="available_tickets" placeholder="Available Tickets" min="1" required>

        <label for="status">Status</label>
        <select class="form-control" id="status" name="status" required>
            <option value="">Select Status</option>
            <option value="1">Active</option>
            <option value="0">Inactive</option>
        </select>

        <label for="online_event">Online Event</label>
        <select class="form-control" id="online_event" name="online_event" required>
            <option value="">Select Online Event Status</option>
            <option value="1">Yes</option>
            <option value="0">No</option>
        </select>
		
        <label for="category_id">Category</label>
        <select class="form-control" id="category_id" name="category_id" required>
        	<option value="">Select Category</option>
        	<c:forEach var="category" items="${categories}">
				<option value="${category.getId()}">${category.getName()}</option>
			</c:forEach>
        </select>

        <label for="venue">Venue</label>
        <input type="text" class="form-control" id="venue" name="venue" placeholder="Venue" required minlength="5">

        <button type="submit" class="btn btn-primary">Add Event</button>
    </div>
</form>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

<script>
    function validateForm() {
        const date = document.getElementById('date').value;
        const time = document.getElementById('time').value;
        const today = new Date().toISOString().split('T')[0];

        if (date < today) {
            alert("Event date cannot be in the past.");
            return false;
        }

        const availableTickets = document.getElementById('available_tickets').value;
        if (availableTickets < 1) {
            alert("Number of available tickets must be at least 1.");
            return false;
        }

        return true;
    }
</script>
