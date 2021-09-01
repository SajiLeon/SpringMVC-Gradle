<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get by Id</title>
</head>
<body>
<div class="panel-body">
<center>
<h2>Get User by Id (GET)</h2>
     <table class="table table-striped table-bordered">
      <tr>
      <th>Id</th> 
       <th>First Name</th>
       <th>Last Name</th>
       <th>Email</th>
      </tr>

      <c:forEach var="tempUser" items="${user}">

       <tr>
        <td>${user.id}</td>
        <td>${user.firstName}</td>
        <td>${user.lastName}</td>
        <td>${user.email}</td>

       </tr>

      </c:forEach>

     </table>

    </div>
</body>
</html>