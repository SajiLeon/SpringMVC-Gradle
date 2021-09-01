<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>
            AngularJS - Demo
        </title>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/sample.js"></script>

        <style>
            .button {
                cursor: pointer;
                color: blue;
            }
            td,th{
                border: 1px solid gray;
                width: 25%;
                text-align: left;
            }
            table {
                width: 600px;
            }
        </style>
    <head>
    <body ng-app="Test" ng-controller="UserController as userCtrl" ng-init= "userCtrl.init()">
         <h1>
            Demo Angular
        </h1>
 
        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
 
            <tr ng-repeat="user in listOfUsers">
                <td>{{ user.firstName }}</td>
                <td>{{ user.lastName }}</td>
                <td>{{ user.email }}</td>
                <td><a ng-click="editUser( user )" class="button">Edit</a> | <a ng-click="removeUser( user )" class="button">Remove</a></td>
            </tr>
 
        </table>
 
        <h2>Add/Edit User</h2>
 
        <form ng-submit="submitUser()">
            <table>
                <tr>
                    <td>First Name</td>
                    <td><input type="text" ng-model="form.firstName" size="60" /></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><input type="text" ng-model="form.lastName" size="60" /></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" ng-model="form.email" size="60" /></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Submit" /></td>
                </tr>
            </table>
        </form>
 
    </body>
</html>