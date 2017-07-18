<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 3, from LayoutIt!</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">
    <c:set var="base" value="${pageContext.request.contextPath}"></c:set>
    <link href="${base}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/style.css" rel="stylesheet">
    <script type="text/javascript" src="${base}/js/jquery-1.8.0.min.js"></script>
    <script>
        $(function () {
            var val = $("#message").val();
            if(val === undefined || val === "" || val === null){

            }else {
                alert(val);
            }
        })
    </script>
</head>
<body background="${base}/images/050.jpg">

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
          
        </div>
    </div>
       <br> <br> <br> <br> <br> <br> <br> <br> <br>
    <div class="row">
        <div class="col-md-6">
        </div>
        <div class="col-md-4">
            <h3 class="title"><b>后台登录</b></h3>
            <form class="form-horizontal" role="form" action="${base}/login/doLogin.do" method="post">
                <div class="form-group">

                    <label for="inputEmail3" class="col-sm-2 control-label">
                        账号：
                    </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" name="username">
                    </div>
                </div>
                <div class="form-group">

                    <label for="inputPassword3" class="col-sm-2 control-label">
                        密码：
                    </label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword3" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp
                            <label>
                                <input type="checkbox"> 记住密码
                            </label>&nbsp &nbsp &nbsp &nbsp &nbsp&nbsp
                            <a href="#" class="am-fr"><b>忘记密码</b></a>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <button type="submit" class="btn btn-default">
                            登录
                        </button>
                        <a href="${base}/register" class="zcnext am-fr am-btn-default"><button type="submit" class="btn btn-default">
                            注册
                        </button></a><br/>
                    </div>
                </div>
            </form>
        </div>
        <input value="${error}" id="message" type="hidden">
        <div class="col-md-2">
        </div>
    </div>
</div>

<script src="${base}/js/jquery.min.js"></script>
<script src="${base}/js/bootstrap.min.js"></script>
<script src="${base}/js/scripts.js"></script>
</body>
</html>
