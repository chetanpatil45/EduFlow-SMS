<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Login | EduFlow</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style/auth.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
	<div class="container">
	<a href="<%=request.getContextPath()%>/index.jsp" class="back-pill">
            <i class='bx bx-left-arrow-alt'></i>
            <span>Home</span>
        </a>
		<form action="<%=request.getContextPath()%>/StudentLogin" method="post">
			<h2>Student Login</h2>
			<input type="text" placeholder="E-mail" name="email">
			<input type="password" name="pass" id="" placeholder="*************">
			<p>Note : If your are new your password will be your email.</p>
			<input type="submit" value="Login">
		</form>
	</div>
</body>
</html>