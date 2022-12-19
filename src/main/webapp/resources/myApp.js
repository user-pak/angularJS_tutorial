var app = angular.module("myApp",['ngAnimate', "ngRoute"]);
app.run(function($rootScope) {
	$rootScope.root_color = 'blue';
})
app.service("myService1", function() {
	this.myFunc = function(x) {
		return 'return' + x;
	}
})
app.config(function($sceDelegateProvider) {
	$sceDelegateProvider.resourceUrlWhitelist([
		'https://tryit.w3schools.com/**'
	])
})
//app.config(function($routeProvider) {
//	$routeProvider
//	.when("/", {
//		templateUrl : "home.jsp",
//	})
//	.when("/red", {
//		templateUrl : "red.jsp",
//		controller : 'redCtrl'
//	})
//	.when("green", {
//		templateUrl : "green.jsp",
//		controller : 'greenCtrl'
//	})
//	.when("blue", {
//		templateUrl : "<div style='background-color : blue>{{blue_msg}} </div>",
//		controller : 'blueCtrl'
//	})
//})