<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	function save() {
		//校验
		var validate = $("#form").form('validate');
		if (!validate) {
			return validate;
		}
		var data = serializeObject($("#form"));
		return {
			url : getContextPath() + "/user/save",
			param : data
		}
	}
</script>
</head>

<body  style="width: 500px; padding: 10px 10px">
	<form id="form" method="post">
		<div style="margin-bottom: 15px">
			<label>账号:</label>
			<input class="easyui-textbox" name="username" style="width: 80%; height: 32px">
		</div>
		<div style="margin-bottom: 15px">
			<label>姓名:</label>
			<input class="easyui-textbox" name="username" style="width: 80%; height: 32px">
		</div>
		<div style="margin-bottom: 15px">
			<label>性 别:</label>
			<cite>
				<input name="sex" type="radio" value="" checked="checked" />
				男&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="sex" type="radio" value="" />
				女
			</cite>
		</div>
		<div style="margin-bottom: 15px">
			<label>电话:</label>
			<input class="easyui-textbox" name="username" style="width: 80%; height: 32px">
		</div>
	</form>
</body>
</html>