<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <c:set value="${pageContext.request.contextPath}" var="base"/>
    <title>Bootstrap 3, from LayoutIt!</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">
    <script src="http://cdn.bootcss.com/jquery/3.0.0/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script language="javascript" src="${base}/js/JS.js"></script>
    <link href="${base}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base}/css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">


</head>
<script>
    function detail(id) {
        window.location='${base}/product/detail.shtml?id='+id
    }
</script>
<body>
<div class="container">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="btn-group">

                </div>
                <img alt="logo" src="${base}/images/048.jpg">
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

                <br/>
                <br/>
                <br/>
            </div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-8">
                        <h5>
                            欢迎来到盛唐文化-图书-文学类！
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
                                    <a href="order.html">我的订单</a>
                                </li>

                                <li>
                                    <a href="#">我的余额</a>
                                </li>
                                <li>
                                    <a href="shopcar.html">我的购物车</a>
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
                <div class="input-group  sou">
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
                    </tbody>
                </table>

                <div id="circleContent" class="carousel slide">
                    <ol class="carousel-indicators">
                        <li data-target="#circleContent" data-slide-to="0" class="active"></li>
                        <li data-target="#circleContent" data-slide-to="1"></li>
                        <li data-target="#circleContent" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="${base}/images/009.jpg">
                            <div class="carousel-caption"></div>
                        </div>
                        <div class="item">
                            <img src="${base}/images/019.jpg">
                            <div class="carousel-caption"></div>
                        </div>
                        <div class="item">
                            <img src="${base}/images/020.jpg">
                            <div class="carousel-caption"></div>
                        </div>
                    </div>
                    <a class="carousel-control left" href="#circleContent" data-slide="prevent">‹</a>
                    <a class="carousel-control right" href="#circleContent" data-slide="next">›</a>
                </div>
                <br/><br/>


            </div>
        </div>
        <br/><br/>
        <hr style="height:2px;border:none;border-top:3px solid red;"/>
        <div class="container">

            <ul class="list-unstyled">
                <c:forEach var="product" items="${productList}">
                    <li>
                        <div class="row">
                            <div class="col-md-2">
                                <img src="${product.img.allUrl}" style="height: 120px;width: 130px">
                            </div>
                            <div class="col-md-10">
                                <a href="javascript:void(0)">${product.name}</a><br/>
                                <a href="javascript:void(0)" class="btn btn-danger" role="button" onclick="detail(${product.id})">详情</a>&nbsp &nbsp
                            </div>
                        </div>

                    </li>
                </c:forEach>

            </ul>
        </div>

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
