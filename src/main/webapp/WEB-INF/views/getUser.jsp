<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get user</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript" >

	var app = angular.module("Test", []);
	app.controller("UserController", function($scope, $http) {
		$scope.users = [];
		$scope.form = {
			id : ''
		};
		
		$scope.validation = function() {
				var num = $scope.form.id;
				if (isNaN(num)) {
					document.getElementById("numloc").innerHTML = "Enter Numeric value only";
					return false;
				} else if (num == "") {
					document.getElementById("numloc").innerHTML = "Enter a value";
					return false;
				} else {
					return true;
				}
		};

		$scope.getUser = function() {
			$http({
				method : "GET",
				url : 'getUser?id=' +$scope.form.id ,
				data : angular.toJson($scope.form.id),
				headers : {
					'Content-Type' : 'application/json'
				}
			}).then(_success, _error);
		};
		function _success(response) {
			alert("success") 
			console.log(response)
			var id = response.data.id;
			var email = response.data.email;
			var firstName = response.data.firstName;
			var lastName = response.data.lastName;
			var password = response.data.password;
			//document.getElementById("numloc").innerHTML = id  + email + firstName + lastName + password;
			
			document.getElementById("userId").innerHTML = id;
			document.getElementById("userFirstName").innerHTML = firstName;
			document.getElementById("userLastName").innerHTML = lastName;
			document.getElementById("userEmail").innerHTML = email;
			document.getElementById("userPassword").innerHTML = password;
			
			_clearForm()
		}
		function _error(response) {
			alert("error")
			console.log(response.statusText);
		}
		function _clearForm() {
			$scope.form.id = '';
		}
		;
	});

	</script>
	
	
	<style>
            td,th{
                border: 1px solid gray;
                width: 25%;
                text-align: left;
            }
            table {
                width: 600px;
            }
        </style>
	

</head>

<body ng-app="Test" ng-controller="UserController as userCtrl">

	<form ng-submit="getUser()" name="getUserByIdForm">
		Id: <input type="text" ng-model="form.id" name="num"> 
		<span id="numloc"></span>
		<br /> <input type="submit" value="Click" ng-click="validation()">
	</form>
	<br/>
	<table>
            <tr>
                <th>Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Password</th>
            </tr>
 
            <tr>
                <td id="userId">{{ id }}</td>
                <td id= "userFirstName">{{ firstName }}</td>
                <td id="userLastName">{{ lastName }}</td>
                <td id="userEmail">{{ email }}</td>
                <td id="userPassword">{{ password }}</td>
            </tr>
 
        </table>

</body>
</html>


