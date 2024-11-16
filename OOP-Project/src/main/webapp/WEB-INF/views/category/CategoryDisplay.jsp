<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="title" value="Category display"/>
</jsp:include>

<%@page import="java.util.ArrayList"%>
<%@page import="model.category.Category"%>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f4ff; /* Light background for the page */
        margin: 0;
        padding: 20px;
    }
    
    .category-container {
        max-width: 800px; /* Limit the width of the container */
        margin: 0 auto; /* Center the container */
    }

    .category-card {
        background-color: #93b6f8; /* Light professional blue */
        color: white;
        padding: 20px; /* Increased padding for better spacing */
        margin: 10px 0;
        border-radius: 8px; /* Rounded corners */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        transition: transform 0.2s; /* Smooth transition for hover effect */
    }

    .category-card:hover {
        transform: scale(1.02); /* Slightly enlarge on hover */
    }

    .category-title {
        font-size: 20px; /* Larger font size for titles */
        font-weight: bold;
        color: #3d43fb; /* Dark blue for titles */
        margin-bottom: 5px; /* Space below title */
    }

    .category-desc {
        font-size: 16px; /* Increased font size for better readability */
        color: #ffffff; /* Keep description color white */
    }
</style>

<%
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
%>

<div class="category-container">
    <h1 class="text-3xl font-bold mb-4" style="text-align: center; color: #3d43fb;">Category Display</h1> <!-- Page Title -->

    <%
        for(Category category : categories) {
    %>
        <div class="category-card">
            <div class="category-title">Name: <%= category.getName() %></div>
            <div class="category-desc">Description: <%= category.getDiscription() %></div>
        </div>
    <%
        }
    %>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
