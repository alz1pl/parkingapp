<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<title>Edit Parking House</title>
<h1>Edit Parking House</h1>
<form:form action="${pageContext.request.contextPath}/parkinghouses/edit/${parkingHouse.id}" modelAttribute="parkingHouse" method="post">
    <div class="input-field">
        <form:label path="location">Location:</form:label>
        <form:input path="location" />
        <form:errors path="location" cssClass="error" />
    </div>
    <button class="waves-effect waves-light btn" type="submit">Update</button>
</form:form>
<a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/parkinghouses">Back to list</a>
