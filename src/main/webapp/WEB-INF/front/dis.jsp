<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/back/common.jsp"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 3, from LayoutIt!</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

  </head>
  <body>
	<div class="container">
    <div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<br>
			<img alt="logo" src="image\048.jpg">

		</div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-8">
					<br/>
					<br/>
					<h5>
						欢迎来到盛唐文化！ 
					</h5>
					<br/>
					
					<!--搜索框-->
					<div class="input-group sou">
						<input type="text" class="form-control" placeholder="请输入关键字"/>
						<span class="input-group-btn">
							<button class="btn btn-primary" type="button">搜索</button>
						</span>

					</div>

					<br>
				</div>
			</div>
		</div>
	</div>
	<hr style="height:2px;border:none;border-top:3px solid red;" />
	<div class="row">
		<div class="col-md-12">
			<form action="">
				<div class="col-md-4">
                    <h3>订单打分：</h3>
                    <input type="text" value="请对我们的物流、质量、服务进行打分哦~"/>
				</div>
				<div class="col-md-8">
				<h3>
					图文评论：
				</h3>
				
						<textarea name="a" style="width:366px;height:200px;">请填写评论哦~</textarea><br><br><br>
										<td width="20%" class="pn-flabel pn-flabel-h"></td>
						<td width="80%" class="pn-fcontent"  align="right">
							<img width="100" height="100" id="allImgUrl"/>
							<input type="hidden" name="url" id="path"/>
							<input type="file" onchange="uploadPic()" name="pic"/>
						</td>
						<input type="submit" class="submit" value="提交"  align="right" /> &nbsp; <input type="reset" class="reset" value="重置"  align="right"/>
				</div>
			</form>
		</div>
	</div>
</div>
	</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>