<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Blue Rays Login</title>
<style type="text/css">
	.errorblock{
	color: red;
	background-color: green;
	}
</style>
</head>
<body>

<h1><span style="color:#4683EA;margin-right:-1%;">B</span><span style="color:rgba(236, 19, 19, 1);margin-left:1%;">l</span>
<span style="color:rgba(249, 246, 5, 1);margin-left:-1%;">u</span>
<span style="color:#4683EA;margin-left:-1%;">e</span>
<span style="color:rgba(204, 27, 239, 1);margin-left:-1%;">R</span>
<span style="color:rgba(18, 235, 243, 1);margin-left:-1%;">a</span>
<span style="color:rgba(12, 138, 14, 1);margin-left:-1%;">y</span>
<span style="color:rgba(252, 95, 9, 1);margin-left:-1%;">s</span>
 <img alt="" src="<c:url value="assets/img/icon.jpg"/>" style="width: 100px; max-height: 50px; min-height: 40px;"></h1> 


<c:if test="$(not empty error)">

<div class="errorblock"> 
	Login UnSuccessfull 
	<br>
	Caused : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
</div>
</c:if>

<form action="<c:url value='j_spring_security_check' />" name="f" method="post">
<table>
	<tr>
		<td>User:</td>
		<td> <input type="text" name="j_username" value="">
	</tr>
	<tr>
		<td>Password:</td>
		<td> <input type="password" name="j_password" value="">
	</tr>
	<tr>
		<td> <input type="submit" name="Submit" value="Submit"></td>
		<td> <input type="reset" name="Reset" value="reset	"></td>
	</tr>
</table>

</form>

</body>
</html>