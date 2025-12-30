<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | EduFlow</title>
    <link rel="stylesheet" href="../style/auth.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="container">
        <a href="<%=request.getContextPath()%>/index.jsp" class="back-pill">
            <i class='bx bx-left-arrow-alt'></i>
            <span>Home</span>
        </a>

        <form action="<%=request.getContextPath()%>/AdminLogin" method="post">
            <h2>Login</h2>
            <input type="text" placeholder="Username or E-mail" name="username" required>
            <input type="password" name="pass" placeholder="*************" required>
            <p>
                Don't have an account? create <a href="<%=request.getContextPath()%>/AdminSignupServlet">here.</a>
            </p>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>