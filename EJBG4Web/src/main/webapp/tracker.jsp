<%@ page import="entities.Tracker" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.util.function.Predicate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <title>Tracker Page</title>
</head>
<body>

<div class="container">
    <h1>Tracker Page</h1>

    <!-- Form to add a new tracker -->
    <form action="TrackerController" method="post">
        <div class="form-group">
            <label for="simNumber">Sim Number:</label>
            <input type="text" class="form-control" id="simNumber" name="simNumber" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Tracker</button>
    </form>

    <!-- Display list of trackers -->
    <table class="table mt-4">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Sim Number</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${trackers}" var="tracker">
                <tr>
                    <td>${tracker.id}</td>
                    <td>${tracker.simNumber}</td>
                    <td>
                        <a href="TrackerController?operation=edit&id=${tracker.id}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="TrackerController?operation=delete&id=${tracker.id}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Form for editing tracker -->
    <c:if test="${not empty editTracker}">
        <form action="TrackerController" method="post">
            <h2>Edit Tracker</h2>
            <input type="hidden" name="id" value="${editTracker.id}">
            <div class="form-group">
                <label for="simNumberEdit">Sim Number:</label>
                <input type="text" class="form-control" id="simNumberEdit" name="simNumber" value="${editTracker.simNumber}" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </c:if>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>