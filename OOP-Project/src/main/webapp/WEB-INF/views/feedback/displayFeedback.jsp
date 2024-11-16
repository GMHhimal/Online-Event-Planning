<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="title" value="Display Feedback"/>
</jsp:include>

<%@page import="java.util.ArrayList"%>
<%@page import="model.feedback.Feedback"%>

<%
    ArrayList<Feedback> feedbacks = (ArrayList<Feedback>) request.getAttribute("feedbacks");

    // Debugging: Check if feedbacks is null or empty
    if (feedbacks == null || feedbacks.isEmpty()) {
        out.print("No feedback available.");
    } else {
        for (Feedback feedback : feedbacks) {
            out.print("Id: " + feedback.getId() + "<br/>");
            out.print("Event_id: " + (feedback.getEvent_id() != null ? feedback.getEvent_id() : "N/A") + "<br/>");
            out.print("User_id: " + (feedback.getUser_id() != null ? feedback.getUser_id() : "N/A") + "<br/>");
            out.print("Description: " + (feedback.getDescription() != null ? feedback.getDescription() : "N/A") + "<br/>");
            out.print("Rating: " + feedback.getRating() + "<br/>");
            out.print("Created_at: " + (feedback.getCreated_at() != null ? feedback.getCreated_at() : "N/A") + "<br/><br/>");
        }
    }
%>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
