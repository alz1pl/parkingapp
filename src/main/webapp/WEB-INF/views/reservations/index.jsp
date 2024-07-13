<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h1>Reservations</h1>

<a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/reservations/search_places">Create New Reservation</a>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>User</th>
        <th>Parking Place</th>
        <th>Start Time</th>
        <th>End Time</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${reservations}" var="reservation">
        <tr>
            <td>${reservation.id}</td>
            <td>${reservation.user.firstName} ${reservation.user.lastName}</td>
            <td>${reservation.parkingPlace.number}</td>
            <td>
                <fmt:parseDate value="${reservation.startTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedStartTime" />
                <fmt:formatDate value="${parsedStartTime}" pattern="dd.MM.yyyy HH:mm" />
            </td>
            <td>
                <fmt:parseDate value="${reservation.endTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedEndTime" />
                <fmt:formatDate value="${parsedEndTime}" pattern="dd.MM.yyyy HH:mm" />
            </td>
            <td>
                <a class="waves-effect waves-light btn red" href="${pageContext.request.contextPath}/reservations/delete/${reservation.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
