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
    <!-- Begin of toolbar -->
    <div id="wu-toolbar-2">
        <div class="wu-toolbar-button">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openSku()" plain="true">库存管理</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit()" plain="true">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="upShow()" plain="true">上架</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="downShow()" plain="true">下架</a>
        </div>
        <div class="wu-toolbar-search">
            <form id="jvForm">
            <label>商品名称：</label><input class="wu-text" style="width:400px;height: 20px" name="name" value="${name}">
            <label>商品编号：</label><input class="wu-text" style="width:200px;height: 20px" name="no" value="${no}">
            <label>是否上架：</label>
            <select class="easyui-combobox" panelHeight="auto" style="width:80px;height: 20px" name="isShow">
                <option value="0" <c:if test="${isShow == 0}">selected="selected"</c:if>>否</option>
                <option value="1" <c:if test="${isShow == 1}">selected="selected"</c:if>>是</option>
            </select>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" id="search" onclick="searchProduct()">开始检索</a>
            </form>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="datagrid" class="easyui-datagrid" toolbar="#wu-toolbar-2"></table>
</div>
<!-- End of easyui-dialog -->
<script type="text/javascript">

    function searchProduct() {
        var formdata = $("#jvForm").serializeJson();
        $('#datagrid').datagrid('load',formdata);
    }

    function getSelected() {
       var checkItems = $("#datagrid").datagrid("getChecked");
       var ids = [];
       $.each(checkItems,function(index,item){
           ids.push(item.id);
       });
       return ids;
    }

    function upShow(){
        var checkItems = $("#datagrid").datagrid("getChecked");
        var ids=",";
        $.each(checkItems,function(index,item){
            ids+=item.id+",";
        });

        $.post(
            "${base}/product/isShow.do",{"ids":ids,"isShow":1},function(data){
                searchProduct();
            }
        );
    }

    function downShow(){

        var checkItems = $("#datagrid").datagrid("getChecked");
        var ids=",";
        $.each(checkItems,function(index,item){
            ids+=item.id+",";
        });

        $.post(
            "${base}/product/isShow.do",{"isShow":0,"ids":ids},function(data){
                searchProduct();
            },"json"
        );
    }

    /**
     * Name 打开添加窗口
     */
    function openSku(){
        var checkItems = $("#datagrid").datagrid("getChecked");
        var ids = [];
        $.each(checkItems,function(index,item){
            ids.push(item.id);
        });
        if(ids.length > 1){
            $.messager.alert("Warning","只能选择一个！");
            return;
        }else{
        $('#wu-dialog-2').dialog({
            closed: false,
            modal:true,
            width: 800,
            height:600,
            title: "库存管理",
            href:'${base}/sku/list.do?id='+ids,
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: function () {
                    $('#wu-dialog-2').dialog('close');
                }
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#wu-dialog-2').dialog('close');
                    $('#datagrid').datagrid('reload');
                }
            }]
        });
        <%--$('#dd').dialog('refresh', '${base}/sku/list.do');--%>
        return;
    }
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
    $('#datagrid').datagrid({
        url:'${base}/product/page.do',
//        loadFilter:pagerFilter,
        rownumbers:true,
        singleSelect:false,
        pageSize:20,
        pagination:true,
        multiSort:true,
        fitColumns:true,
        fit:true,
        idField:'id',
        columns:[[
            { checkbox:true},
            { field:'no',title:'编号',width:100,sortable:true},
            { field:'name',title:'商品名称',width:400,sortable:true},
            { field:'weight',title:'商品重量',width:50},
            { field:'isNew',title:'是否新款',width:50,formatter : function(value, row, index) {
                if(value =='1'){
                    return "新款";
                }else if(value =='0'){
                    return "否";
                }
            }},
            { field:'isHot',title:'是否热卖',width:50,formatter : function(value, row, index) {
                if(value =='1'){
                    return "热卖";
                }else if(value =='0'){
                    return "否";
                }
            }},
            { field:'isShow',title:'是否上架',width:50,formatter : function(value, row, index) {
                if(value =='1'){
                    return "上架";
                }else if(value =='0'){
                    return "下架";
                }
            }}
        ]]
    });

    /**
     * Name 打开修改窗口
     */
    function openEdit(){
        $('#wu-form-2').form('clear');
        var item = $('#datagrid').datagrid('getSelected');
        $('#wu-dialog-2').dialog({
            closed: false,
            modal:true,
            title: "商品修改",
            width: 500,
            height:300,
            href:'${base}/product/toEdit.do?id='+item.id,
        });
    }
    function closeDialog() {
        $('#datagrid').datagrid('reload');
        $('#wu-dialog-2').dialog('close');
    }
    //将表单数据转化为json，百度荡的
    (function($){
        $.fn.serializeJson=function(){
            var serializeObj={};
            var array=this.serializeArray();
            var str=this.serialize();
            $(array).each(function(){
                if(serializeObj[this.name]){
                    if($.isArray(serializeObj[this.name])){
                        serializeObj[this.name].push(this.value);
                    }else{
                        serializeObj[this.name]=[serializeObj[this.name],this.value];
                    }
                }else{
                    serializeObj[this.name]=this.value;
                }
            });
            return serializeObj;
        };
    })(jQuery);
</script>
</body>
</html>
