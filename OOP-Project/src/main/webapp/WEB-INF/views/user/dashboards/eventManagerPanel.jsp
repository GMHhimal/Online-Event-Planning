<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.event.Event"%>

<%
    ArrayList<Event> events = (ArrayList<Event>)request.getAttribute("events");
%>

<!-- Full Page Background -->
<div style="background-color: #93b6f8; padding: 20px; border-radius: 8px;">

    <a href="/add-event" class="btn" style="background-color: #3d43fb; color: white; padding: 10px 15px; border-radius: 5px; text-decoration: none; margin-bottom: 20px;">Add Event</a>

    <div class="table-responsive">
        <table style="width: 100%; border-collapse: collapse;" class="table table-striped">
            <thead>
                <tr style="background-color: #3d43fb; color: white;">
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">ID</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Name</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Description</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Date</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Time</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Available Tickets</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Event Manager ID</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Status</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Online Event</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Category ID</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Venue</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="event" items="${events}">
                    <tr>
                        <th scope="row" style="border: 1px solid #ddd; padding: 12px;">${event.getId()}</th>
                        <td style="border: 1px solid #ddd; padding: 12px;">${event.getName()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${event.getDescription()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${event.getDate()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${event.getTime()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${event.getAvailableTickets()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${event.getEventManagerId()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${event.getStatus()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${event.getOnlineEvent()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${event.getCategoryId()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${event.getVenue()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px; text-align: center;">
                            <a href="/update-event?eid=${event.getId()}" class="btn btn-update">Update</a>
                            <a href="/delete-event?eid=${event.getId()}" class="btn btn-delete">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<style>
    .btn {
        display: inline-block;
        padding: 10px 20px;
        margin: 5px 10px;
        border-radius: 5px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        color: white;
        transition: background-color 0.3s ease;
    }

    .btn-update {
        background-color: #28a745;
    }

    .btn-update:hover {
        background-color: #218838;
    }

    .btn-delete {
        background-color: #dc3545;
    }

    .btn-delete:hover {
        background-color: #c82333;
    }

    /* Table and cell styling */
    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 12px;
        text-align: left;
        border: 1px solid #ddd;
    }

    th {
        background-color: #3d43fb;
        color: white;
    }

    tbody tr:hover {
        background-color: #f1f1f1;
    }

    /* Aligning buttons in table cell */
    td a {
        display: inline-block;
        margin: 5px;
        padding: 10px 20px;
    }

    /* Center-align actions in table rows */
    td {
        vertical-align: middle;
    }

</style>
