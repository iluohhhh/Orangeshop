<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width:400px; padding:10px;">
    <form id="wu-form-2" method="post" action="${base}/product/update.do">
        <input type="hidden" value="${product.id}" name="id">
        <table>
            <tr>
                <td width="60" align="right">商品名称:</td>
                <td><textarea rows="6" name="name" class="wu-text"
                              style="height: 50px;width: 320px">${product.name}</textarea></td>
            </tr>
            <tr>
                <td width="60" align="right">是否新款:</td>
                <td width="100"><select name="isNew" style="width: 100%">
                    <option value="1" <c:if test="${product.isNew =='1'}">selected="selected"</c:if>>是</option>
                    <option value="0" <c:if test="${product.isNew =='0'}">selected="selected"</c:if>>否</option>
                </select></td>
            </tr>
            <tr>
                <td width="60" align="right">是否热卖:</td>
                <td width="100"><select name="isHot" style="width: 100%">
                    <option value="1" <c:if test="${product.isHot =='1'}">selected="selected"</c:if>>是</option>
                    <option value="0" <c:if test="${product.isHot =='0'}">selected="selected"</c:if>>否</option>
                </select></td>
            </tr>
            <tr>
                <td valign="top" align="right">商品重量:</td>
                <td><input name="weight" value="${product.weight}">kg</td>
            </tr>
            <tr>
                <td valign="top" align="center"><input type="button" value="确定" onclick="dosubmit()"></td>
            </tr>
        </table>
    </form>
    <script>
        function dosubmit(){
            var options = {
                //提交的路径
                url:'${base}/product/update.do',
                //ajax异步提交的方式
                type:'post',
                //提交的数据格式
                dataType:'json',
                //上传成功的回调函数
                success:function(data){
                    top.closeDialog();
                }
            }
            //jquery.form使用方式
            $("#wu-form-2").ajaxSubmit(options);
        }
    </script>
</div>
</body>
</html>
