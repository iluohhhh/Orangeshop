<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.orange.mycount.SessionCounter" %> 
<html lang="en">
<head>
    <c:set var="base" value="${pageContext.request.contextPath}"></c:set>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 3, from LayoutIt!</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <script src="http://cdn.bootcss.com/jquery/3.0.0/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script language="javascript" src="${base}/js/JS.js"></script>
    <link href="${base}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<script>
    function productList(id){
        window.location.href='${base}/front/productList.shtml?typeId='+id
    }
</script>
<body>
<div class="container">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="btn-group">
                    <img alt="logo" src="${base}/images/048.jpg"><br/>
                </div>

                <table class="table">
                    <tbody>
                    <c:forEach var="type" items="${types}">
                        <tr>
                            <td>
                                <a href="javascript:void(0)" onclick="productList(${type.id})">${type.name}</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-8">
                        <h5>
                            欢迎来到盛唐文化！ 当前在线人数为:${activeSessions}
                        </h5>
                    </div>
                    <div class="col-md-2">
                        <div class="btn-group">

                            <button data-toggle="dropdown" class="btn btn-default dropdown-toggle">
                                我的"唐唐"
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="${base}/order/myOrder.shtml">我的订单</a>
                                </li>
                                <li>
                                    <a href="${base}/login/tochange.shtml">修改密码</a>
                                </li>
                                <li>
                                    <a href="${base}/shopping/cart.shtml">我的购物车</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="btn-group">

                            <button data-toggle="dropdown" class="btn btn-default dropdown-toggle">
                                客户服务
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="help.html">帮助</a>
                                </li>
                                <li>
                                    <a href="#">退换货</a>
                                </li>
                                <li>
                                    <a href="#">联系客服</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <br/><br/>
                <!--搜索框-->
                <div class="input-group sou">
                    <input type="text" class="form-control" placeholder="请输入关键字"/>
                    <span class="input-group-btn">
							<button class="btn btn-primary" type="button">搜索</button>
						</span>

                </div>
                <br>


                <table class="table">
                    <tr>
                        <td>
                            <a href="index.html">首页</a>
                        </td>
                        <td>
                            <a href="onsale.html">今日特惠</a>
                        </td>
                        <td>
                            <a href="#">书单推荐</a>
                        </td>


                    </tr>
                </table>

                <div class="bannerTwo">
                    <!--轮播 -->

                    <div id="circleContent" class="carousel slide">
                        <ol class="carousel-indicators">
                            <li data-target="#circleContent" data-slide-to="0" class="active"></li>
                            <li data-target="#circleContent" data-slide-to="1"></li>
                            <li data-target="#circleContent" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="${base}/images/019.jpg">
                                <div class="carousel-caption"></div>
                            </div>
                            <div class="item">
                                <img src="${base}/images/033.jpg">
                                <div class="carousel-caption"></div>
                            </div>
                            <div class="item">
                                <img src="${base}/images/034.jpg">
                                <div class="carousel-caption"></div>
                            </div>
                        </div>
                        <a class="carousel-control left" href="#circleContent" data-slide="prevent">‹</a>
                        <a class="carousel-control right" href="#circleContent" data-slide="next">›</a>
                    </div>
                    <br/><br/>

                </div>
            </div>
        </div>
        <br/>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
            </div>
        </div>
    </div>
    <hr style="height:2px;border:none;border-top:3px solid red;"/>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <h3>
                    最新上架<br>
                    <a herf="#"><font size="4">透过幽默风趣的笔调<br/>感受大明王朝的兴衰</font></a><br/><br/>
                    <img src="${base}/images/002.jpg">
                </h3>
            </div>
            <div class="col-md-3">
                <h3>
                    重点推荐<br>
                    <a herf="#"><font size="4">我终将<br/>遗忘梦境中的<br/>那些路径、山峦与田野，<br/>遗忘那些<br/>永远不能实现的梦.</font></a><br/>
                    <img src="${base}/images/003.jpg">
                </h3>
            </div>
            <div class="col-md-3">
                <h3>
                    独家畅品<br>
                    <a herf="#"><font size="4">降临原篇小说</font></a><br/><br/>
                    <img src="${base}/images/004.jpg">
                </h3>
            </div>
            <div class="col-md-3">
                <h3>
                    热搜图书<br>
                    <a herf="#"><font size="4">降临原篇小说</font></a><br/><br/>
                    <img src="${base}/images/004.jpg">
                </h3>
            </div>
        </div>
    </div>

    <br/>
    <hr style="height:2px;border:none;border-top:3px solid red;"/>

    <div class="row">
        <div class="col-md-4">
            <h3>
                <a href="#"><img src="${base}/images/016.png"/></a>
            </h3>
        </div>
        <div class="col-md-4">
            <h3>
                <a href="#"><img src="${base}/images/017.png"/></a>
            </h3>
        </div>
        <div class="col-md-4">
            <h3>
                <a href="#"><img src="${base}/images/018.png"/></a>
            </h3>
        </div>
    </div>
    <br/><br/><br/>
    <div class="row">
        <div class="col-md-12">
        </div>
    </div>
</div>
</div>
<script src="${base}/js/jquery.min.js"></script>
<script src="${base}/js/bootstrap.min.js"></script>
<script src="${base}/js/scripts.js"></script>
</body>
</html>
