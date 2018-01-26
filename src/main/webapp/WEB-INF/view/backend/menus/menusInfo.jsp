<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	var $form;
	var pkey;
	var pkey;
	var mode;
	var upUrl =  getContextPath() +"/module/addModule";
	$(function() {
		$form = $("#postForm");
		pkey = getUrlParam("pkey");
		$("#p_menus").combotree({
			url : getContextPath() + '/module/getCombotree',
			lines : true,
			required : true
		});
		newOrEdit();
	});
	function newOrEdit() {
		if (pkey) {
			upUrl = getContextPath() + '/module/editModule';
			$.ajax({
				type : "post",
				dataType : "json",
				url : getContextPath() + '/module/queryOne?id=' + pkey,
				async : true,
				success : function(result) {
					if (result) {
						$form.form("load", result);
					} else {
						showError("系统异常");
					}
				}
			})
		}
	}
	function save() {
		//校验
		var validate = $form.form('validate');
		if (!validate) {
			return validate;
		}
		var data = serializeObject($("#postForm"));
		return {
			url : upUrl,
			param : data
		}
	}
</script>
</head>
<body>
	<form id="postForm" metdod="post">
		<input id="id" name="id" type="hidden" />
		<table>
			<tr>
				<td align="right" width="70px">菜单名称:</td>
				<td>
					<input class="easyui-textbox" name="name" type="text" style="width: 95%;" />
				</td>
			</tr>
			<tr>
				<td align="right">上级菜单:</td>
				<td>
					<input id="p_menus" class="easyui-textbox" name="p_id" type="text" style="width: 95%;" />
				</td>
			</tr>
			<tr>
				<td align="right">菜单层级:</td>
				<td>
					<select class="easyui-combobox" name="priority" style="width: 95%;" editable="false">
						<option value="1">一级菜单</option>
						<option value="2">二级菜单</option>
						<option value="3">菜单按钮</option>
						<option value="4">行按钮</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">资源路径:</td>
				<td>
					<input type="text" class="easyui-textbox" name="url" style="width: 95%;" />
				</td>
			</tr>
			<tr>
				<td align="right">顺&nbsp;&nbsp;&nbsp;序&nbsp;:</td>
				<td>
					<input type="text" class="easyui-textbox" name="sort" value="10" style="width: 95%;" />
				</td>
			</tr>
			<tr>
				<td align="right">说&nbsp;&nbsp;&nbsp;&nbsp;明:</td>
				<td>
					<textarea class="textarea" name="description" style="height: 50px; width: 95%;"></textarea>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>