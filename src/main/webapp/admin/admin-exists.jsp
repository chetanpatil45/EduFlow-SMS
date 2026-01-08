<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Already Exists</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: #f4f6f9;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.card {
	background: #fff;
	padding: 30px 40px;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: 420px;
}

.card h2 {
	color: #d9534f;
	margin-bottom: 15px;
}

.card p {
	color: #555;
	font-size: 15px;
	margin-bottom: 25px;
}

.card a {
	display: inline-block;
	padding: 10px 18px;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	font-size: 14px;
}

.card a.home {
	background: #1e7e20;
}

.card a.login {
	background: #007bff;
}

.card a.home:hover {
	background: #1e7e34;
}

.card a.login:hover {
	background: #0056b3;
}
</style>
</head>
<body>

	<div class="card">
		<h2>Admin Already Exists</h2>
		<p>
			The admin account has already been set up.<br> New admin
			registration is disabled.
		</p>
		<a href="<%=request.getContextPath()%>/index.jsp" class="login">
			Go to Home Page </a> <a
			href="<%=request.getContextPath()%>/admin/login.jsp" class="home">
			Go to Admin Login </a>
	</div>

</body>
</html>
