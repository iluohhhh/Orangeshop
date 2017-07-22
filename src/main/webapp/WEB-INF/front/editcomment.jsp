<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/back/common.jsp" %>
<script src="${base }/js/jquery.min.js"></script>
<script src="${base }/js/bootstrap.min.js"></script>
<script src="${base }/js/scripts.js"></script>
<script type="text/javascript" src="${base}/js/jquery.form.js"></script>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 3, from LayoutIt!</title>

    <meta name="description"
          content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="${base }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base }/css/style.css" rel="stylesheet">

</head>
<script type="text/javascript">
    function uploadPic() {
        var options = {
            url: "${base}/upload/uploadPic.do",
            dataType: "json",
            type: "post",
            success: function (data) {
                $("#imgUrl").attr("src", data.url);
                $("#path").val(data.path);
            }
        }
        $("#jvForm").ajaxSubmit(options);
    }
</script>
<body>
<div class="container">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <br> <img alt="logo" src="image\048.jpg">

            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-8">
                        <br/> <br/>
                        <h5>欢迎来到盛唐文化！</h5>
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
        <hr style="height: 2px; border: none; border-top: 3px solid red;"/>
        <div class="row">
            <div class="col-md-12">
                <form action="${base }/order/saveComment.shtml" id="jvForm" method="post">
                    <!--  <div class="col-md-4">用于获取订单</div>-->
                    <div class="col-md-8">
                        <h3>图文评论：</h3>

                        <textarea name="contrnt" style="width: 366px; height: 200px;">请填写评论哦~</textarea>
                        <br> <br> <br>
                        <td width="20%" class="pn-flabel pn-flabel-h"></td>
                        <td width="80%" class="pn-fcontent" align="right"><img
                                width="100" height="100" id="imgUrl"/> <input type="hidden"
                                                                              name="imgUrl" id="path"/> <input
                                type="hidden"
                                value="${productNo }" name="pid"> <input type="hidden"
                                                                         value="${oid }" name="oid"> <input type="file"
                                                                                                            onchange="uploadPic()"
                                                                                                            name="pic"/>
                        </td>
                        <input type="submit"
                               class="submit" value="提交" align="right"/> &nbsp; <input
                            type="reset" class="reset" value="重置" align="right"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>