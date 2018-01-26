<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<!-- 	引入通用js css -->
<%@ include file="/common/taglibs.jsp"%></head>
<link href="../css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/city.js"></script>
<script type="text/javascript">
	var id;
	$(function() {
		var Request = new Object();
		Request = GetRequest();
		id = Request['id'];
		if (typeof (id) != "undefined") {
			loaddata();
		}else{
			showOwned();
		}
		$('#type').combobox({
			onSelect : function(param) {
				if (param.value == 2) {
					$('#ownedId').combobox('clear');
					showOwned();
				} else {
					$('#com').combobox('clear');
					showCom();
				}
			}
		});

	});
	function showOwned(){
		$('#TRcom').show(); //可用
		$('#TRownedId').hide(); //不可用
		$('#com').combotree({
			url : '../dep/getDepTree',
			valueField : 'id',
			textField : 'text'
		});
	}
	function showCom(){
		$('#TRownedId').show(); //可用
		$('#TRcom').hide(); //不可用
		$("#ownedId").combobox({
			url : '../company/queryComList',
			editable : false,
			cache : false,
			valueField : 'id',
			textField : 'gsmc'
		});
	}
	function loaddata() {
		var user = {
			u_id : id
		};
		$.ajax({
			url : "../user/queryOne",
			data : user,
			success : function(data) {
				if(data.type=="1"){
					showCom();
				}else{
					showOwned();
				}
				$("#form").form('load', data);
				$('#username').attr('readonly', 'readonly');
				$("#localname").html(data.localname);
			}
		});
	}

	function rcheck() {
		//判断用户类型，企业用户所属公司必选
		// 		var type = $("input[name='type']:checked").val();
		//var type = $('#type').combobox('getValue');
		//var com = $('#com').combobox('getValue');
		//if (type == 1) {
		if (com != null) {
			return true;
		} else {
			return false;
		}
		//}
		return true;
	}
	function save() {
		if (rcheck()) {
			if ($("#form").form("validate")) {
				$.ajax({
					type : "POST",
					url : '../user/add',
					data : $('#form').serialize(),// 你的formid
					async : false,
					success : function(data) {
						if (data.success) {
							parent.grid.datagrid('load');
							parent.max.sysSlideShow({
								msg : data.msg
							});
							closeWindow();
						} else {
							parent.max.sysSlideShow({
								msg : data.msg
							});
						}

					}
				});
			}
		} else {
			$.messager.alert('提示', '请选择所在公司', 'info');
		}
	}
	function closeWindow() {
		parent.max.closedlg();
	}

	function postData() {
		$('#form').form('submit', {
			url : '../user/add',
			type : 'POST',
			dataType : "json",
			onSubmit : function() {
				if ($("#form").form("validate"))
					return true;
				else
					return false;
			},
			success : function(data) {
				data = JSON.parse(data);
				if (data.success) {
					parent.max.sysSlideShow({
						msg : "操作成功。"
					});
					parent.grid.datagrid('load');
					closeWindow();
				} else {
					parent.max.sysSlideShow({
						msg : "保存失败。"
					});
				}
			}
		});
	}
</script>

<body>
	<%-- <input type="hidden" id="utype" value="${userSession.type }" /> --%>
	<form id="form" method="post" class="form">
		<input type="hidden" name="u_id" /> <input type="hidden"
			name="regtime" />
		<div id="dd" style="padding-right: 30px">
			<table class="grid">
				<tr>
					<th align="right" style="width: 90px">用户类型：</th>
					<td colspan="3">
						<!-- 	<input id="type1" name="type" type="radio" value="1" checked="checked" />企业用户 
							<span id="type2"> <input name="type" type="radio" value="2" />运管单位</span> 
							<input name="type" type="radio" value="3" />个人用户 					<input name="type" type="radio" value="0"/>管理员
							 --> <select id="type" class="easyui-combobox" name="type">
							<option value="1">企业用户</option>
							<option value="2" selected="selected">平台用户</option>
					</select>
					<span style="color: red;">平台用户：录入车信息操作人员；企业用户：运输公司及车队人员查询统计使用。</span>
					</td>
				</tr>
				<tr>
					<th align="right">账户：</th>
					<td style="width: 180px"><input id="username" name="username"
						class="easyui-validatebox" data-options="required:true"
						style="width: 100%;" /></td>
					<th align="right" style="width: 90px">密码：</th>
					<td style="width: 180px"><input name="password"
						type="password" class="easyui-validatebox"
						data-options="required:true" style="width: 100%;" /></td>
				</tr>
				<tr>
					<th align="right">用户姓名：</th>
					<td><input name="contacts" class="easyui-validatebox"
						data-options="required:true" style="width: 100%;" /></td>
					<th align="right" style="width: 90px">联系电话：</th>
					<td><input name="telephone" class="easyui-validatebox"
						data-options="required:true" style="width: 100%;" /></td>
				</tr>
				<tr>
					<th align="right">QQ：</th>
					<td><input name="qq" class="easyui-validatebox"
						style="width: 100%;" /></td>
					<th align="right" style="width: 90px">邮箱：</th>
					<td><input name="email" class="easyui-validatebox"
						style="width: 100%;" validtype="email" invalidMessage="邮箱格局不正确" /></td>
				</tr>
				<tr>
					<th align="right">所在地区：</th>
					<td colspan="3"><input name="province" id="province"
						style="width: 120px;" /> <input name="city" id="city" /> <input
						name="county" id="county" /> <input type="hidden" name="location"
						id="cregicounty" /> <span id="localname"></span></td>
				</tr>
				<tr id="TRcom">
					<th align="right">所属机构：</th>
					<td colspan="3"><input id="com" name="departcode"
						class="easyui-combobox" style="width: 300px;" /></td>
				</tr>
				<tr id="TRownedId">
					<th align="right">所属公司：</th>
					<td colspan="3"><input  id="ownedId" name="companyid"
						class="easyui-combobox" style="width: 200px;" /></td>
				</tr>
				<tr>
					<th align="right">联系地址：</th>
					<td colspan="3"><input name="address"
						class="easyui-validatebox" style="width: 100%;" /></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center"><a href="#"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-save',plain:true" onclick="save()">保存</a>
						<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-cancel',plain:true"
						onclick="closeWindow()">关闭</a></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>