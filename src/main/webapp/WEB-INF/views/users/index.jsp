<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<h1>Users</h1>
<a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/users/create">Create New User</a>
<table class="striped">
    <thead>
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Type</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.email}</td>
            <td>${user.phone}</td>
            <td><span style="text-transform: capitalize;"> <c:out value="${fn:toLowerCase(user.type)}"/></span></td>
            <td>
                <a class="waves-effect waves-light btn" href="${pageContext.request.contextPath}/users/edit/${user.id}">Edit</a>
                <a class="waves-effect waves-light btn red"
                   href="${pageContext.request.contextPath}/users/delete/${user.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
