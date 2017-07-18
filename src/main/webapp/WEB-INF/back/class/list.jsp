<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="../common.jsp"%>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div id="wu-dialog-2"></div>
    <div class="wu-toolbar-button">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="true">添加</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="remove()" plain="true">删除</a>
    </div>
    <!-- Begin of toolbar -->
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" class="easyui-datagrid" toolbar="#wu-toolbar-2"></table>
</div>
<!-- End of easyui-dialog -->
<script type="text/javascript">

    /**
     * Name 删除记录
     */
    function remove(){
        $.messager.confirm('信息提示','确定要删除该记录？', function(result){
            if(result){
                var items = $('#wu-datagrid-2').datagrid('getChecked');
                var ids = [];
                $(items).each(function(){
                    ids.push(this.id);
                });
               $.ajax({
                   url:'${base}/type/delete.do',
                   type:'post',
                   data:'ids='+ids,
                   success:function(data){
                       if(data){
                           $('#wu-datagrid-2').datagrid('reload');
                           $.messager.alert('信息提示','删除成功！','info');
                       }
                       else
                       {
                           $.messager.alert('信息提示','删除失败！','info');
                           $('#wu-datagrid-2').datagrid('reload');
                       }
                   }
               })
            }
        });
    }

    /**
     * Name 打开添加窗口
     */
    function openAdd(){
        $('#wu-form-2').form('clear');
        $('#wu-dialog-2').dialog({
            closed: false,
            modal:true,
            width: 500,
            height:300,
            title: "添加类别",
            href:'${base}/type/toAdd.do',
            buttons: [ {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#wu-dialog-2').dialog('close');
                    $('#wu-datagrid-2').datagrid('reload');
                }
            }]
        });
    }

    /**
     * Name 打开修改窗口
     */
    function openEdit(){
        $('#wu-form-2').form('clear');
        var item = $('#wu-datagrid-2').datagrid('getSelected');
        $('#wu-dialog-2').dialog({
            closed: false,
            modal:true,
            title: "类别修改",
            width: 500,
            height:300,
            href:'${base}/type/toEdit.do?id='+item.id,
        });
    }

    /**
     * Name 分页过滤器
     */
    function pagerFilter(data){
        if (typeof data.length == 'number' && typeof data.splice == 'function'){// is array
            data = {
                total: data.length,
                rows: data
            }
        }
        var dg = $(this);
        var opts = dg.datagrid('options');
        var pager = dg.datagrid('getPager');
        pager.pagination({
            onSelectPage:function(pageNum, pageSize){
                opts.pageNumber = pageNum;
                opts.pageSize = pageSize;
                pager.pagination('refresh',{pageNumber:pageNum,pageSize:pageSize});
                dg.datagrid('loadData',data);
            }
        });
        if (!data.originalRows){
            data.originalRows = (data.rows);
        }
        var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
        var end = start + parseInt(opts.pageSize);
        data.rows = (data.originalRows.slice(start, end));
        return data;
    }

    /**
     * Name 载入数据
     */
    $('#wu-datagrid-2').datagrid({
        url:'${base}/type/page.do',
//        loadFilter:pagerFilter,
        rownumbers:true,
        singleSelect:false,
        pageSize:20,
        pagination:true,
        multiSort:true,
        fitColumns:true,
        fit:true,
        columns:[[
            { checkbox:true},
            { field:'id',title:'编号',width:200,sortable:true},
            { field:'name',title:'分类名称',width:200,sortable:true},
            { field:'parentId',title:'上一級',width:100}
        ]]
    });
</script>
</body>
</html>
