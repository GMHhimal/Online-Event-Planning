<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="title" value="Announcements"/>
</jsp:include>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Table for announcements with inline CSS for a professional blue color scheme -->
<table style="width: 100%; border-collapse: collapse; font-family: Arial, sans-serif;">
    <thead>
        <tr style="background-color: #3d43fb; color: white;">
            <th style="padding: 12px; border: 1px solid #ddd;">Title</th>
            <th style="padding: 12px; border: 1px solid #ddd;">Description</th>
            <th style="padding: 12px; border: 1px solid #ddd;">Created At</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="announcement" items="${announcements}">
            <tr style="background-color: #f2f2f2;">
                <td style="padding: 12px; border: 1px solid #ddd; color: #3d43fb;">
                    <strong>${announcement.title}</strong>
                </td>
                <td style="padding: 12px; border: 1px solid #ddd; color: #333;">
                    ${announcement.description}
                </td>
                <td style="padding: 12px; border: 1px solid #ddd; color: #333;">
                    ${announcement.created_at}
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
