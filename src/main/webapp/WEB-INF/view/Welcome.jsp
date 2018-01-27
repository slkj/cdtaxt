<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎使用</title>

<link href="../css/workbench.css" rel="stylesheet" />
<%@ include file="/common/taglibs.jsp"%>

<script src="../js/echarts.min.js"></script>
<style type="text/css">
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font: inherit;
	font-size: 100%;
	vertical-align: baseline
}

html {
	line-height: 1
}

ol, ul {
	list-style: none
}

table {
	border-collapse: collapse;
	border-spacing: 0
}

caption, th, td {
	text-align: left;
	font-weight: normal;
	vertical-align: middle
}

q, blockquote {
	quotes: none
}

q:before, q:after, blockquote:before, blockquote:after {
	content: "";
	content: none
}

a img {
	border: none
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	main, menu, nav, section, summary {
	display: block
}

html {
	*overflow: auto
}

body, button, input, select, textarea {
	font-family: PingFang SC, Lantinghei SC, Microsoft Yahei,
		Hiragino Sans GB, Microsoft Sans Serif, WenQuanYi Micro Hei, sans;
	font-size: 14px
}

.clearfix:after {
	content: "";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden
}

.clearfix {
	display: inline-block
}

.clearfix {
	height: 1%
}

.clearfix {
	display: block;
	overflow: hidden
}

.ellipsis {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden
}

.alert {
	margin-bottom: 20px;
	padding: 0 10px;
	height: 36px;
	line-height: 36px;
	border: 1px solid #ddd;
	color: #888
}

.alert .close {
	float: right;
	font-size: 12px;
	color: #999
}

.alert .close:hover {
	text-decoration: none
}

.alert.alert-warning {
	background: #fff5db;
	color: #e2ba89;
	border-color: #ffe195
}

.alert.alert-error {
	background: #fceee8;
	color: #fc0000;
	border-color: #fc0000
}

::-webkit-scrollbar-track-piece {
	background-color: #fff;
	-webkit-border-radius: 0
}

::-webkit-scrollbar {
	width: 10px;
	height: 10px
}

::-webkit-scrollbar-thumb {
	height: 50px;
	background-color: #b8b8b8;
	-webkit-border-radius: 6px;
	outline: 2px solid #fff;
	outline-offset: -2px;
	border: 2px solid #fff;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.5
}

::-webkit-scrollbar-thumb:hover {
	height: 50px;
	background-color: #878987;
	-webkit-border-radius: 6px
}

@font-face {
	font-family: 'iconfont';
	src: url('../fonts/iconfont.eot?1464535104');
	src: url('../fonts/iconfont.eot?&1464535104#iefix')
		format("embedded-opentype"), url('../fonts/iconfont.woff?1464535104')
		format("woff"), url('../fonts/iconfont.ttf?1464535104')
		format("truetype"), url('../fonts/iconfont.svg?1464535104#iconfont')
		format("svg")
}

.iconfont {
	font-family: "iconfont" !important;
	font-size: 16px;
	font-style: normal;
	-webkit-font-smoothing: antialiased;
	-webkit-text-stroke-width: 0.2px;
	-moz-osx-font-smoothing: grayscale
}

.kv-table {
	border-right: 1px solid #cacaca \9;
	*border-right: 1px solid #cacaca
}

.kv-table .kv-table-row {
	border-bottom: 1px solid #cacaca
}

.kv-table .kv-table-row .kv-item {
	padding-left: 134px
}

.kv-table .kv-table-row .kv-item .kv-label {
	float: left;
	padding: 0 10px;
	margin-left: -134px;
	width: 112px;
	background: #f5f5f5;
	border: 1px solid #cacaca;
	border-bottom: none;
	border-top: none
}

.kv-table .kv-table-row .kv-item .kv-content-wrap {
	float: left;
	width: 100%
}

.kv-table .kv-table-row .kv-item .kv-content {
	padding: 10px
}

.kv-table .kv-table-row.col-3 .kv-item-wrap {
	float: left;
	width: 33.33%
}

.kv-table .kv-table-row.col-2 .kv-item-wrap {
	float: left;
	width: 33.33%
}

table.kv-table {
	width: 100%
}

table.kv-table .kv-label {
	padding: 0 10px;
	width: 114px;
	background: #f5f5f5;
	border: 1px solid #cacaca;
	border-top: none
}

table.kv-table td.kv-content, table.kv-table td.kv-label {
	height: 29px;
	padding: 5px 0;
	border-bottom: 1px solid #cacaca;
	font-size: 14px;
	padding-left: 20px
}

table.kv-table tr:first-child td.kv-content, table.kv-table tr:first-child td.kv-label
	{
	border-top: 1px solid #cacaca
}

table.kv-table tr td.kv-content:last-child {
	border-right: 1px solid #cacaca
}

table.kv-table tr .button {
	text-align: center;
	border-radius: 0;
	text-indent: 0;
	height: 32px
}

table.kv-table .kv-content {
	width: 260px;
	padding: 5px 10px
}

table.kv-table .textarea-wrap textarea {
	width: 98%
}
</style>
</head>
<body style="padding: 10px 5px 5px 10px;">
	<div class="container">
		<div id="hd"></div>

		<div id="bd">
			<div class="bd-content">
				<div class="right-zone">
					<div class="inform item-box">
						<div class="inform-hd">
							<label>通知公告</label>
							<a href="javascript:;">
								更多
								<span>&gt;</span>
							</a>
						</div>
						<ul>
							<li>
								<span></span>
								<a href="javascript:;" class="ellipsis">
									信息管理
									<i></i>
								</a>
								<label>04-13</label>
							</li>
							<li>
								<span></span>
								<a href="javascript:;" class="ellipsis">
									光电获土耳其最大固网
									<i></i>
								</a>
								<label>04-12</label>
							</li>
							<li>
								<span></span>
								<a href="javascript:;" class="ellipsis">2015中国线缆行业最具竞争</a>
								<label>04-11</label>
							</li>
						</ul>
					</div>
					<div class="attached item-box">
						<div class="inform-hd">
							<label>常用附件下载</label>
							<a href="javascript:;">
								更多
								<span>&gt;</span>
							</a>
						</div>
						<ul class="public-attached">
							<li>
								<span></span>
								<a href="javascript:;" class="ellipsis">表格下载</a>
							</li>
							<li>
								<span></span>
								<a href="javascript:;" class="ellipsis">处罚文书</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="center-part">
					<div class="center-items chart0 clearfix">
						<div class="chart0-item">
							<div class="item-inner">
								<div class="item-content">
									<div class="content-hd">车型统计</div>
									<div class="chart-chart" id="chart0">
										<table class="easyui-datagrid" data-options="fit:true,singleSelect:true,url:'../vehicle/queryByCarType',method:'get'">
											<thead>
												<tr>
													<th data-options="field:'week',width:120">车型</th>
													<th data-options="field:'count',width:150">数量（台）</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="chart0-item">
							<div class="item-inner">
								<div class="item-content">
									<div class="content-hd">公司统计</div>
									<div class="chart-chart" id="chart1">
										<table class="easyui-datagrid" data-options="fit:true,singleSelect:true,url:'../vehicle/queryByCom',method:'get'">
											<thead>
												<tr>
													<th data-options="field:'week',width:120">公司名称</th>
													<th data-options="field:'count',width:150">数量（台）</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="center-items chart1">
						<div class="chart1-inner">
							<div class="item-hd">车型分公司统计</div>
							<div class="chart1-chart" id="chart2"></div>
							<script type="text/javascript">
								// 基于准备好的dom，初始化echarts实例
								var myChart = echarts.init(document.getElementById('chart2'));
								// 指定图表的配置项和数据
								//定义图表options
								var options = {
									color : [ '#3398DB' ],
									tooltip : {
										trigger : 'axis'
									},
									legend : {
										data : []
									},
									toolbox : {
										show : true,
										feature : {
											mark : false
										}
									},
									calculable : true,
									xAxis : [ {
										type : 'category',
										data : []
									} ],
									yAxis : [ {
										type : 'value',
										minInterval : 1,
										splitArea : {
											show : true
										}
									} ],
									series : [ {
										barWidth : '60%'
									} ]
								};
								//通过Ajax获取数据
								$.ajax({
									type : "post",
									async : false, //同步执行
									url : "../vehicle/showEchartBar",
									dataType : "json", //返回数据形式为json
									success : function(result) {
										if (result) {
											//将返回的category和series对象赋值给options对象内的category和series
											//因为xAxis是一个数组 这里需要是xAxis[i]的形式
											options.xAxis[0].data = result.category;
											options.series = result.series;
											options.legend.data = result.legend;
											myChart.hideLoading();
											myChart.setOption(options);
										}
									},
									error : function(errorMsg) {
										alert("图表请求数据失败啦!");
									}
								});
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="ft"></div>
	</div>
</body>
</html>

