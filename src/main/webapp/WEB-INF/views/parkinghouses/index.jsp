<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Parking Houses</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>Parking Houses</h1>
<a href="${pageContext.request.contextPath}/parkinghouses/create">Create New Parking House</a>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Location</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="parkingHouse" items="${parkingHouses}">
        <tr>
            <td>${parkingHouse.id}</td>
            <td>${parkingHouse.location}</td>
            <td>
                <a href="${pageContext.request.contextPath}/parkinghouses/edit/${parkingHouse.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/parkinghouses/delete/${parkingHouse.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
