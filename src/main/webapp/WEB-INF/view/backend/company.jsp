<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>承德市出租汽车管理系统</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" language="javascript">
	var $grid;
	$(function() {
		$grid = $("#list_data");
		initGrid();

	});
	function initGrid() {
		$grid.datagrid({
			url : '../company/list',
			title : '运营企业列表', //列表的标题
			iconCls : 'icon-site',
			striped : true,
			nowrap : false,
			fit : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			pageSize : 50,
			pageList : [ 10, 20, 30, 40, 50, 100 ],
			columns : [ [ {
// 				field : 'status',
// 				title : '状态',
// 				align : 'center',
// 				width : 80,
// 				formatter : function(value, row, index) {
// 					var a = "";
// 					if (value == 1) {
// 						a = '启用';
// 					} else if (value == 0) {
// 						a = '禁用';
// 					}
// 					return a;
// 				}
// 			}, {
				field : 'compCode',
				title : '企业编号',
				width : 100
			}, {
				field : 'compName',
				title : '企业名称',
				width : 300
			}, {
				field : 'linkman',
				title : '联系人',
				width : 120
			}, {
				field : 'mobile',
				title : '联系电话',
				width : 120
			}, {
				field : 'email',
				title : 'Email',
				width : 120
			}, {
				field : 'qq',
				title : 'QQ',
				width : 120
			} ] ],
			toolbar : [ {
				iconCls : 'icon-add',
				text : '添加',
				handler : function() {
					showAdd();
				}
			}, '-', {
				iconCls : 'icon-edit',
				text : '编辑',
				handler : function() {
					var rows = getSelectRows($grid);
					if (rows) {
						if (rows.length == 1) {
							editShow(rows[0]);
						} else {
							showError(common018);
						}
					}
				}
			} ]
		});
	}
	function showAdd() {
		var url = getContextPath() + "/company/comAddPage";
		var dialog = createDialog({
			frameID : 'addComShow',
			title : '添加用户',
			width : 600,
			height : 400,
			url : url,
			toolbar : [ {
				text : common016,
				iconCls : 'icon-save',
				handler : function() {
					var data = parent.document.getElementById('addComShow').contentWindow.save();
					$.ajax({
						type : "post",
						dataType : "json",
						url : data.url,
						data : data.param,
						async : true,
						success : function(result) {
							if (result.success) {
								dialog.dialog("destroy");
								$grid.datagrid("reload");
							} else {
								showError(result.msg);
							}
						}
					})
				}
			}, '-', {
				text : common009,
				iconCls : 'icon-cancel',
				handler : function() {
					dialog.dialog("destroy");
				}
			} ]
		});
	}

	function editShow(row) {
		var url = getContextPath() + "/company/comEditPage?pkey="+row.id;
		var dialog = createDialog({
			frameID : 'addComShow',
			title : '添加用户',
			width : 600,
			height : 400,
			url : url,
			toolbar : [ {
				text : common016,
				iconCls : 'icon-save',
				handler : function() {
					var data = parent.document.getElementById('addComShow').contentWindow.save();
					$.ajax({
						type : "post",
						dataType : "json",
						url : data.url,
						data : data.param,
						async : true,
						success : function(result) {
							if (result.success) {
								dialog.dialog("destroy");
								$grid.datagrid("reload");
							} else {
								showError(result.msg);
							}
						}
					})
				}
			}, '-', {
				text : common009,
				iconCls : 'icon-cancel',
				handler : function() {
					dialog.dialog("destroy");
				}
			} ]
		});
	}

	function query() {
		var data = serializeObject($('#searchForm'));
		$grid.datagrid('load', data);
	}
</script>
</head>
<body class="easyui-layout" data-options="border:false, fit:true">
	<div id="divQuery" data-options="region:'north',border:false" style="height: 60px">
		<div class='input_search '>
			<form id="searchForm">
				企业名称：
				<input name="compName" type="text" class="easyui-textbox" style="height: 26px" />
				<a href="#" onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search'"> 查 询 </a>
			</form>
		</div>
	</div>
	<div data-options="region:'center',border:true">
		<table id="list_data"></table>
	</div>
</body>
</html>
