<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${title}</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var selectElems = document.querySelectorAll('select');
            M.FormSelect.init(selectElems);

            flatpickr(".datetimepicker", {
                enableTime: true,
                dateFormat: "Y-m-d\\TH:i"
            });
        });
    </script>
    <style>
        .nav-wrapper {
            background-color: #2196F3;
        }
        .btn, .btn:hover, .btn:focus {
            background-color: #2196F3 !important;
        }
        .btn.red, .btn.red:hover, .btn.red:focus {
            background-color: #f44336 !important;
        }
    </style>
</head>
<body>

<nav>
    <div class="nav-wrapper">
        <a href="${pageContext.request.contextPath}/" class="brand-logo center">Parking App</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="${pageContext.request.contextPath}/reservations">Reservations</a></li>
            <li><a href="${pageContext.request.contextPath}/parkinghouses">Parking Houses</a></li>
            <li><a href="${pageContext.request.contextPath}/parkingplaces">Parking Places</a></li>
            <li><a href="${pageContext.request.contextPath}/users">Users</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <c:if test="${not empty error}">
        <div class="row">
            <div class="col s12">
                <div class="card red lighten-1">
                    <div class="card-content white-text">
                        <span class="card-title">Error</span>
                        <p>${error}</p>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <jsp:include page="${pageContent}" />
</div>

</body>
</html>
