<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Parking House</title>
</head>
<body>
<h1>Edit Parking House</h1>
<form action="${pageContext.request.contextPath}/parkinghouses/edit/${parkingHouse.id}" method="post">
    <label for="location">Location:</label>
    <input type="text" id="location" name="location" value="${parkingHouse.location}" required>
    <button type="submit">Update</button>
</form>
<a href="${pageContext.request.contextPath}/parkinghouses">Back to list</a>
</body>
</html>
