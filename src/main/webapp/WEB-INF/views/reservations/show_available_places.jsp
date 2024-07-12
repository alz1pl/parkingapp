<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h3>Available Parking Places</h3>
<p>Parking House: ${parkingHouse.location}</p>
<p>User: ${user.firstName} ${user.lastName}</p>
<fmt:parseDate value="${startTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedStartTime"/>
<p>Start time: <fmt:formatDate value="${parsedStartTime}" pattern="dd.MM.yyyy HH:mm"/></p>
<fmt:parseDate value="${endTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedEndTime"/>
<p>End time: <fmt:formatDate value="${parsedEndTime}" pattern="dd.MM.yyyy HH:mm"/></p>
<p>Available places: ${fn:length(availableParkingPlaces)}</p>

<c:if test="${not empty availableParkingPlaces}">
    <table>
        <thead>
        <tr>
            <th>Place Number</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${availableParkingPlaces}" var="parkingPlace">
            <tr>
                <td>${parkingPlace.number}</td>
                <td>
                    <form:form method="post" action="${pageContext.request.contextPath}/reservations/create">
                        <input type="hidden" name="userId" value="${user.id}"/>
                        <input type="hidden" name="parkingPlaceId" value="${parkingPlace.id}"/>
                        <input type="hidden" name="startTime" value="${startTime}"/>
                        <input type="hidden" name="endTime" value="${endTime}"/>
                        <button type="submit">Take</button>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
