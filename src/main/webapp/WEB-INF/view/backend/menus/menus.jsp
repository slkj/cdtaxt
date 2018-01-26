<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单管理</title>
<%@ include file="/common/taglibs.jsp"%>

<script type="text/javascript">
	var $grid;
	$(function() {
		$grid = $('#listGrid');
		initGrid();
	});
	function initGrid() {
		$grid.treegrid({
			url : getContextPath() + '/module/list',
			loadMsg : '数据加载中....',
			fit : true,
			nowrap : true, //false:折行
			striped : true, //隔行变色
			// 			singleSelect : true, //单选
			checkOnSelect : true,
			idField : 'id',
			treeField : 'name',
			lines : true,
			animate : true,
			height : 450,
			columns : [ [ {
				field : 'name',
				title : '资源名称',
				width : 180
			}, {
				field : 'url',
				title : 'url'
			}, {
				field : 'icon',
				title : '图标'
			}, {
				field : 'description',
				title : '说明'
			}, {
				field : 'opt',
				title : '操作',
				width : 100,
				align : 'center',
				formatter : function(value, row) {
					var s = "";
					s += "<a href=\"javascript:void(0)\" onclick=\"editRow('" + row.id + "');\">编辑</a>";
					s += "|";
					s += "<a href=\"javascript:void(0)\" onclick=\"javaScript:deleteRow();\"> 删除 </a>";
					if (row.parent_id == "0") {
						return "";
					}
					return s;
				}
			} ] ],
			toolbar : [ {
				text : '新增',
				iconCls : 'icon-add',
				handler : function() {
					openRukuWin();
				}
			} ]
		});
	}
	/*弹出入库窗口*/
	function openRukuWin() {
		var url = getContextPath() + "/module/menusInfo";
		var dialog = createDialog({
			frameID : 'addComShow',
			title : '菜单信息',
			width : 400,
			height : 370,
			url : url,
			toolbar : [ {
				text : common016,
				iconCls : 'icon-save',
				handler : function() {
					var data = parent.document.getElementById('addComShow').contentWindow.save();
					$.ajax({
						cache : false,
						type : "POST",
						url : data.url,
						data : data.param,
						async : false,
						success : function(result) {
							if (result.success) {
								dialog.dialog("destroy");
								$grid.treegrid('reload'); // 重新载入所有行
							} else {
								showError(result.msg);
							}
						}
					});
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
	function deleteRow() {
		var node = $grid.treegrid('getSelected');
		if (node) {
			var nodes = $grid.treegrid('getChildren', node.id);
			if (nodes.length > 0) {
				alert("该项下包含内容不能执行删除操作！");
			} else if (confirm("确定要删除该菜单吗？")) {
				$.ajax({
					type : "POST",
					url : getContextPath() + '/module/delModule',
					data : {
						id : node.id
					},
					cache : false,
					async : false,
					success : function(data) {
						$grid.treegrid('reload');
					}
				});
			}
		}
	}
	function editRow(id) {
		var url = getContextPath() + "/module/menusInfo?pkey="+id;
		var dialog = createDialog({
			frameID : 'addComShow',
			title : '菜单信息',
			width : 400,
			height : 370,
			url : url,
			toolbar : [ {
				text : common016,
				iconCls : 'icon-save',
				handler : function() {
					var data = parent.document.getElementById('addComShow').contentWindow.save();
					$.ajax({
						cache : false,
						type : "POST",
						url : data.url,
						data : data.param,
						async : false,
						success : function(result) {
							if (result.success) {
								dialog.dialog("destroy");
								$grid.treegrid('reload'); // 重新载入所有行
							} else {
								showError(result.msg);
							}
						}
					});
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
<body>
	<table id="listGrid"></table>
</body>
</html>