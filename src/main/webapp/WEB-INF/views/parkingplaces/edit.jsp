<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>Edit Parking Place</title>
<h1>Edit Parking Place</h1>
<form:form method="post" modelAttribute="parkingPlace"
           action="${pageContext.request.contextPath}/parkingplaces/edit/${parkingPlace.id}">
    <div class="input-field">
        <form:label path="number">Number</form:label>
        <form:input path="number" class="form-control"/>
        <form:errors path="number" cssClass="error"/>
    </div>
    <div class="input-field">
        <form:select path="parkingHouse.id" class="browser-default">
            <form:option value="">Select Parking House</form:option>
            <c:forEach items="${parkingHouses}" var="parkingHouse">
                <form:option value="${parkingHouse.id}">${parkingHouse.location}</form:option>
            </c:forEach>
        </form:select>
        <form:errors path="parkingHouse.id" cssClass="error"/>
    </div>
    <button class="waves-effect waves-light btn" type="submit">Save</button>
</form:form>