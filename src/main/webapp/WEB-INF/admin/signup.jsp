<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup | EduFlow</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/style/auth.css">
	</head>
<body>

<%
	String error = (String) request.getAttribute("error");
	if(error != null){
		%>
		<script type="text/javascript">
			alert("<%= error %>");
		</script>
		<%
	}
%>

    <div class="container">
        <form action="<%=request.getContextPath()%>/AdminSignupServlet" method="post" class="form-signup">
            <h2>Signup</h2>
            <input type="text" name="username" placeholder="Username">
            <input type="email" name="email" id="" placeholder="E-mail">
            <input type="text" name="name" id=""placeholder = "Full Name">
            <input type="password" name="pass" id="" placeholder="*********">
            <textarea name="address" id="" placeholder="Address"></textarea>
            <p>Already have an account ? Login <a href="<%=request.getContextPath()%>/admin/login.jsp">here.</a></p>
            <input type="submit" value="Signup">
        </form>
    </div>
</body>
</html>