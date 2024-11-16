<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="title" value="Event Detail"/>
</jsp:include>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.event.Event"%>
<%@page import="model.feedback.Feedback"%>
<%@page import="model.user.User"%>

<%
    Event event = (Event) request.getAttribute("event");
    ArrayList<Feedback> feedbacks = (ArrayList<Feedback>) request.getAttribute("feedbacks");
    User event_manager = (User) request.getAttribute("event_manager");
%>

<div class="bg-white shadow-lg rounded-lg overflow-hidden">
    <div class="px-6 py-4">
        <div class="font-bold text-xl mb-2">
            <a href="#">${event.getName()}</a>
        </div>
        <div class="text-gray-700 text-base">
            ${event.getDescription()}
        </div>
        <div class="text-gray-700 text-base">
            Date: ${event.getDate()}
        </div>
        <div class="text-gray-700 text-base">
            Time: ${event.getTime()}
        </div>
    </div>
    <div class="px-6 py-4">
        <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2">${event_manager.getFname()}</span>
        <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2">Tickets: ${event.getAvailableTickets()}</span>
        <c:choose>
            <c:when test="${event.getOnlineEvent() == 1}">
                <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-green-600 mr-2">Online</span>
            </c:when>
            <c:otherwise>
                <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-green-600 mr-2">Venue: ${event.getVenue()}</span>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${event.getStatus() == 1}">
                <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-green-600 mr-2">Active</span>
                <br/><br/>
                <a href="add-ticket?eid=${event.getId()}" class="btn btn-success">
                    <i class="fa fa-ticket-alt"></i> Attend
                </a>
                <a href="/add-feedback?eid=${event.getId()}" class="btn btn-primary">
                    <i class="fas fa-comments"></i> Give Feedback
                </a>
            </c:when>
            <c:otherwise>
                <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-red-600 mr-2">Inactive</span>
                <br/><br/>
                <a href="#" class="btn btn-success disabled">
                    <i class="fa fa-ticket-alt"></i> Attend
                </a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<br/><br/>

<h1 class="text-3xl font-bold mb-4">Feedbacks</h1>
<div style="background-color: #e0f7fa; padding: 20px; border-radius: 8px;">
    <c:if test="${empty feedbacks}">
        <p style="color: #ff0000; font-weight: bold;">No feedback available.</p>
    </c:if>
    <c:forEach var="feedback" items="${feedbacks}">
        <div style="border: 1px solid #009688; padding: 15px; border-radius: 5px; margin-bottom: 10px;">
            <p style="margin: 5px 0;"><strong>Id:</strong> ${feedback.id}</p>
            <p style="margin: 5px 0;"><strong>Event_id:</strong> ${feedback.event_id != null ? feedback.event_id : 'N/A'}</p>
            <p style="margin: 5px 0;"><strong>User_id:</strong> ${feedback.user_id != null ? feedback.user_id : 'N/A'}</p>
            <p style="margin: 5px 0;"><strong>Description:</strong> ${feedback.description != null ? feedback.description : 'N/A'}</p>
            <p style="margin: 5px 0;"><strong>Rating:</strong> 
                <span class="rating">
                    <c:forEach var="star" begin="1" end="5">
                        <span class="star" style="color: ${feedback.rating >= star ? '#FFD700' : '#ccc'};">&#9733;</span>
                    </c:forEach>
                </span>
            </p>
            <p style="margin: 5px 0;"><strong>Created_at:</strong> ${feedback.created_at != null ? feedback.created_at : 'N/A'}</p>
            
            <c:if test="${session.id == feedback.user_id}">
                <a class='btn btn-success btn-sm' style="background-color: #4caf50; color: white; text-decoration: none; padding: 5px 10px; border-radius: 3px;" 
                   href='/update-feedback?fid=${feedback.id}'>Update</a>
                <a class='btn btn-danger btn-sm' style="background-color: #f44336; color: white; text-decoration: none; padding: 5px 10px; border-radius: 3px; margin-left: 5px;" 
                   href='/delete-feedback?fid=${feedback.id}&eid=${event.id}'>Delete</a>
            </c:if>
        </div>
    </c:forEach>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
