<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="../common.jsp"%>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
    <!-- End of toolbar -->
    <table id="skuDatagrid" class="easyui-datagrid"></table>
<!-- End of easyui-dialog -->
<script type="text/javascript">

    function getSelected() {
        var checkItems = $("#skuDatagrid").datagrid("getChecked");
        var ids = [];
        $.each(checkItems,function(index,item){
            ids.push(item.id);
        });
        return ids;
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

    function getRowIndex(target){
        var tr = $(target).closest('tr.datagrid-row');
        return parseInt(tr.attr('datagrid-row-index'));
    }
    function editrow(target){
        $('#skuDatagrid').datagrid('beginEdit', getRowIndex(target));
    }
    function saverow(target){
        $('#skuDatagrid').datagrid('endEdit', getRowIndex(target));
        var row = $("#skuDatagrid").datagrid('getSelected');
        if(row){
            $.post(
                "${base}/sku/update.do",
                {"id":row.id,"skuPrice":row.skuPrice,"marketPrice":row.marketPrice,
                    "stockInventory":row.stockInventory,"skuUpperLimit":row.skuUpperLimit
                },
                function (data) {

                },"post"
            );
        }
    }

    /**
     * Name 载入数据
     */
    $('#skuDatagrid').datagrid({
        url:'${base}/sku/page.do?id='+${id},
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
            { field:'size',title:'尺码',width:100,sortable:true},
            { field:'skuPrice',title:'售价',width:200,sortable:true,editor:{
                type:'text'
            }},
            { field:'marketPrice',title:'市场价',width:100,editor:{
                type:'text'
            }},
            { field:'stockInventory',title:'库存',width:100,editor:{
                type:'text'
            }},{field:'colorName',title:'颜色',width:100,formatter : function(value, row, index) {
                    return row.color.name;
            }},{ field:'skuUpperLimit',title:'购买限制',width:200,sortable:true,editor:{
                type:'text'
            }},
            {
                field : 'opt1',
                title : '操作',
                width : 120,
                formatter : function(value, row, index) {
                    return "<a href='javascript:void(0)' onclick='editrow(this)'>修改</a>" +
                        "&emsp;"+"<a href='javascript:void(0)' onclick='saverow(this)'>保存</a>"
                }
            }
        ]]
    });
</script>
</body>
</html>

