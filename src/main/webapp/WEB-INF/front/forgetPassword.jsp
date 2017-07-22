<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <c:set var="base" value="${pageContext.request.contextPath}"></c:set>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>找回密码</title>
</head>
<body>
<div class="container">
    <form action="${base}/login/forget.shtml">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <img alt="logo" src="${base}/images/048.jpg"><br/>
                </div>
                <div class="col-md-8">
                </div>
            </div>
        </div>
        <br><br>
        用户名：<input type="text" name="username"/><br><br>
        邮&nbsp&nbsp&nbsp箱&nbsp:&nbsp<input type="text" name="email"/><br><br>
        <input type="submit" value="找回密码"/>
    </form>
</div>
</body>
</html>