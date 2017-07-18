<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<body>
<c:set value="${pageContext.request.contextPath}" var="base"></c:set>
<script src="${base}/js/jquery.min.js"></script>
<script src="${base}/js/bootstrap.min.js"></script>
<script src="${base}/js/scripts.js"></script>
<script src="${base}/js/jquery.form.js"></script>
<script>
    function doRegister() {
        var options = {
            url: '${base}/login/doRegister.shtml',
            type: 'post',
            dataType:'json',
            success: function (data) {
                alert("aaaaaaaaa")
                alert(data.data)
            }
        }
        $("#jvForm").ajaxSubmit(options);
    }
</script>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <img class="logo" src="${base}/images/048.png">
        </div>
        <div class="col-md-8">
            <br/> <br/> <br/> <br/>
            <h5>
                欢迎来到盛唐文化！回到<a href="index.html">首页</a>
            </h5>
        </div>
    </div>
    <hr style="height:2px;border:none;border-top:3px solid red;"/>
    <form action="${base}/login/doRegister.shtml" id="jvForm">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <h3 class="page-header">新用户注册</h3>
                    <div class="form-group">
                        <label for="txtUserName">用户名</label>
                        <input type="text" class="form-control" id="txtUserName" name="username" placeholder="请输入您的用户名">
                    </div>
                    <div class="radio">
                        性&nbsp&nbsp别：&nbsp&nbsp&nbsp&nbsp
                        <input type="radio" value="MAN" name="gender">男&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <input type="radio" value="WOMAN" name="gender">女
                    </div>
                    <div class="form-group">
                        <label for="txtPassWord">密&nbsp &nbsp 码</label>
                        <input type="password" class="form-control" id="txtPassWord" name="password"
                               placeholder="请输入您的密码">
                    </div>
                    <div class="form-group">
                        <label for="txtPassWord">确认密 码</label>
                        <input type="password" class="form-control" id="txtPassWord" placeholder="请重新输入您的密码">
                    </div>
                    <div class="form-group">
                        <label for="txtPassWord">邮&nbsp &nbsp 箱</label>
                        <input type="text" class="form-control" id="txtPassWord" name="email" placeholder="请输入您的邮箱">
                    </div>
                    <div class="form-group">
                        <label for="txtPassWord">联系电话</label>
                        <input type="text" class="form-control" id="txtPassWord" name="phone" placeholder="请输入您的联系电话">
                    </div>
                    <div class="form-group">
                        <label for="txtUserName">地址</label>
                        <input type="text" class="form-control" id="txtUserName" name="addr" placeholder="请输入您的地址">
                    </div>
                    <div class="col-sm-10 col-sm-offset-2">
                        <button type="button" class="btn btn-lg btn-success" onclick="doRegister()">提交</button>
                    </div>


                </div>
                <div class="col-md-4">
                </div>
            </div>
        </div>
    </form>
</div>


</body>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <c:set var="base" value="${pageContext.request.contextPath}"/>
    <title>Bootstrap 3, from LayoutIt!</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="${base}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/style.css" rel="stylesheet">

</head>
</html>
