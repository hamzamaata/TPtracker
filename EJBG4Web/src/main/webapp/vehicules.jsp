<%@page import="entities.Vehicule"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <title>Vehicule Page</title>
</head>
<body>

<div class="container">
    <h1>Vehicule Page</h1>

    <!-- Form to add a new vehicule -->
    <form action="VehiculeController" method="post">
        <div class="form-group">
            <label for="matricule">Matricule:</label>
            <input type="text" class="form-control" id="matricule" name="matricule" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Vehicule</button>
    </form>

    <!-- Display list of vehicules -->
    <table class="table mt-4">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Matricule</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${vehicules}" var="vehicule">
                <tr>
                    <td>${vehicule.id}</td>
                    <td>${vehicule.matricule}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>