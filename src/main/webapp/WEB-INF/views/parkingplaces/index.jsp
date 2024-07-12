<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h1>Parking Places</h1>

<form method="get" action="${pageContext.request.contextPath}/parkingplaces">
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
    <button class="waves-effect waves-light btn" type="submit">Filter</button>
</form>

<c:if test="${not empty parkingPlaces}">
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Number</th>
            <th>Parking House</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${parkingPlaces}" var="parkingPlace">
            <tr>
                <td>${parkingPlace.id}</td>
                <td>${parkingPlace.number}</td>
                <td>${parkingPlace.parkingHouse.location}</td>
                <td>
                    <a class="waves-effect waves-light btn"
                       href="${pageContext.request.contextPath}/parkingplaces/edit/${parkingPlace.id}">Edit</a>
                    <a class="waves-effect waves-light btn red"
                       href="${pageContext.request.contextPath}/parkingplaces/delete/${parkingPlace.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/parkingplaces/create">Create New
    Parking Place</a>

