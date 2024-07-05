<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Parking House</title>
</head>
<body>
<h1>Create Parking House</h1>
<form action="${pageContext.request.contextPath}/parkinghouses/create" method="post">
    <label for="location">Location:</label>
    <input type="text" id="location" name="location" required>
    <button type="submit">Create</button>
</form>
<a href="${pageContext.request.contextPath}/parkinghouses">Back to list</a>
</body>
</html>
