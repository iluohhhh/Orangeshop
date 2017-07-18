<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <c:set var="base" value="${pageContext.request.contextPath}"></c:set>
    <title>Title</title>
</head>
<body>
<div style="width:400px; padding:10px;">
    <form id="wu-form-2" method="post" action="${base}/type/add.do">
        <table>
            <tr>
                <td width="60" align="right">类别名称:</td>
                <td><textarea rows="6" name="name" class="wu-text"
                              style="height: 50px;width: 320px"></textarea></td>
            </tr>
            <tr>
                <td width="60" align="right">父类别:</td>
                <td width="100"><select name="parentId" style="width: 100%">
                    <c:forEach items="${types}" var="type">
                        <option value="${type.id}">${type.name}</option>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <td valign="top" align="right">备注:</td>
                <td><textarea rows="6" name="note" class="wu-text"
                              style="height: 50px;width: 320px"></textarea></td>
            </tr>
            <tr>
                <td valign="top" align="center"><input type="button" value="确定" onclick="dosubmit()"></td>
            </tr>
        </table>
    </form>
    <script>
        function dosubmit() {
            var options = {
                //提交的路径
                url: '${base}/type/add.do',
                //ajax异步提交的方式
                type: 'post',
                //提交的数据格式
                dataType: 'json',
                //上传成功的回调函数
                success: function (data) {
                    $.messager.alert('信息提示', data.data, 'info');
                    $('#wu-dialog-2').dialog('close');
                    $('#wu-datagrid-2').datagrid('reload');
                }
            }
            //jquery.form使用方式
            $("#wu-form-2").ajaxSubmit(options);
        }
    </script>
</div>
</body>
</html>
