<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/back/common.jsp"%>
<html>
<head>
    <title>商品添加</title>
</head>
<style type="">
    .h2_ch a:hover, .h2_ch a.here {
        color: #FFF;
        font-weight: bold;
        background-position: 0px -32px;
    }
    .h2_ch a {
        float: left;
        height: 32px;
        margin-right: -1px;
        padding: 0px 16px;
        line-height: 32px;
        font-size: 14px;
        font-weight: normal;
        border: 1px solid #C5C5C5;
        background: url('/images/bg_ch.gif') repeat-x scroll 0% 0% transparent;
    }
    a {
        color: #06C;
        text-decoration: none;
    }
    .pn-ftable{background-color:#B4CFCF;margin-top:5px;}
    .body-box{width:99%;margin:0px auto;margin-right:auto;}
    .pn-fcontent{background-color:#FFFFFF;padding-left:5px;}
    .pn-fbutton{background-color:#FFFFFF;text-align:center;}
    .pn-flabel{background-color:#e6f2fe;text-align:right;padding-right:3px; color:#000;}
    .pn-flabel-h{height:27px;}
</style>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
    $(function () {
        var tObj;
        $("#tabs a").each(function(){
            if($(this).attr("class").indexOf("here") == 0){tObj = $(this)}
            $(this).click(function(){
                var c = $(this).attr("class");
                if(c.indexOf("here") == 0){return;}
                var ref = $(this).attr("ref");
                var ref_t = tObj.attr("ref");
                tObj.attr("class","nor");
                $(this).attr("class","here");
                $(ref_t).hide();
                $(ref).show();
                tObj = $(this);
                if(ref == '#tab_2'){
                    var fck = new FCKeditor("productdesc");
                    fck.BasePath = "/fckeditor/";
                    fck.Height = 400 ;
                    fck.Config["ImageUploadURL"] = "${base}/upload/uploadFck.do";
                    fck.ReplaceTextarea();
                }
            });
        });
    })
    //使用Jquery.form进行异步提交，上传图片
    function uploadPic(){
        var options = {
            //图片上传的路径
            url:'${base}/upload/uploadPic.do',
            //ajax异步提交的方式
            type:'post',
            //提交的数据格式
            dataType:'json',
            //上传成功的回调函数
            success:function(data){
                $("#allImgUrl").attr("src",data.url);
                $("#path").val(data.path);
            }
        }
        //jquery.form使用方式
        $("#jvForm").ajaxSubmit(options);
    }
</script>
<body>
<h2 class="h2_ch">
	<span id="tabs">
<a href="javascript:void(0);" ref="#tab_1" title="基本信息" class="here">基本信息</a>
<a href="javascript:void(0);" ref="#tab_2" title="商品描述" class="nor">商品描述</a>
<a href="javascript:void(3);" ref="#tab_3" title="商品参数" class="nor">包装清单</a>
	</span>
</h2>
<div class="body-box" style="float:right">
    <form id="jvForm" action="${base}/product/add.do" method="post" enctype="multipart/form-data">
        <table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
            <tbody id="tab_1">
            <tr>
                <td width="20%" class="pn-flabel pn-flabel-h">
                    <span class="pn-frequired">*</span>
                    商品类型:</td><td width="80%" class="pn-fcontent">
                <select name="typeId">
                    <option value="">请选择</option>
                    <c:forEach items="${types }" var="type">
                        <option value="${type.id }">${type.name }</option>
                    </c:forEach>
                </select>
            </td>
            </tr>
            <tr>
                <td width="20%" class="pn-flabel pn-flabel-h">
                    <span class="pn-frequired">*</span>
                    商品名称:</td><td width="80%" class="pn-fcontent">
                <input type="text" class="required" name="name" maxlength="100" size="100"/>
            </td>
            </tr>
            <tr>
                <td width="20%" class="pn-flabel pn-flabel-h">
                    商品品牌:</td><td width="80%" class="pn-fcontent">
                <select name="brandId">
                    <option value="">请选择品牌</option>
                    <c:forEach items="${brands }" var="brand">
                        <option value="${brand.id }">${brand.name }</option>
                    </c:forEach>
                </select>
            </td>
            </tr>
            <tr>
                <td width="20%" class="pn-flabel pn-flabel-h">
                    商品毛重:</td><td width="80%" class="pn-fcontent">
                <input type="text" value="0.6" class="required" name="weight" maxlength="10"/>KG
            </td>
            </tr>
            <tr>
                <td width="20%" class="pn-flabel pn-flabel-h">
                    材质:</td><td width="80%" class="pn-fcontent">
                <c:forEach items="${features }" var="feature">
                    <input type="checkbox" value="${feature.id }" name="feature"/>${feature.name }
                </c:forEach>
            </td>
            </tr>
            <tr>
                <td width="20%" class="pn-flabel pn-flabel-h">
                    <span class="pn-frequired">*</span>
                    颜色:</td><td width="80%" class="pn-fcontent">
                <c:forEach items="${colors }" var="color">
                    <input type="checkbox" value="${color.id }" name="color"/>${color.name }
                </c:forEach>
            </td>
            </tr>
            <tr>
                <td width="20%" class="pn-flabel pn-flabel-h">
                    <span class="pn-frequired">*</span>
                    尺码:</td><td width="80%" class="pn-fcontent">
                <input type="checkbox" name="size" value="S"/>S
                <input type="checkbox" name="size" value="M"/>M
                <input type="checkbox" name="size" value="L"/>L
                <input type="checkbox" name="size" value="XL"/>XL
                <input type="checkbox" name="size" value="XXL"/>XXL
            </td>
            </tr>
            <tr>
                <td width="20%" class="pn-flabel pn-flabel-h">
                    状态:</td><td width="80%" class="pn-fcontent">
                <input type="checkbox" name="isNew" value="1"/>新品
                <input type="checkbox" name="isCommend" value="1"/>推荐
                <input type="checkbox" name="isHot" value="1"/>热卖
            </td>
            </tr>
            <tr>
                <td width="20%" class="pn-flabel pn-flabel-h">
                    <span class="pn-frequired">*</span>
                    上传商品图片(90x150尺寸):</td>
                <td width="80%" class="pn-fcontent">
                    注:该尺寸图片必须为90x150。
                </td>
            </tr>
            <tr>
                <td width="20%" class="pn-flabel pn-flabel-h"></td>
                <td width="80%" class="pn-fcontent">
                    <img width="100" height="100" id="allImgUrl"/>
                    <input type="hidden" name="url" id="path"/>
                    <input type="hidden" value="${result}" id="result"/>
                    <input type="file" onchange="uploadPic()" name="pic"/>
                </td>
            </tr>
            </tbody>
            <tbody id="tab_2" style="display: none">
            <tr>
                <td >
                    <textarea rows="10" cols="10" id="productdesc" name="description"></textarea>
                </td>
            </tr>
            </tbody>
            <tbody id="tab_3" style="display: none">
            <tr>
                <td >
                    <textarea rows="15" cols="136" id="productList" name="packageList"></textarea>
                </td>
            </tr>
            </tbody>
            <tbody>
            <tr>
                <td class="pn-fbutton" colspan="2">
                    <input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
</body>
</html>
