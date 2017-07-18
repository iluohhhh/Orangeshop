<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>盛唐文化_用户中心</title>
    <c:set var="base" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${base}/css/style.css"/>
    <script src="${base}/js/jquery.js"></script>
    <script src="${base}/js/com.js"></script>
</head>
<body>
<div class="bar">
    <div class="bar_w">
        <p class="l">
		<span class="l">
			收藏本网站！北京<a href="#" title="更换">[更换]</a>
		</span>
        </p>
        <ul class="r uls">
            <li class="dev">您好,欢迎来到盛唐文化网！</li>
            <c:if test="${sessionScope.get('buyer_session') != null}"><li class="dev">欢迎！${sessionScope.get('buyer_session').username}</li></c:if>
            <li class="dev"><a href="#" title="退出">[退出]</a></li>
            <li class="dev"><a href="#" title="在线客服">在线客服</a></li>
            <li class="dev after"><a href="#" title="English">English</a></li>
        </ul>
    </div>
</div>
<div class="w loc">
    <div class="h-title">
        <div class="h-logo"><a href="http://localhost:8080"><img src="${base}/images/048.png"/></a></div>
        <div class="h-search">
            <input type="text"/>
            <div class="h-se-btn"><a href="#">搜索</a></div>
        </div>
    </div>
</div>

<div class="w mt ofc">
    <div class="r wr profile"><br><br><br>
        <h2 class="h2 h2_filter"><em style="color:red">全部订单</em></h2><br><br><br>
        <table cellspacing="0" summary="" class="tab tab4">
            <thead>
            <tr>
                <th width="12%">订单编号</th>
                <th>商品名称</th>
                <th width="10%">总金额（元）</th>
                <th width="10%">下单时间</th>
                <th width="10%">订单状态</th>
                <th width="10%">操作</th>
                <th width="10%">订单评论</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orders}">
                <c:forEach items="${order.details}" var="detail">
                <tr class="over">
                    <td><a href="#" title="H7859454">${order.oid}</a></td>
                    <td class="nwp pic">
                        <ul class="uls">
                            <li>
                                <dl>
                                    <dt><a href="#" title="${detail.product.name}">${detail.product.name}</a></dt>
                                </dl>
                            </li>
                        </ul>
                    </td>
                    <td>${order.totalPrice}</td>
                    <td>${order.createDate}</td>
                    <td>${order.stateName}<br/></td>
                </tr>
                </c:forEach>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="mode">
    <div class="tl"></div>
    <div class="tr"></div>
    <ul class="uls">
        <li class="first">
            <span class="guide"></span>
            <dl>
                <dt title="购物指南">购物指南</dt>
                <dd><a href="#" title="购物流程">购物流程</a></dd>
                <dd><a href="#" title="购物流程">购物流程</a></dd>
                <dd><a href="#" target="_blank" title="联系客服">联系客服</a></dd>
                <dd><a href="#" target="_blank" title="联系客服">联系客服</a></dd>
            </dl>
        </li>
        <li>
            <span class="way"></span>
            <dl>
                <dt title="支付方式">支付方式</dt>
                <dd><a href="#" title="货到付款">货到付款</a></dd>
                <dd><a href="#" title="在线支付">在线支付</a></dd>
                <dd><a href="#" title="分期付款">分期付款</a></dd>
                <dd><a href="#" title="分期付款">分期付款</a></dd>
            </dl>
        </li>
        <li>
            <span class="help"></span>
            <dl>
                <dt title="配送方式">配送方式</dt>
                <dd><a href="#" title="上门自提">上门自提</a></dd>
                <dd><a href="#" title="上门自提">上门自提</a></dd>
                <dd><a href="#" title="上门自提">上门自提</a></dd>
                <dd><a href="#" title="上门自提">上门自提</a></dd>
            </dl>
        </li>
        <li>
            <span class="service"></span>
            <dl>
                <dt title="售后服务">售后服务</dt>
                <dd><a href="#" target="_blank" title="售后策略">售后策略</a></dd>
                <dd><a href="#" target="_blank" title="售后策略">售后策略</a></dd>
                <dd><a href="#" target="_blank" title="售后策略">售后策略</a></dd>
                <dd><a href="#" target="_blank" title="售后策略">售后策略</a></dd>
            </dl>
        </li>
        <li>
            <span class="problem"></span>
            <dl>
                <dt title="特色服务">特色服务</dt>
                <dd><a href="#" target="_blank" title="夺宝岛">夺宝岛</a></dd>
                <dd><a href="#" target="_blank" title="夺宝岛">夺宝岛</a></dd>
                <dd><a href="#" target="_blank" title="夺宝岛">夺宝岛</a></dd>
                <dd><a href="#" target="_blank" title="夺宝岛">夺宝岛</a></dd>
            </dl>
        </li>
    </ul>
</div>
</body>
</html>
