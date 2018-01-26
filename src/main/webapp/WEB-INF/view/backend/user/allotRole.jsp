<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>天津陶瓷网络商城</title>
<!-- 	引入通用js css -->

<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	var grid;
	var mid;
	var Request = new Object();
	$(function() {
		Request = GetRequest();
		mid = Request['id'];
		grid = $('#grid').datagrid({
			title : '注意：角色重置时，操作菜单权限有可能发生变化。',
			iconCls : 'icon-site',
			url : '../role/queryRoleListByUserId?userid=' + mid,
			width : 'auto',
			height : 'auto',
			nowrap : true,
			striped : true,
			border : true,
			collapsible : false,// 是否可折叠的
			fit : true,// 自动大小
			remoteSort : false,
			// idField : 'id',
			//singleSelect : true,// 是否单选
			pagination : true,// 分页控件
			rownumbers : true,// 行号
			pageSize : 15,// 默认选择的分页是每页5行数据
			pageList : [ 5, 10, 15, 20, 30, 50 ],// 可以选择的分页集合
			columns : [ [ {
				field : 'id',
				checkbox : true
			}, {
				width : '150',
				title : '角色名称',
				field : 'rolename'
			}, {
				width : '200',
				title : '资源描述',
				field : 'roledscript'
			}, {
				width : '150',
				title : '创建时间',
				field : 'createdate'
			} ] ],
			toolbar : '#toolbar',
			onLoadSuccess : function(data) {
				var rowData = data.rows;
				$.each(rowData, function (idx, val) {
				if (val.checked) {
					$("#grid").datagrid("selectRow", idx);
				}
				});
				
			}
		});
		var p = $('#grid').datagrid('getPager');
		$(p).pagination({
			// 			pageSize : 15,// 每页显示的记录条数，默认为10
			// 			pageList : [ 1, 10, 20, 30, 50 ],// 可以设置每页记录条数的列表
			beforePageText : '第',// 页数文本框前显示的汉字
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		});
	});
	/* function rightFun() {
		// 得到选中的行
		var selRow = grid.datagrid("getSelections");// 返回选中多行
		if (selRow.length == 0) {
			alert("请至少选择一行数据!");
			return false;
		}
		saveMemRole(selRow);
	}
	function saveMemRole(selRow) {
		var ids = [];
		for (var i = 0; i < selRow.length; i++) {
			var id = selRow[i].id;
			ids.push(id);
			alert(id);
		}
		var param = {
			userid : mid,
			ids : ids
		};
		alert(ids +  "----" + mid);
		$.ajax({
			url : "../role/saveUserRoles",
			type : "POST",
		
			async : false,
			dataType : "json",
			cache : false,
			success : function(data) {
				if (data.success) {
				
					parent.max.sysSlideShow({
						msg : "操作成功！"
					});
					parent.max.closedlg();
				} else {
					parent.max.sysSlideShow({
						msg : "操作失败！"
					});
				}
			}
		});
	} */
	
	
	function getChecked() {
		var rows = grid.datagrid('getSelections');
		if (!rows || rows.length == 0) {
			$.messager.alert('提示', '请至少选择一行数据!', 'info');
			return;
		}
		var ids = [];
		$.each(rows, function(i, n) {
			var id = rows[i].roleid; // id这个是你要在列表中取的单个id
			ids.push(id); // 然后把单个id循环放到ids的数组中
		}); 
		saveInfo(ids);
	}

	function saveInfo(ids) {
		var param = {
			userid : mid,
			ids : ids
		};
		
		$.ajax({
			url : "../role/saveUserRoles",
			type : "POST",
			data : param,
			async : false,
			dataType : "json",
			cache : false,
			success : function(data) {
				if (data.success) {
					top.max.sysSlideShow({
						msg : "操作成功"
					});
					parent.max.closedlg();
				} else {
					top.max.sysSlideShow({
						msg : "操作失败"
					});
				}
			}
		});
	}
</script>

</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<input name="mid" readonly="readonly" type="text" value="${id }" />
	<div id="toolbar">
		<table>
			<tr>
<!-- 				<td><a href="javascript:void(0);" class="easyui-linkbutton" -->
<!-- 					data-options="iconCls:'icon-search',plain:true" -->
<%-- 					onclick="allotFun();">分配权限</a></td> --%>
<!-- 				<td><div class="datagrid-btn-separator"></div></td> -->
				<td><a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="iconCls:'icon-ok',plain:true" onclick="getChecked();">选择</a></td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid"></table>
	</div>
</body>
</html>