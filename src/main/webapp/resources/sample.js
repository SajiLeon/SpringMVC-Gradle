var app = angular.module("Test", []);

//Controller Part
app.controller("UserController", function($scope, $http) {

	//Initialize page with default data which is blank in this example
	$scope.users = [];
	$scope.form = {
		id : -1,
		firstName : "",
		lastName : "",
		email : ""
	};

	//Now load the data from server

	
	$scope.init = function(){
		_refreshPageData();
	}

	//HTTP POST/PUT methods for add/edit user
	$scope.submitUser = function() {

		var method = "";
		var url = "";
		if ($scope.form.id == -1) {
			//Id is absent so add user - POST operation
			method = "POST";
			url = 'users';
		} else {
			//If Id is present, it's edit operation - PUT operation
			method = "PUT";
			url = 'users/' + $scope.form.id;
		}

		$http({
			method : method,
			url : url,
			data : angular.toJson($scope.form),
			headers : {
				'Content-Type' : 'application/json'
			}
		}).then(_success, _error);
	};

	//HTTP DELETE- delete user by Id
	$scope.removeUser = function(user) {
		$http({
			method : 'DELETE',
			url : 'users/' + user.id
		}).then(_success, _error);
	};

	//In case of edit user, populate form with user data
	$scope.editUser = function(user) {
		$scope.form.firstName = user.firstName;
		$scope.form.lastName = user.lastName;
		$scope.form.email = user.email;
		$scope.form.id = user.id;
	};

	/* Private Methods */
	//HTTP GET- get all users collection
	function _refreshPageData() {
		$http({
			method : 'GET',
			url : '/getUserDemo'
		}).then(function successCallback(response) {
			$scope.listOfUsers = response.data.listOfUsers;
		}, function errorCallback(response) {
			console.log(response.statusText);
		});
	}

	function _success(response) {
		_refreshPageData();
		_clearForm()
	}

	function _error(response) {
		console.log(response.statusText);
	}

	//Clear the form
	function _clearForm() {
		$scope.form.firstName = "";
		$scope.form.lastName = "";
		$scope.form.email = "";
		$scope.form.id = -1;
	}
	;
});