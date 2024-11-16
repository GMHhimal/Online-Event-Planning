<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="title" value="Events"/>
</jsp:include>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.event.Event"%>

<%
    ArrayList<Event> events = (ArrayList<Event>)request.getAttribute("events");
%>

<style>
    body {
        background-color: #eaf4ff; /* Light blue background */
    }
    .card {
        border: none;
        border-radius: 8px;
        background-color: #ffffff; /* White card background */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .card-title {
        color: #3d43fb; /* Dark blue for titles */
    }
    .card-text {
        color: #333; /* Darker text for better readability */
    }
    .btn-danger {
        background-color: #3d43fb; /* Button color */
        border: none;
    }
    .btn-danger:hover {
        background-color: #2c34bb; /* Darker shade on hover */
    }
    .table {
        margin-top: 10px;
    }
</style>

<!-- JavaScript for Search Functionality -->
<script type="text/javascript">
function searchEvents() {
    let filter = document.getElementById('eventSearch').value.toUpperCase();
    let cards = document.querySelectorAll('.event-card');
    cards.forEach(card => {
        let title = card.querySelector('.card-title').innerText.toUpperCase();
        card.style.display = title.indexOf(filter) > -1 ? "" : "none";
    });
}
</script>

<div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="All" role="tabpanel" aria-labelledby="home-tab">
        <input type="text" id="eventSearch" placeholder="Search Events..." onkeyup="searchEvents()" style="margin-bottom: 15px; width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ddd;">
        
        <c:if test="${events.size() == 0}">
            <h4 class="text-center py-3 empty-events">
                <i class="far fa-folder-open"></i> No events
            </h4>
        </c:if>
        
        <div class="row">
            <c:forEach var="event" items="${events}">
                <div class="col-md-4">
                    <br>
                    <div class="card event-card">
                        <img class="card-img-top img-fluid"
                            src="http://colomboconferences.com/wp-content/uploads/2018/11/1-3-1080x450-768x320.jpg" alt="">
                        <div class="card-body">
                            <h4 class="card-title text-center">${event.getName()}</h4>
                            <hr>
                            <h5 class="card-title">${event.getDescription()}</h5>
                            
                            <table class="table">
                                <tr>
                                    <td><b><i class="far fa-calendar-alt"></i> Date:</b></td>
                                    <td>${event.getDate()}</td>
                                </tr>
                                <tr>
                                    <td><b><i class="fas fa-clock"></i> Time:</b></td>
                                    <td>${event.getTime()}</td>
                                </tr>
                                <tr>
                                    <td><b><i class="fa fa-user"></i> Manager:</b></td>
                                    <td>${event.getEventManagerId()}</td>
                                </tr>
                                <tr>
                                    <td><b><i class="fa fa-ticket-alt"></i> Tickets:</b></td>
                                    <td>${event.getAvailableTickets()}</td>
                                </tr>
                                <tr>
                                    <td><b><i class="fas fa-globe-americas"></i> Online Event:</b></td>
                                    <td>${event.getOnlineEvent() == 1 ? 'Yes' : 'No'}</td>
                                </tr>
                                <tr>
                                    <td><b><i class="fas fa-map-marker-alt"></i> Venue:</b></td>
                                    <td>${event.getVenue()}</td>
                                </tr>
                                <tr>
                                    <td><b><i class="fas fa-info-circle"></i> Status:</b></td>
                                    <td class="${event.getStatus() == 1 ? 'text-green-600' : 'text-red-600'}">
                                        ${event.getStatus() == 1 ? 'Active' : 'Inactive'}
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col text-center">
                            <a href="eventDetails?id=${event.getId()}" class="btn btn-danger">
                                <i class="fas fa-external-link-alt"></i> Open
                            </a>
                        </div>
                        <br>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
