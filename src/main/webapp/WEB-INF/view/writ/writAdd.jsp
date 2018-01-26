<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/common/taglibs.jsp"%>
<style type="text/css" id="style1">
li {
	list-style-type: none;
}

.table {
	border: solid black;
	border-width: 0px 0px 0px 0px;
	font－size: 11px;
}

.table td {
	border: solid black;
	border-width: 1px 0px 0px 1px;
	padding: 5px 5px;
}
</style>
</head>
<body class="easyui-layout">

	<div data-options="region:'north',border:false" style="height: 80px;">
		<div class="rightinfo">
			<div class="proleft">运行流程：</div>
			<ul class="project">
				<li class="start">
					<span>&nbsp;</span>
					<b>1</b>
					信息登记
					<i>&nbsp;</i>
				</li>
				<li>
					<span>&nbsp;</span>
					<b>2</b>
					调查取证
					<i>&nbsp;</i>
				</li>
				<li>
					<span>&nbsp;</span>
					<b>3</b>
					审查
					<i>&nbsp;</i>
				</li>
				<li>
					<span>&nbsp;</span>
					<b>4</b>
					告知
					<i>&nbsp;</i>
				</li>
				<li>
					<span>&nbsp;</span>
					<b>5</b>
					决定
					<i>&nbsp;</i>
				</li>
				<li>
					<span>&nbsp;</span>
					<b>6</b>
					送达
					<i>&nbsp;</i>
				</li>
				<li>
					<span>&nbsp;</span>
					<b>7</b>
					执行
					<i>&nbsp;</i>
				</li>
			</ul>
		</div>
	</div>
	<div data-options="region:'west',split:true,collapsible:false,title:'案件模板'" style="width: 220px; padding: 10px;">
		<ul id="tt" class="easyui-tree">
			<li>
				<span>载客行为</span>
				<ul>
					<li>
						<span>拒载、议价、甩客、绕道</span>
					</li>
					<li>
						<span>拼车</span>
					</li>
					<li>
						<span>违规收款</span>
					</li>
					<li>
						<span>运营证件不全</span>
					</li>
				</ul>
			</li>
			<li>
				<span>车辆状态</span>
				<ul>
					<li>
						<span>拒载、议价、甩客、绕道</span>
					</li>
					<li>
						<span>拼车</span>
					</li>
					<li>
						<span>违规收款</span>
					</li>
					<li>
						<span>运营证件不全</span>
					</li>
				</ul>
			</li>
		</ul>

	</div>
	<div data-options="region:'center',title:'案件信息',iconCls:'icon-site'">
		<form id="form" method="post">
			<div style="line-height: 40px; margin-bottom: 30px; text-align: center; font-size: 28px; font-weight: bold; font-family: '宋体'">建筑垃圾处置申报表</div>
			<table class="table" id="table">
				<tr>
					<td style="height: 30px;; width: 90px;" nowrap="nowrap">建设单位</td>
					<td style="height: 30px; width: 430px">
						<span id="P_jsUnit"></span>
					</td>
					<td style="height: 30px; width: 90px;" nowrap="nowrap">工程名称</td>
					<td style="height: 30px; width: 430px">
						<span id="P_gcName"></span>
					</td>
					<td style="height: 100%; width: 5px; border-right: none; border-bottom: none; border-top: none; vertical-align: middle; margin: 0 auto; width: 20px; line-height: 24px;" rowspan="14">
						<span id="right_Text"></span>
					</td>
				</tr>
				<tr>
					<td height="30px">施工地点</td>
					<td height="30px">
						<span id="P_site"></span>
					</td>
					<td height="30px">施工单位</td>
					<td height="30px">
						<span id="P_sgUnit"></span>
					</td>
				</tr>
				<tr>
					<td height="30px">垃圾种类</td>
					<td height="30px">
						<span id="P_cqtype"></span>
					</td>
					<td height="30px" nowrap="nowrap">垃圾产量（T）</td>
					<td height="30px">
						<span id="P_tonnage"></span>
					</td>
				</tr>
				<tr>
					<td height="30px">承运单位</td>
					<td colspan="3">
						<span id="P_groupName"></span>
					</td>
				</tr>
				<tr align="center">
					<td height="30px" colspan="4">
						<b>以下由管理部门填写</b>
					</td>
				</tr>
				<tr>
					<td height="30px">处置地点</td>
					<td colspan="3">
						<span id="P_czArea"></span>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">
						备
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						注
					</td>
					<td colspan="3" style="padding: 20px 10px 20px 10px;">
						1、建设、施工单位在需要处置（倾倒、运输、中转、回填、消纳、利用）建筑垃圾时，应提前五日按照申报表要求到邯郸市建筑垃圾管理处申报。
						<br>
						<br>
						2、管理部门在接到申报表后，三日内核实以上内容进行审批，经核实审批后，申请单位不得变更审批内容，否则按有关规定予以处罚。
						<br>
						<br>
						3、建设或施工单位应安装要求围帐施工，硬化施工场地，工地出入口设置防污冲洗设施，保持周围环境整洁卫生。
						<br>
						<br>
						4、承运单位必须按照《清运证》规定的时间、路线、地点进行行驶和倾倒，不得带泥行驶污染路面。否则，将依据有关规定予以处罚。
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center; border-bottom-width: 1px">
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="uploadCarOwnerPhoto();">上传照片</a>
					</td>
				</tr>
			</table>
		</form>
		
	</div>
</html>