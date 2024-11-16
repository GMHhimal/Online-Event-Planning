<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.feedback.Feedback"%>
<%@page import="model.ticket.Ticket"%>

<%
    ArrayList<Feedback> feedbacks = (ArrayList<Feedback>)request.getAttribute("feedbacks");
    ArrayList<Ticket> tickets = (ArrayList<Ticket>)request.getAttribute("tickets");
%>

<!-- Full Page Background -->
<div style="background-color: #93b6f8; padding: 20px; border-radius: 8px;">
    <h1 style="text-align: center; font-size: 2rem; font-weight: bold; margin-bottom: 1rem;">Feedbacks</h1>

    <div style="overflow-x: auto; margin-bottom: 2rem;">
        <table style="width: 100%; border-collapse: collapse; margin-bottom: 1rem;">
            <thead>
                <tr style="background-color: #3d43fb; color: white;">
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">ID</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Event ID</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">User ID</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Description</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Rating</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Created At</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="feedback" items="${feedbacks}">
                    <tr>
                        <th scope="row" style="border: 1px solid #ddd; padding: 12px;">${feedback.getId()}</th>
                        <td style="border: 1px solid #ddd; padding: 12px;">${feedback.getEvent_id()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${feedback.getUser_id()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${feedback.getDescription()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${feedback.getRating()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${feedback.getCreated_at()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">
                            <a href="/update-feedback?fid=${feedback.getId()}" style="background-color: #28a745; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none;">Update</a>
                            <a href="/delete-feedback?fid=${feedback.getId()}&eid=${feedback.getEvent_id()}" style="background-color: #dc3545; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none; margin-left: 5px;">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <h1 style="text-align: center; font-size: 2rem; font-weight: bold; margin-bottom: 1rem;">Tickets</h1>

    <div style="overflow-x: auto;">
        <table style="width: 100%; border-collapse: collapse;">
            <thead>
                <tr style="background-color: #3d43fb; color: white;">
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">ID</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Event ID</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">User ID</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Expiry Date</th>
                    <th scope="col" style="padding: 12px; border: 1px solid #ddd;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ticket" items="${tickets}">
                    <tr>
                        <th scope="row" style="border: 1px solid #ddd; padding: 12px;">${ticket.getId()}</th>
                        <td style="border: 1px solid #ddd; padding: 12px;">${ticket.getEvent_id()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${ticket.getUser_id()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">${ticket.getExpiry_date()}</td>
                        <td style="border: 1px solid #ddd; padding: 12px;">
                            <a href="/update-ticket?tid=${ticket.getId()}" style="background-color: #28a745; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none;">Update</a>
                            <a href="/delete-ticket?tid=${ticket.getId()}" style="background-color: #dc3545; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none; margin-left: 5px;">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
