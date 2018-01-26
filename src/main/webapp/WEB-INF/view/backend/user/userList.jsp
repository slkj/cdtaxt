<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	var $grid;
	var curUserComCode;
	$(function() {
		$grid = $("#list_data");
		initGrid();

	});
	function initGrid() {
		//datagrid初始化 
		$grid.datagrid({
			url : '../user/list',
			title : '用户列表',
			striped : true,
			nowrap : false,
			fit : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			pageSize : 50,
			pageList : [ 10, 20, 30, 40, 50, 100 ],
			columns : [ [ {
				title : '状态',
				field : 'status',
				formatter : function(value, rec) {
					return value == 'enabled' ? '启用' : '<span style="color:red">禁用</span>';
				}
			}, {
				title : '用户名',
				field : 'username',
				width : 100
			},

			{
				title : '姓名',
				field : 'realname',
				width : 150
			}, {
				title : '联系方式',
				field : 'phone'
			}, {
				field : 'sex',
				title : '性别',
				formatter : function(value) {
					if (value == "1") {
						return "男";
					} else {
						return "女";
					}

				}
			} ] ],
			toolbar : [ {
				iconCls : 'icon-add',
				text : '添加',
				handler : function() {
					showAdd();
				}
			}, '-', {
				iconCls : 'fa fa-unlink',
				text : '禁用',
				handler : function() {
					edit();
				}
			}, '-', {
				iconCls : 'fa fa-file-excel-o',
				text : '导出',
				handler : function() {
					exportData();
				}
			} ],
			onLoadSuccess : function(data) {
				if (data && data.rows && data.rows.length > 0) {
					$grid.datagrid("clearSelections");
				} else {
					$grid.datagrid("clearSelections");
				}
			}

		});
	}

	function showAdd() {
		var url = getContextPath() + "/user/userAddPage";
		var dialog = createDialog({
			frameID : 'addUserShow',
			title : '添加用户',
			width : 550,
			height : 400,
			url : url,
			toolbar : [ {
				text : common016,
				iconCls : 'icon-save',
				handler : function() {
					var data = parent.document.getElementById('addUserShow').contentWindow.save();
					$.post(data.url, data.param, function(result) {
						if (result.success) {
							dialog.dialog("destroy");
							$grid.datagrid("reload");
						} else {
							showError(result.msg);
						}
					}, 'json');
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
</script>
</head>
<body class="easyui-layout">

	<div data-options="region:'north',border:false,title:'查询条件'" style="height: 85px">
		<div id="divQuery" data-options="region:'north',border:false" style="height: 85px">
			<div class='input_search '>
				<form id="searchForm">
					账号：
					<input name="compName" type="text" class="easyui-textbox" style="height: 26px" />
					<a href="#" onclick="query()" class="easyui-linkbutton" data-options="iconCls:'icon-search'"> 查 询 </a>
				</form>
			</div>
		</div>
	</div>
	<div data-options="region:'center',border:true">
		<table id=list_data data-options="fit:true,border:false"></table>
	</div>
</body>
</html>