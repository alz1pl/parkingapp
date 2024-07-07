<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<title>Create User</title>
<h1>Create User</h1>
<form:form action="${pageContext.request.contextPath}/users/create" modelAttribute="user" method="post">
    <div class="input-field">
        <form:label path="firstName">First Name</form:label>
        <form:input path="firstName" />
        <form:errors path="firstName" cssClass="error" />
    </div>
    <div class="input-field">
        <form:label path="lastName">Last Name</form:label>
        <form:input path="lastName" />
        <form:errors path="lastName" cssClass="error" />
    </div>
    <div class="input-field">
        <form:label path="email">Email:</form:label>
        <form:input path="email" />
        <form:errors path="email" cssClass="error" />
    </div>
    <div class="input-field">
        <form:label path="phone">Phone:</form:label>
        <form:input path="phone" />
        <form:errors path="phone" cssClass="error" />
    </div>
    <div class="input-field">
        <form:label path="type" class="active">Type</form:label>
        <form:select path="type" class="browser-default" style="text-transform: capitalize;">
            <c:forEach items="${userTypes}" var="type">
                <form:option value="${type}">
                    <c:out value="${fn:toLowerCase(type)}"/>
                </form:option>
            </c:forEach>
        </form:select>
        <form:errors path="type" cssClass="error"/>
    </div>
    <button class="waves-effect waves-light btn" type="submit">Create</button>
</form:form>
<a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/users">Back to list</a>