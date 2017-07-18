<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="common.jsp"/>
</head>
<body>
    <form method="post" action="${base}/login/doLogin.do">
        <table>
            <tr><td>账号：</td><td><input type="text" name="username"></td></tr>
            <tr><td>密码：</td><td><input type="password" name="password"></td></tr>
            <tr><td style="column-span: 2"><input type="submit" value="登录"></td></tr>
        </table>

    </form>
</body>
</html>
