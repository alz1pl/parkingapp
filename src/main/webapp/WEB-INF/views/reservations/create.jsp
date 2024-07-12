<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Create Reservation</h2>

<form:form method="post" action="/reservations/create/search" class="col s12">
    <div class="row">
        <div class="input-field col s12">
            <select id="parkingHouseId" name="parkingHouseId" required>
                <option value="" disabled selected>Select Parking House</option>
                <c:forEach items="${parkingHouses}" var="parkingHouse">
                    <option value="${parkingHouse.id}">${parkingHouse.name}</option>
                </c:forEach>
            </select>
            <label for="parkingHouseId">Parking House:</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <input type="text" id="startTime" name="startTime" class="datetimepicker" required />
            <label for="startTime">Start Time:</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <input type="text" id="endTime" name="endTime" class="datetimepicker" required />
            <label for="endTime">End Time:</label>
        </div>
    </div>
    <button type="submit" class="btn waves-effect waves-light">Search Available Parking</button>
</form:form>

<c:if test="${not empty error}">
    <div class="card-panel red lighten-2">
        <span class="white-text">${error}</span>
    </div>
</c:if>

<c:if test="${not empty availableParkingPlaces}">
    <form:form method="post" modelAttribute="reservation" action="/reservations/create" class="col s12">
        <div class="row">
            <div class="input-field col s12">
                <select id="parkingPlace" name="parkingPlace.id" required>
                    <option value="" disabled selected>Select Parking Place</option>
                    <c:forEach items="${availableParkingPlaces}" var="parkingPlace">
                        <option value="${parkingPlace.id}">${parkingPlace.location}</option>
                    </c:forEach>
                </select>
                <label for="parkingPlace">Available Parking Places:</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <select id="user" name="user.id" required>
                    <option value="" disabled selected>Select User</option>
                    <c:forEach items="${users}" var="user">
                        <option value="${user.id}">${user.name}</option>
                    </c:forEach>
                </select>
                <label for="user">User:</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input type="text" id="startTime" name="startTime" class="datetimepicker" required value="${reservation.startTime}" />
                <label for="startTime">Start Time:</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input type="text" id="endTime" name="endTime" class="datetimepicker" required value="${reservation.endTime}" />
                <label for="endTime">End Time:</label>
            </div>
        </div>
        <button type="submit" class="btn waves-effect waves-light">Create Reservation</button>
    </form:form>
</c:if>

<a href="${pageContext.request.contextPath}/reservations" class="btn">Back</a>
