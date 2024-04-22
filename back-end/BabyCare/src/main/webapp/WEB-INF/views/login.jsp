<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="POST" action="${classpath }/login_processing_url">
        <label for="">Nhập email</label>
        <input type="text" id="username" name="username"/>
        </br>

        <label for="password">Password</label>
        <input type="password" id="password" name="password"/>
        </br>
        
        <input type="checkbox" id="remember-me" name="remember-me"/>
        <label for="remember-me">Remember me</label>

        <button type="submit">Login</button>
    </form>
</body>
</html>