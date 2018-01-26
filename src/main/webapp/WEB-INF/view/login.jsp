<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>承德市出租汽车管理系统</title>
<link rel="icon" href="common/sl_favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="common/sl_favicon.ico" type="image/x-icon" />
<link rel="bookmark" href="common/sl_favicon.ico" type="image/x-icon" />
<link href="css/css.css" rel="stylesheet" />
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/common/util.js?ver=1.9" type="text/javascript"></script>
<script src="js/common/msgConst.js?ver=1.2" type="text/javascript"></script>
<script type="text/javascript">
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
	function keyLogin(event) {
		//回车键的键值为13
		if (event.keyCode == 13) {
			submit(); //调用登录按钮的登录事件
		}
	}
	document.onkeydown = keyLogin;

	function submit() {
		var userName = $("#userName").val();
		var password = $("#password").val();
		if (userName == "") {
			alert("用户名不能为空");
			$("#userName").focus()
			return false;
		}
		if (password == "") {
			alert("密码不能为空");
			$("#password").focus()
			return false;
		}

		var data = {
			username : userName,
			password : password
		}
		$.ajax({
			type : "post",
			dataType : "json",
			url : "user/login",
			data : data,
			async : true,
			success : function(result) {
				if (result.success) {
					window.location.href = getContextPath() + "/index?nowTime=" + new Date().getTime();
				} else {
					alert(result.msg);
				}
			}
		})
	}
</script>
</head>
<body class="login_bg">
	<div class="login_logo">
		<!-- 		<img alt="" src="images/login_logo.png" style="width: 100%; height: 100%;"> -->
	</div>
	<div class="login_form">
		<table>
			<tr>
				<td>
					<div class="jname">

						<input type="text" id="userName" name="username" class="jnameinput" maxlength="50" placeholder="请输入用户名" onfocus="if(value==defaultValue){value='';this.style.color='#fff'}" onblur="if(!value){value=defaultValue;this.style.color='#FCC4E3'}" />
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="jname">

						<input type="password" id="password" maxlength="30" placeholder="请输入密码" name="password" class="jnameinput" onfocus="if(value==defaultValue){value='';this.style.color='#fff'}" onblur="if(!value){value=defaultValue;this.style.color='#FCC4E3'}" />
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<input name="" type="submit" class="jloginbtn" id="submitBtn" onclick="return submit()" value="登录" />
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>

