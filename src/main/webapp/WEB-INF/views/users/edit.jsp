<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<h1>Edit User</h1>
<form:form action="${pageContext.request.contextPath}/users/edit/${user.id}" modelAttribute="user" method="post">
    <div class="input-field">
        <form:label path="firstName" class="active">First Name</form:label>
        <form:input path="firstName" class="validate"/>
        <form:errors path="firstName" cssClass="error"/>
    </div>
    <div class="input-field">
        <form:label path="lastName" class="active">Last Name</form:label>
        <form:input path="lastName" class="validate"/>
        <form:errors path="lastName" cssClass="error"/>
    </div>
    <div class="input-field">
        <form:label path="email" class="active">Email</form:label>
        <form:input path="email" class="validate"/>
        <form:errors path="email" cssClass="error"/>
    </div>
    <div class="input-field">
        <form:label path="phone" class="active">Phone</form:label>
        <form:input path="phone" class="validate"/>
        <form:errors path="phone" cssClass="error"/>
    </div>
    <div class="input-field">
        <form:label path="type" class="active">Type</form:label>
        <form:select path="type" class="browser-default">
            <form:option value="standard">Standard</form:option>
            <form:option value="manager">Manager</form:option>
        </form:select>
        <form:errors path="type" cssClass="error"/>
    </div>
    <button type="submit" class="waves-effect waves-light btn">Update</button>
</form:form>
<a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/users">Back to list</a>
