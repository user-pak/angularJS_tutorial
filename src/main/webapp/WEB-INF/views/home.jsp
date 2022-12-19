<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<style>
		input.ng-invalid { background-color:lightblue;}
		table, th , td {
		  border: 1px solid grey;
		  border-collapse: collapse;
		  padding: 5px;
		}
		
		table tr:nth-child(odd) {
		  background-color: #f1f1f1;
		}
		
		table tr:nth-child(even) {
		  background-color: #ffffff;
		}
		
		.ng-hide {
		  height: 0;
		  width: 0;
		  background-color: transparent;
		  top:-200px;
		  left: 200px;
		}
	</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-animate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
<body ng-app ="myApp">

	<div ng-controller="headerCtrl">
		<h1 style="color:{{root_color}}">
			{{myHeader}}  
		</h1>
		<P >시작시간:   The time on the server is ${serverTime}. </P>
		<p> 현재 시간: {{theTime}} </p>
	</div>

	<div ng-controller="myHttpCtrl">
		<p> 오늘의 환영인사는 {{welcomeMessage}}</p>
	</div>
 	<div>
	 	이름:<input type="text" ng-model="name" required><br>
		입력한 이름은....<p ng-bind="name">{{name}}</p>
		<code ng-non-bindable>{{expression}}</code>
 	</div>

	<div ng-controller="myCtrl1">
		성: <input ng-model="first_name">
		이름: <input ng-model="last_name"><br>
		성명 :<p> {{first_name + last_name}}</p>
	</div>

	<div>
		입력한 색상은....<input style="background-color:{{color}}" ng-model="color">
	</div>

	<div>
		수량:<input type="text" ng-model="quantity"> * 비용:<input type="text" ng-model="cost"> = {{quantity*cost}}
	</div>

	<div ng-init="person = {firstname :'박',lastname : '현정'}">
		첫 번째 사람 el: ${person.firstName}${person.lastName }
		첫 번째 사람 ex: <input placeholder={{person.firstname}}{{person.lastname}} >
		첫 번째 사람 ng: <span ng-bind="person.firstname + person.lastname"></span>
	</div>

	<div ng-init = "points = [1,3,5,7,8]">
		[1,3,5,7,8]의 2번째 배열  ex: {{points[1]}} <br>
		[1,3,5,7,8]의 4번째 배열 ng : <span ng-bind="points[3]"></span>
	</div>
	
	<div ng-init = "fruits =[{name : '사과', color : '빨강'}, {name: '딸기', color : '빨강'}]">
		<ul>
			<li ng-repeat = "x in fruits">
			{{x.name + '는 ' + x.color + '색이다'}}
			</li>
		</ul>
		
	</div>
	<div>
		<form name="myForm1" novalidate>
			이메일 : <input type="email" name="email1" ng-model="text" required>
			<span ng-show="myForm1.email1.$touched && myForm1.email1.$invalid" style="color:red">
			<span ng-show = "myForm1.email1.$error.email">는 이메일 형식에 맞지 않습니다</span>
			</span><br>
			status:
			<ul>
				<li>if true, the value meets all criteria : {{myForm1.email1.$valid}}
				<li>if true, the field has been in focus: {{myForm1.email1.$touched}}
				<li>if true, the value has been changed :{{myForm1.email1.$dirty}}
			</ul>
		</form>
	</div>
	<div ng-controller="myCtrl2">
		이름을 쓰고<input type="text" ng-model="changeName">
		<h4 ng-click="change_name()">{{changeName}}클릭하면 absUrl</h4>
	</div>

	<div ng-controller="myCtrl3">
		갯수:<input type="number" ng-model="quantity"> * 가격:<input type="number" ng-model="cost"> = {{cal() | currency:"￦":0}}
	</div>

	<div ng-controller="fruitsCtrl1">
		<ul>
			<li ng-repeat = "x in fruits | orderBy : 'name' | filter : '빨강'">
				{{x.name + '는'  + x.color}}
			</li>
		</ul>
	
	</div>
	
	<div ng-controller = "fruitsCtrl2">
		<table border="1" width = "300" height= "100">
			<tr>
				<th >인덱스</th>
				<th ng-click="orderByMe('name')">이름</th>
				<th ng-click="orderByMe('color')">색깔</th>
			</tr>
			<tr ng-repeat =" x in fruits | orderBy : myOrder">
				<td>{{$index+1}}</td>
				<td >{{x.name}}</td>
				<td >{{x.color}}</td>
			</tr>
		
		</table>
	</div>
	
	<div ng-controller = "myCtrl4">
		서비스 : {{myService}}
	</div>
	
	<div ng-controller="fruitsCtrl3">
		<input type="text" ng-model="fruit_name" placeholder="과일이름">은 {{fruit_color}} 이다
	</div>
	
	<div ng-controller="fruitsCtrl4">
		<select ng-model="myFruit" ng-options= "fruit.name for fruit in fruits"><option value="">과일선택</option></select>
		선택하신 과일은 {{myFruit.color}}색입니다
	</div>
	
<!-- 	<div ng-controller="fruitsCtrl4">
		<select ng-model="myFruit">
			<option ng-repeat="fruit in fruits" ng-value="{{fruit}}">{{fruit.name}}</option>
		</select>
		선택하신 과일은 {{myFruit.color}}색입니다
	</div> -->
	
	<div ng-init="mySwitch= true" >
		<p>true or false : {{mySwitch}}
		<input type="checkbox" ng-model="mySwitch">
		<button ng-disabled="mySwitch">클릭</button>
		<span ng-show="mySwitch">무궁화꽃이피었습니다</span>
		<span ng-hide="mySwitch">부끄부끄</span>
		<span ng-show="1>0">show</span>
		
	</div>
	
	<div ng-init="mouseOverCount = 0">
		<span ng-mouseover="mouseOverCount = mouseOverCount + 1">마우스오버횟수: {{mouseOverCount}}</span>
	</div>
	<div ng-init="clickCount=0">
		<span ng-click="clickCount = clickCount+1">클릭횟수: {{clickCount}}</span>
	</div>
	<div ng-controller="dropdownCtrl" ng-init="showAndHide=true">
		<button ng-click="dropdownFunc()">메뉴보기</button>
		<div ng-hide="showAndHide" style="background-color:lightgreen">
			<h1>메뉴</h1><div>{{text}}주스</div><div>딸기주스</div><div>오렌지주스</div><div>와인</div><div>수박주스</div>
		
		</div>
	</div>
	<div ng-controller="coordinatesCtrl">
		<textarea ng-mousemove="coordinatesFunc($event)">마우스좌표:({{x}},{{y}})</textarea>
	</div>

	<div>
		<form name="myFruitForm">
			선택: <input type="radio" ng-model="myFruit" value="토마토">토마토
				 <input type="radio" ng-model="myFruit" value="딸기">딸기
				 <input type="radio" ng-model="myFruit" value="포도">포도
				 <select ng-model="myFruit">
				 	<option value="">선택</option>
					<option value="사과">사과</option>
					<option value="배">배</option>
					<option value="바나나">바나나</option>
				 </select>
		</form>
		선택하신 과일은 {{myFruit}}입니다
			
	</div>
	
	<div ng-controller="myFormCtrl1">
		<form novalidate>
			성 : <input type="text" ng-model="user.firstname">
			이름: <input type="text" ng-model="user.lastname">
			<button ng-click="reset()">초기화</button>
		</form>
	</div>
	
	<div>
		<form name="input_form1">
			<input type="text" name="form1_input" ng-model="valid_input" required> 
			<span ng-show="input_form1.form1_input.$error.required">입력란이 비어있습니다(required)</span>
			<input type="submit" ng-disabled="input_form1.form1_input.$dirty && input_form1.form1_input.$invalid || input_form1.form1_input.$error.required">
		</form>
		
	</div>
	
	<div ng-controller="myAPICtrl1">
		<p>API:{{api_x}}</p>
		<p>uppercase:{{api_u}}</p>
		<p>lowercase:{{api_l}}</p>
		<p>isString:{{api_isString}}</p>
		<p>isNumber:{{api_isNumber}}</p>
	</div>

	<div ng-include="'https://tryit.w3schools.com/angular_include.php'"></div>
	Be sure that the server on the destination allows cross domain file access.	
<!-- 	
	<div >
		<a href="#!/">메인페이지</a>
		<a href="#!/red">레드페이지</a>
		<a href="#!/green">그린페이지</a>
		<a href="#!blue">블루페이지</a>
		<ng-view></ng-view>
	</div>
 -->	
	<div ng-controller="myShoppingListCtrl">
		<h2>상품 리스트</h2>
		<ul>
			<li ng-repeat="item in carts">{{item}}<span style="cursor:pointer" ng-click="removeItem($index)">&times;</span></li>
		</ul>
		<input type="text" ng-model="addMe">
		<button ng-click="addItem()">상품추가</button>
		<p>{{errortext}}</p>
	</div>	
	
	
	
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>	
<%-- 	
	<div>
		<c:forEach items="${ fruits}" var="fruit">
			${fruit.name } 은 ${fruit.color }이다
		</c:forEach>
	</div> 
--%>
<script src = "resources/myApp.js"></script>
<script src = "resources/myCtrl.js"></script>

</body>
</html>
