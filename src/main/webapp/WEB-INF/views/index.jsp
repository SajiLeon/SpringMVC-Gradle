<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head><%@ page isELIgnored="false"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get All User</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
	<center>
		<div class="container">
			<div class="col-md-offset-1 col-md-10">
				<h2>Get All User (GET)</h2>
				<hr />
				<br />
				<br />
				<div class="panel panel-info">
					<div class="panel-heading">

						<h2>User List</h2>
					</div>
					<div class="panel-body">
						<table class="table table-striped table-bordered">
							<tr>
								<th>Id</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
							</tr>

							<c:forEach var="tempUser" items="${users}">

								<tr>

									<td>${tempUser.id}</td>
									<td>${tempUser.firstName}</td>
									<td>${tempUser.lastName}</td>
									<td>${tempUser.email}</td>

								</tr>

							</c:forEach>

						</table>

					</div>
				</div>
			</div>

		</div>
</body>
</html>