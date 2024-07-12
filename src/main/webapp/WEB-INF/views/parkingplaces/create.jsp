<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h1>Create Parking Place</h1>

<form:form method="post" modelAttribute="parkingPlace" action="${pageContext.request.contextPath}/parkingplaces/create">
    <div class="input-field">
        <form:label path="number">Number</form:label>
        <form:input path="number" class="form-control"/>
        <form:errors path="number" cssClass="error"/>
    </div>
    <div class="input-field">
        <select id="parkingHouse.id" name="parkingHouse.id" required>
            <option value="" disabled selected>Select Parking House</option>
            <c:forEach items="${parkingHouses}" var="parkingHouse">
                <option value="${parkingHouse.id}">${parkingHouse.location}</option>
            </c:forEach>
        </select>
        <label for="parkingHouse.id">Parking House:</label>
        <form:errors path="parkingHouse.id" cssClass="error"/>
    </div>
    <button class="waves-effect waves-light btn" type="submit">Save</button>
</form:form>

<a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/parkingplaces">Back</a>