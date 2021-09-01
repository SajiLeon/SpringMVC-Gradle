var app = angular.module("Test", []);
app.controller("UserController", function($scope, $http) {
	$scope.users = [];
	$scope.form = {
		id : ''
	};

	$scope.getUser = function() {
		$http({
			method : "GET",
			url : 'getUser',
			data : angular.toJson($scope.form.id),
			headers : {
				'Content-Type' : 'application/json'
			}
		}).then(_success, _error);
	};
	function _success(response) {
		// alert("test")
		_clearForm()
	}
	function _error(response) {
		// alert("test1")
		console.log(response.statusText);
	}
	function _clearForm() {
		$scope.form.id = '';
	}
	;
});
