<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h1>Parking Houses</h1>
<a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/parkinghouses/create">Create New Parking House</a>
<table class="striped">
    <thead>
    <tr>
        <th>ID</th>
        <th>Location</th>
        <th>Number of Parking Places</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="parkingHouse" items="${parkingHouses}">
        <tr>
            <td>${parkingHouse.id}</td>
            <td>${parkingHouse.location}</td>
            <td>${parkingPlacesCount[parkingHouse.id]}</td>
            <td>
                <a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/parkinghouses/edit/${parkingHouse.id}">Edit</a>
                <a class="waves-effect waves-light btn red" href="${pageContext.request.contextPath}/parkinghouses/delete/${parkingHouse.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
