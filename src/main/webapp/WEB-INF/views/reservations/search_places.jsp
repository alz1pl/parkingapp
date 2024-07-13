<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h1>Parking Places</h1>

<form method="post" action="${pageContext.request.contextPath}/reservations/show_available_places">
    <div class="row">
        <div class="input-field col s12">
            <select id="parkingHouseId" name="parkingHouseId" required>
                <option value="" disabled selected>Select Parking House</option>
                <c:forEach items="${parkingHouses}" var="parkingHouse">
                    <option value="${parkingHouse.id}">${parkingHouse.location}</option>
                </c:forEach>
            </select>
            <label for="parkingHouseId">Parking House:</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <select id="userId" name="userId" required>
                <option value="" disabled selected>Select User</option>
                <c:forEach items="${users}" var="user">
                    <option value="${user.id}">${user.firstName} ${user.lastName}</option>
                </c:forEach>
            </select>
            <label for="userId">Parking House:</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <input type="text" id="startTime" name="startTime" class="datetimepicker" required/>
            <label for="startTime">Start Time:</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <input type="text" id="endTime" name="endTime" class="datetimepicker" required/>
            <label for="endTime">End Time:</label>
        </div>
    </div>
    <button type="submit" class="btn waves-effect waves-light">
        Search For Available Places
        <i class="material-icons right">send</i>
    </button>

</form>
