<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body>

<nav>
    <div class="nav-wrapper">
        <a href="${pageContext.request.contextPath}/" class="brand-logo">Parking App</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="${pageContext.request.contextPath}/parkinghouses">Parking Houses</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <jsp:include page="${pageContent}" />
</div>

</body>
</html>
