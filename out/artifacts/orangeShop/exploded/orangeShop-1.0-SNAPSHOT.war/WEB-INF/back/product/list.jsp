<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <c:import url="../common.jsp"/>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div id="wu-dialog-2"></div>
    <!-- Begin of toolbar -->
    <div id="wu-toolbar-2">
        <div class="wu-toolbar-button">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openSku()" plain="true">库存管理</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit()" plain="true">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="remove()" plain="true">删除</a>
        </div>
        <div class="wu-toolbar-search">
            <label>商品名称：</label><input class="wu-text" style="width:100px" name="name">
            <label>商品编号：</label><input class="wu-text" style="width:100px" name="">
            <label>是否上架：</label>
            <select class="easyui-combobox" panelHeight="auto" style="width:100px" name="isShow">
                <option value="0">是</option>
                <option value="1">否</option>
            </select>
            <a href="#" class="easyui-linkbutton" iconCls="icon-search">开始检索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="wu-datagrid-2" class="easyui-datagrid" toolbar="#wu-toolbar-2"></table>
</div>
<!-- End of easyui-dialog -->
<script type="text/javascript">
    /**
     * Name 添加记录
     */
    function add(){
        $('#wu-form-2').form('submit', {
            url:'',
            success:function(data){
                if(data){
                    $.messager.alert('信息提示','提交成功！','info');
                    $('#wu-dialog-2').dialog('close');
                }
                else
                {
                    $.messager.alert('信息提示','提交失败！','info');
                }
            }
        });
    }

    /**
     * Name 修改记录
     */
    function edit(){
        $('#wu-form-2').form('submit', {
            url:'',
            success:function(data){
                if(data){
                    $.messager.alert('信息提示','提交成功！','info');
                    $('#wu-dialog-2').dialog('close');
                }
                else
                {
                    $.messager.alert('信息提示','提交失败！','info');
                }
            }
        });
    }

    /**
     * Name 删除记录
     */
    function remove(){
        $.messager.confirm('信息提示','确定要删除该记录？', function(result){
            if(result){
                var items = $('#wu-datagrid-2').datagrid('getSelections');
                var ids = [];
                $(items).each(function(){
                    ids.push(this.productid);
                });
                //alert(ids);return;
                $.ajax({
                    url:'',
                    data:'',
                    success:function(data){
                        if(data){
                            $.messager.alert('信息提示','删除成功！','info');
                        }
                        else
                        {
                            $.messager.alert('信息提示','删除失败！','info');
                        }
                    }
                });
            }
        });
    }

    /**
     * Name 打开添加窗口
     */
    function openSku(){
        $('#wu-dialog-2').dialog({
            closed: false,
            modal:true,
            width: 800,
            height:600,
            title: "修改信息",
            href:'${base}/sku/list.do',
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#wu-dialog-2').dialog('close');
                }
            }]
        });
        $('#dd').dialog('refresh', '${base}/sku/list.do');
    }

    /**
     * Name 打开修改窗口
     */
    function openEdit(){
        $('#wu-form-2').form('clear');
        var item = $('#wu-datagrid-2').datagrid('getSelected');
        //alert(item.productid);return;
        $.ajax({
            url:'',
            data:'',
            success:function(data){
                if(data){
                    $('#wu-dialog-2').dialog('close');
                }
                else{
                    //绑定值
                    $('#wu-form-2').form('load', data)
                }
            }
        });
        $('#wu-dialog-2').dialog({
            closed: false,
            modal:true,
            title: "修改信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#wu-dialog-2').dialog('close');
                }
            }]
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
        url:'${base}/product/page.do',
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
            { field:'no',title:'编号',width:100,sortable:true},
            { field:'name',title:'商品名称',width:200,sortable:true},
            { field:'weight',title:'商品重量',width:100},
            { field:'isNew',title:'是否新款',width:100,formatter : function(value, row, index) {
                if(value =='1'){
                    return "新款";
                }else if(value =='0'){
                    return "否";
                }
            }},
            { field:'isHot',title:'是否热卖',width:100,formatter : function(value, row, index) {
                if(value =='1'){
                    return "热卖";
                }else if(value =='0'){
                    return "否";
                }
            }},
            { field:'isShow',title:'是否上架',width:100,formatter : function(value, row, index) {
                if(value =='1'){
                    return "上架";
                }else if(value =='0'){
                    return "下架";
                }
            }}
        ]]
    });
</script>
</body>
</html>
