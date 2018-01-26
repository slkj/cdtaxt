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
	$(function() {
		$form = $("#form");
		newOrEdit();
	});
	function newOrEdit() {
		pkey = getUrlParam("pkey");
		$.ajax({
			type : "post",
			dataType : "json",
			url : '../company/queryOne?id='+pkey,
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
	function save() {
		//校验
		var validate = $("#form").form('validate');
		if (!validate) {
			return validate;
		}
		var data = serializeObject($("#form"));
		return {
			url : getContextPath() + "/company/editCompany",
			param : data
		}
	}
</script>
</head>

<body style="width: 500px; padding: 10px 10px">
	<form id="form" method="post">
		<input name="id" type="hidden">
		<div style="margin-bottom: 15px">
			<label>企业编号:</label>
			<input class="easyui-textbox" name="compCode" style="width: 80%; height: 32px">
		</div>
		<div style="margin-bottom: 15px">
			企业名称:
			<input class="easyui-textbox" name="compName" style="width: 80%; height: 32px">
		</div>
		<div style="margin-bottom: 15px">
			联系人:
			<input class="easyui-textbox" name="linkman" style="width: 80%; height: 32px">
		</div>
		<div style="margin-bottom: 15px">
			联系电话:
			<input class="easyui-textbox" name="mobile" style="width: 80%; height: 32px">
		</div>
		<div style="margin-bottom: 15px">
			Email:
			<input class="easyui-textbox" name="email" style="width: 80%; height: 32px">
		</div>
		<div style="margin-bottom: 15px">
			QQ:
			<input class="easyui-textbox" name="qq" style="width: 80%; height: 32px">
		</div>
	</form>
</body>
</html>