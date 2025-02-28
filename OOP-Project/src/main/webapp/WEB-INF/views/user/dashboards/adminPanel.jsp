<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.announcement.Announcement"%>
<%@page import="model.category.Category"%>
<%@page import="model.message.Message"%>
<%@page import="model.user.User"%>

<%
    ArrayList<Announcement> announcements = (ArrayList<Announcement>)request.getAttribute("announcements");
    ArrayList<Category> categories = (ArrayList<Category>)request.getAttribute("categories");    
    ArrayList<Message> messages = (ArrayList<Message>)request.getAttribute("messages");    
    ArrayList<User> users = (ArrayList<User>)request.getAttribute("users");    
%>

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

    .btn-primary {
        background-color: #007bff; /* Button color */
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s;
    }

    .btn-primary:hover {
        background-color: #0056b3; /* Darker blue on hover */
    }

    .btn-success, .btn-danger {
        padding: 5px 10px;
        border-radius: 5px;
        color: white;
        text-decoration: none;
        transition: opacity 0.3s;
    }

    .btn-success {
        background-color: #28a745; /* Success button color */
    }

    .btn-danger {
        background-color: #dc3545; /* Danger button color */
    }

    .btn-success:hover, .btn-danger:hover {
        opacity: 0.8; /* Slight transparency on hover */
    }

    .table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .table th, .table td {
        padding: 12px;
        text-align: left;
        border: 1px solid #ddd;
    }

    .table th {
        background-color: #3d43fb; /* Header background color */
        color: white; /* Header text color */
    }

    .table-striped tbody tr:nth-child(even) {
        background-color: #f2f2f2; /* Stripe color */
    }

    .table-striped tbody tr:hover {
        background-color: #e9ecef; /* Row hover color */
    }

    .table-responsive {
        overflow-x: auto; /* Allow horizontal scrolling */
    }

    .flex {
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>

<!-- JavaScript for Search Functionality -->
<script type="text/javascript">
function searchUsers() {
    let filter = document.getElementById('userSearch').value.toUpperCase();
    let rows = document.querySelectorAll('.user-row');
    rows.forEach(row => {
        let name = row.querySelector('td:nth-child(2)').innerText.toUpperCase();
        row.style.display = name.indexOf(filter) > -1 ? "" : "none";
    });
}

function searchAnnouncements() {
    let filter = document.getElementById('announcementSearch').value.toUpperCase();
    let rows = document.querySelectorAll('.announcement-row');
    rows.forEach(row => {
        let title = row.querySelector('td:nth-child(2)').innerText.toUpperCase();
        row.style.display = title.indexOf(filter) > -1 ? "" : "none";
    });
}

function searchCategories() {
    let filter = document.getElementById('categorySearch').value.toUpperCase();
    let rows = document.querySelectorAll('.category-row');
    rows.forEach(row => {
        let name = row.querySelector('td:nth-child(2)').innerText.toUpperCase();
        row.style.display = name.indexOf(filter) > -1 ? "" : "none";
    });
}

function searchMessages() {
    let filter = document.getElementById('messageSearch').value.toUpperCase();
    let rows = document.querySelectorAll('.message-row');
    rows.forEach(row => {
        let name = row.querySelector('td:nth-child(2)').innerText.toUpperCase();
        row.style.display = name.indexOf(filter) > -1 ? "" : "none";
    });
}
</script>

<!-- Users Section -->
<a href="/add-user" class="btn btn-primary">Create User</a>
<input type="text" id="userSearch" placeholder="Search Users..." onkeyup="searchUsers()">
<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Fname</th>
                <th scope="col">Lname</th>
                <th scope="col">Email</th>
                <th scope="col">Mobile</th>
                <th scope="col">Address</th>
                <th scope="col">Join Date</th>
                <th scope="col">NIC</th>
                <th scope="col">Role</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr class="user-row">
                    <th scope="row">${user.getId()}</th>
                    <td>${user.getFname()}</td>
                    <td>${user.getLname()}</td>
                    <td>${user.getEmail()}</td>
                    <td>${user.getMobile()}</td>
                    <td>${user.getAddress()}</td>
                    <td>${user.getJoin_date()}</td>
                    <td>${user.getNIC()}</td>
                    <td>${user.getRole()}</td>
                    <td>
                        <a href="/update-user?id=${user.getId()}" class="btn btn-success btn-sm">Update</a>
                        <a href="/delete-user?id=${user.getId()}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Announcements Section -->
<a href="/create-announcement" class="btn btn-primary">Create Announcement</a>
<input type="text" id="announcementSearch" placeholder="Search Announcements..." onkeyup="searchAnnouncements()">
<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Title</th>
                <th scope="col">Description</th>
                <th scope="col">Created Date</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="announcement" items="${announcements}">
                <tr class="announcement-row">
                    <th scope="row">${announcement.getId()}</th>
                    <td>${announcement.getTitle()}</td>
                    <td>${announcement.getDescription()}</td>
                    <td>${announcement.getCreated_at()}</td>
                    <td>
                        <a href="/update-announcement?aid=${announcement.getId()}" class="btn btn-success btn-sm">Update</a>
                        <a href="/delete-announcement?aid=${announcement.getId()}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Categories Section -->
<a href="/AddCategory" class="btn btn-primary">Create Category</a>
<input type="text" id="categorySearch" placeholder="Search Categories..." onkeyup="searchCategories()">
<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Description</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="category" items="${categories}">
                <tr class="category-row">
                    <th scope="row">${category.getId()}</th>
                    <td>${category.getName()}</td>
                    <td>${category.getDiscription()}</td>
                    <td>
                        <a href="/update-category?cid=${category.getId()}" class="btn btn-success btn-sm">Update</a>
                        <a href="/delete-category?cid=${category.getId()}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Messages Section -->
<h1 class="flex text-3xl font-bold mb-4">Messages</h1>
<input type="text" id="messageSearch" placeholder="Search Messages..." onkeyup="searchMessages()">
<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Subject</th>
                <th scope="col">Message</th>
                <th scope="col">Created at</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="message" items="${messages}">
                <tr class="message-row">
                    <th scope="row">${message.getId()}</th>
                    <td>${message.getName()}</td>
                    <td>${message.getEmail()}</td>
                    <td>${message.getSubject()}</td>
                    <td>${message.getMessage()}</td>
                    <td>${message.getCreate_at()}</td>
                    <td>
                        <a href="/update-message?mid=${message.getId()}" class="btn btn-success btn-sm">Update</a>
                        <a href="/delete-message?mid=${message.getId()}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
