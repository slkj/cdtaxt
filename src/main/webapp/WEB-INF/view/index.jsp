<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>承德市出租汽车管理系统</title>
<%@ include file="/common/taglibs.jsp"%>
<script src="js/bootstrap.js"></script>
<script src="js/respond.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body class="easyui-layout">
	<noscript>
		<div style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
			<img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
		</div>
	</noscript>
	<div region="north" split="false" border="false" class="header">
		<div class="topleft"></div>
		<div class="topright">
			<ul>
				<li>
					<span>
						<img src="images/help.png" title="帮助" class="helpimg" />
					</span>
					<a href="#">帮助</a>
				</li>
				<li>
					<a href="#">关于</a>
				</li>
				<li>
					<a id="loginOut" href="#" target="_parent">退出</a>
				</li>
			</ul>

			<div class="user">
				<span>欢迎您：admin</span>
			</div>
		</div>
	</div>
	<div region="west" split="true" title="导航菜单" style="width: 210px;" id="west">
		<div id='wnav' class="easyui-accordion" fit="true" border="false">
		</div>
	</div>
	<div id="mainPanle" region="center" style="overflow-y: hidden;">
		<div id="tabs" class="easyui-tabs" fit="true" border="false" style=""></div>
	</div>
	<div id="mm" class="easyui-menu" style="width: 150px;">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="closeother">关闭其他</div>
		<div id="mm-tabAllclose">全部关闭</div>
	</div>
	<div id="myWindow"></div>

</body>
</html>



