<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width:400px; padding:10px;">
    <form id="wu-form-2" method="post" action="${base}/order/update.do">
        <input type="hidden" value="${order.id}" name="id">
        <table>
            <tr>
                <td width="60" align="right">订单编号:</td>
                <td><textarea rows="6" name="oid" class="wu-text"
                              style="height: 50px;width: 320px">${order.oid}</textarea></td>
            </tr>
            <tr>
                <td width="60" align="right">订单状态:</td>
                <td width="100"><select name="state" style="width: 100%">
                    <option value="0" <c:if test="${order.state =='0'}">selected="selected"</c:if>>提交订单</option>
                    <option value="1" <c:if test="${order.state =='1'}">selected="selected"</c:if>>仓库配货</option>
                    <option value="2" <c:if test="${order.state =='2'}">selected="selected"</c:if>>商品出库</option>
                    <option value="3" <c:if test="${order.state =='3'}">selected="selected"</c:if>>等待收货</option>
                    <option value="4" <c:if test="${order.state =='4'}">selected="selected"</c:if>>完成</option>
                    <option value="5" <c:if test="${order.state =='5'}">selected="selected"</c:if>>待退货</option>
                    <option value="6" <c:if test="${order.state =='6'}">selected="selected"</c:if>>已退货</option>
                </select></td>
            </tr>
                <td valign="top" align="center"><input type="button" value="确定" onclick="dosubmit()"></td>
            </tr>
        </table>
    </form>
    <script>
        function dosubmit(){
            var options = {
                //提交的路径
                url:'${base}/order/update.do',
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
