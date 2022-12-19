app.controller("myCtrl1", function($scope) {
	$scope.first_name = "박";
	$scope.last_name = "현정";
});
app.controller('myAPICtrl1', function($scope) {
	$scope.api_x = "Tomato";
	$scope.api_u = angular.uppercase($scope.api_x);
	$scope.api_l = angular.lowercase($scope.api_x);
	$scope.api_isString = angular.isString($scope.api_x);
	$scope.api_isNumber = angular.isNumber($scope.api_x);
})
app.controller('myFormCtrl1', function($scope) {
	$scope.master = {firstname: '박', lastname: '현정'};
	$scope.reset= function() {
		$scope.user = angular.copy($scope.master);
	}
	$scope.reset();
})
app.controller('coordinatesCtrl', function($scope) {
	$scope.coordinatesFunc = function(event) {
		$scope.x = event.clientX;
		$scope.y = event.clientY;
	}
})
app.controller("dropdownCtrl", function($scope) {
	$scope.dropdownFunc = function() {
		$scope.showAndHide = !$scope.showAndHide;
	}
})
app.controller("headerCtrl", function($scope, $timeout, $interval) {
	$scope.myHeader = "Hello world!";
	$scope.theTime = new Date().toLocaleTimeString();
	$timeout(function() {
		$scope.myHeader = "안녕하세요";
	}, 2000);
	$interval(function() {
		$scope.theTime = new Date().toLocaleTimeString();
	}, 1000);
});
app.controller("myCtrl2", function($scope, $location) {
	$scope.change_name = function() {
		$scope.changeName = $location.absUrl();
	}
});
app.controller("myCtrl3", function($scope) {
	$scope.cal= function() {
		return $scope.quantity * $scope.cost;
	}
});
app.controller("fruitsCtrl1", function($scope) {
	$scope.fruits = [{name : '사과', color : '빨강'}, {name : '딸기', color : '빨강'}, {name :'토마토', color : '빨강'}, {name : '가지', color : '보라'}];
});
app.controller("fruitsCtrl2", function($scope, $http) {
	$http({
		method: 'get',
		url : 'fruits'
	}).then(function success(response) {
		$scope.fruits = response.data;
	}, function error(response) {
		console.log(response);
	})
	$scope.orderByMe = function(x) {
		$scope.myOrder = x;
	}
});
app.controller("myCtrl4", function($scope, myService1) {
	$scope.myService = myService1.myFunc('서비스');
})
app.controller('myHttpCtrl', function($scope, $http) {
	$http.get('welcome').then(function(response) {
		$scope.welcomeMessage = response.data;

	})
});
app.controller('fruitsCtrl3', function($scope, $http) {
	$http({
		method: 'get',
		url: 'guessFruit'
	}).then(function success(response) {
		$scope.fruit_color = response.data.color ;
	}, function error(response) {
		$scope.fruit_name = resonse;
	})
});
app.controller("fruitsCtrl4", function($scope, $http) {
	$http({
		method:'get',
		url:'fruits'
	}).then(function success(response) {
		$scope.fruits = response.data;
	}, function error(response) {
		console.log(response);
	})
});
app.controller('redCtrl' ,function($scope) {
	$scope.red_msg = "레드페이지 입니다";
})
app.controller('greenCtrl', function($scope) {
	$scope.green_msg = "그린페이지입니다";
})
app.controller('blueCtrl', function($scope) {
	$scope.blue_msg = "블루페이지입니다";
})
app.controller('myShoppingListCtrl', function($scope) {
	$scope.carts =  ['빵', '치즈', '우유'];
	$scope.addItem = function() {
		$scope.errortext = '';
		if(!$scope.addMe) return;
		if($scope.carts.indexOf($scope.addMe) == -1) {
			$scope.carts.push($scope.addMe);
		}
		else {
			$scope.errortext= "이미 등록된 제품입니다";
		}
		$scope.addMe = '';
	}
	$scope.removeItem = function(index) {
		$scope.errortext = "";
		$scope.carts.splice(index,1);
	}
});







