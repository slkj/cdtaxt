/**
 * 获取context路径
 * 
 * @returns
 */
getContextPath = function() {
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPath = curWwwPath.substring(0, pos);
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	return (localhostPath + projectName);
}

/**
 * 获取请求参数
 * 
 * @param name
 * @returns
 */
getUrlParam = function(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null) {
		return unescape(r[2]);
	}
	return null;
}

/**
 * 将form中的元素序列化
 * 
 * @example serializeObject($('#formId'))
 * 
 * @requires jQuery
 * 
 * @returns object
 */
serializeObject = function(form) {
	var o = {};
	var disabled = form.find(':input:disabled').removeAttr('disabled');
	$.each(form.serializeArray(), function(index) {
		if (this['value'] != undefined && this['value'].length > 0) {
			if (o[this['name']]) {
				o[this['name']] = o[this['name']] + "," + this['value'];
			} else {
				o[this['name']] = this['value'];
			}
		}
	});
	disabled.attr('disabled', 'disabled');
	return o;
};

/**
 * 将form中的元素序列化，同时将checkbox的值 转为0或1，默认是on或off
 * 
 * @param form
 * @param cbProps
 * @returns object
 */
serializeObjectWithCheckbox = function(form, cbProps) {
	var ats = cbProps.split(",");
	var o = {};
	var disabled = form.find(':input:disabled').removeAttr('disabled');
	$.each(form.serializeArray(), function(index) {
		if (this['value'] != undefined && this['value'].length > 0) {
			if (o[this['name']]) {
				o[this['name']] = o[this['name']] + "," + this['value'];
			} else {
				o[this['name']] = this['value'];
			}

			for (x in ats) {
				if (ats[x] == this['name']) {
					if (this['value'] == 'on') {
						o[this['name']] = 1;
					} else {
						o[this['name']] = 0;
					}
				}
			}
		}
	});
	disabled.attr('disabled', 'disabled');
	return o;
};

/**
 * 将json数据中 0或1的这种复选框属性，改为on或off，适合easyui使用。
 * 
 * @param json
 * @param cbProps
 * @returns
 */
convertForCheckbox = function(json, cbProps) {
	var ats = cbProps.split(",");

	for ( var key in json) {
		for (x in ats) {
			if (ats[x] == key) {
				if (json[key] == 1) {
					json[key] = 'on';
				} else {
					json[key] = 'off';
				}
			}
		}
	}
	return json;
}

/**
 * 添加cookie
 * 
 * @param key
 * @param value
 * @param options
 * @returns
 */
cookie = function(key, value, options) {
	if (arguments.length > 1 && (value === null || typeof value !== "object")) {
		options = $.extend({}, options);
		if (value === null) {
			options.expires = -1;
		}
		if (typeof options.expires === 'number') {
			var days = options.expires, t = options.expires = new Date();
			t.setDate(t.getDate() + days);
		}
		return (document.cookie = [ encodeURIComponent(key), '=', options.raw ? String(value) : encodeURIComponent(String(value)),
				options.expires ? '; expires=' + options.expires.toUTCString() : '', options.path ? '; path=' + options.path : '',
				options.domain ? '; domain=' + options.domain : '', options.secure ? '; secure' : '' ].join(''));
	}
	options = value || {};
	var result, decode = options.raw ? function(s) {
		return s;
	} : decodeURIComponent;
	return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};

/**
 * 获取cookie
 * 
 * @param key
 * @returns
 */
getCookie = function(key) {
	var aCookie = parent.document.cookie.split(";");
	for (var i = 0; i < aCookie.length; i++) {
		var aCrumb = aCookie[i].split("=");
		if (key === aCrumb[0].replace(/^\s*|\s*$/, "")) {
			return unescape(aCrumb[1]);
		}
	}
}

/**
 * 更换主题
 * 
 * @param themeName
 */
changeTheme = function(themeName) {
	var $easyuiTheme = $('#easyuiTheme');
	var url = $easyuiTheme.attr('href');
	var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';
	$easyuiTheme.attr('href', href);

	var $iframe = $('iframe');
	if ($iframe.length > 0) {
		for (var i = 0; i < $iframe.length; i++) {
			var ifr = $iframe[i];
			try {
				$(ifr).contents().find('#easyuiTheme').attr('href', href);
			} catch (e) {
				try {
					ifr.contentWindow.document.getElementById('easyuiTheme').href = href;
				} catch (e) {
				}
			}
		}
	}

	cookie('easyuiTheme', themeName, {
		expires : 7
	});
};

/**
 * 处理cookie中的theme，实现更换皮肤功能
 */
handleCookieForTheme = function() {
	var themeName = getCookie('easyuiTheme');
	if (themeName != null && themeName != undefined) {
		var $easyuiTheme = $('#easyuiTheme');
		var url = $easyuiTheme.attr('href');
		var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';
		$easyuiTheme.attr('href', href);
	}
}

/**
 * 将{0} {1} 这样的占位符替换为参数
 * 
 * @param str
 * @returns
 */
formatString = function(str) {
	for (var i = 0; i < arguments.length - 1; i++) {
		str = str.replace("{" + i + "}", arguments[i + 1]);
	}
	return str;
};

getCurrentDate = function() {
	var mydate = new Date();
	// mydate.getYear(); //获取当前年份(2位)
	var year = mydate.getFullYear(); // 获取完整的年份(4位,1970-????)
	var month = mydate.getMonth() + 1; // 获取当前月份(0-11,0代表1月)
	var day = mydate.getDate(); // 获取当前日(1-31)
	// mydate.getDay(); //获取当前星期X(0-6,0代表星期天)
	// mydate.getTime(); //获取当前时间(从1970.1.1开始的毫秒数)
	var hour = mydate.getHours(); // 获取当前小时数(0-23)
	var minute = mydate.getMinutes(); // 获取当前分钟数(0-59)
	var second = mydate.getSeconds(); // 获取当前秒数(0-59)
	// mydate.getMilliseconds(); //获取当前毫秒数(0-999)
	var date = mydate.toLocaleDateString(); // 获取当前日期
	var time = mydate.toLocaleTimeString(); // 获取当前时间
	var dateTime = mydate.toLocaleString(); // 获取日期与时间

	/*
	 * console.info(date); console.info(time); console.info(dateTime);
	 */
	return year + '-' + month + '-' + day;
}

/**
 * 下载文件
 * 
 * @param str
 *            下载文件的路径
 */
function downloadFile(str) {
	$.post(getContextPath() + "/common/fileExist", {
		filePath : str
	}, function(r) {
		if (r.message) {
			showError(r.message);
		} else {
			self.location.href = getContextPath() + "/common/downloadFile?filePath=" + str;
		}
	}, 'json');
}

/**
 * 调用搜索帮助的公共js。 参数用对象方式传递，对象属性如下：
 * 
 * @param searchHelpCode
 *            搜索帮助代码
 * @param width
 *            搜索帮助对话框的宽度
 * @param height
 *            搜索帮助对话框的高度
 * @param callback
 *            回调函数
 */
function callSearchHelp(options) {
	var defaults = {
		width : 500,
		height : 480
	};

	var opt = $.extend({}, defaults, options);

	var url = getContextPath() + '/common/menuPage?url=searchHelp&searchHelpCode=' + opt.searchHelpCode;
	if (opt.sqlParams) {
		url = url + '&sqlParams=' + opt.sqlParams;
	}
	if (opt.addtion) {
		url = url + '&addtion=' + opt.addtion;
	}

	var dialog = createDialog({
		frameID : 'searchHelp',
		title : '搜索帮助',
		width : opt.width,
		height : opt.height,
		url : url,
		toolbar : [ {
			text : common013,
			iconCls : 'icon-search',
			// 调用 iframe中的query方法
			handler : function() {
				parent.document.getElementById("searchHelp").contentWindow.query();
			}
		}, "-", {
			text : common014,
			iconCls : 'icon-ok',
			handler : function() {
				// 调用 iframe中的confirm方法， 获取搜索帮助中 选中的值
				var value = parent.document.getElementById("searchHelp").contentWindow.confirm();
				if (value) {
					// 关闭 搜索帮助 对话框
					dialog.dialog('destroy');
					// 回调函数
					options.callback(value);
				}
			}
		}, "-", {
			text : common009,
			iconCls : 'icon-cancel',
			handler : function() {
				dialog.dialog('destroy');
			}
		} ]
	});

	/*
	 * vseaf.showModalDialog({ title: '搜索帮助', width: w, height: h, content: 'url:' + url, data : { property : property, searchHelpInputID : searchHelpInputID }, toolbar : [ { text :
	 * common013, iconCls:'icon-search', //调用 iframe中的query方法 handler : 'query' }, "-", { text : common014, iconCls:'icon-ok', handler : function(dialog) { //获取搜索帮助中 选中的值 var value =
	 * dialog.searchHelpConfirm(); //关闭 搜索帮助 对话框 dialog.close(); //给页面的搜索帮助框赋值 $('#' + searchHelpInputID).searchbox('setValue',value); } },"-", { text : common009,
	 * iconCls:'icon-cancel', handler : function(dialog) { dialog.close(); } }] });
	 */
}

/**
 * 导入对话框
 * 
 * @returns
 */
exportDialog = function(callFlag, sourceUrl) {
	var data = {
		frameID : 'exportDialog',
		title : '导入Excel',
		width : 400,
		height : 180,
		url : getContextPath() + '/common/menuPage?url=fileUpload&callFlag=' + callFlag + "&sourceUrl=" + sourceUrl
	};
	return createDialog(data);
};

/**
 * 上传图片对话框
 * 
 * @returns
 */
uploadImageDialog = function(callFlag, sourceUrl) {
	var data = {
		frameID : 'uploadImage',
		title : '上传图片',
		width : 450,
		height : 180,
		closable : true,
		url : getContextPath() + '/comm/upload?url=imageUpload&callFlag=' + callFlag + "&sourceUrl=" + sourceUrl
	};
	return createDialog(data);
};

/**
 * 创建对话框
 * 
 * @param options
 * @returns
 */
createDialog = function(options) {
	// 默认在 界面的最顶层 创建对话框
	var _top = (function(w) {
		return w['top'];
	})(window);

	var opts = $.extend({
		closable : false,
		collapsible : false,
		modal : true,
		onClose : function() {
			$(this).dialog('destroy');
		}
	}, options);
	opts.content = '<iframe id="' + options.frameID + '" src="' + options.url + '" allowTransparency="true" scrolling="auto" width="100%" height="98%" frameBorder="0"></iframe>';
	return _top.$('<div/>').dialog(opts);
};

/**
 * 对grid进行操作时，校验是否选中一行
 * 
 * @param grid
 *            datagrid
 */
checkRow = function(grid) {
	var row = grid.datagrid("getSelected");
	if (row) {
		return row;
	} else {
		showError(common002);
	}
}

/**
 * 对grid进行操作时，校验是否至少选中一行
 * 
 * @param grid
 * @returns
 */
getSelectRows = function(grid) {
	var rows = grid.datagrid('getSelections');
	if (rows && rows.length > 0) {
		return rows;
	} else {
		showError(common019);
	}
}

showError = function(msg) {
	parent.$.messager.alert(common001, msg, 'error');
}

showInfo = function(msg) {
	parent.$.messager.alert(common001, msg, 'info');
}

checkboxFormatter = function(value, row, index) {
	if (value == 1) {
		return '<input type="checkbox" checked="checked" disabled="disabled" />';
	} else {
		return '<input type="checkbox" disabled="disabled" />';
	}
}

mysorter = function(a, b) {
	if (a == null) {
		return -1;
	} else if (b == null) {
		return 1;
	} else {
		a = a.split('/');
		b = b.split('/');
		if (a[0] == b[0]) {
			if (a[1] == b[1]) {
				return (a[2] > b[2] ? 1 : -1);
			} else {
				return (a[1] > b[1] ? 1 : -1);
			}
		} else {
			return (a[0] > b[0] ? 1 : -1);
		}
	}
}

initDynamicColumn = function() {
	$('#showColumns .l-btn-left').attr('class', 'easyui-splitbutton').menubutton({
		menu : '#mm'
	});

	$('#mm').menu({
		onClick : function(item) {
			if (item.iconCls == 'N/A') {
				$grid.datagrid("showColumn", item.id);
				$('#mm').menu('setIcon', {
					target : $('#' + item.id)[0],
					iconCls : 'icon-ok'
				});
			} else {
				$grid.datagrid("hideColumn", item.id);
				$('#mm').menu('setIcon', {
					target : $('#' + item.id)[0],
					iconCls : 'N/A'
				});
			}
		}
	});
}

keydown = function(event) {
	if (event.keyCode == 13) {
		$("#searchBtn").click();
	}
}

// 客户端分页
function pagerFilter(data) {
	if (typeof data.length == 'number' && typeof data.splice == 'function') {
		data = {
			total : data.length,
			rows : data
		};
	}

	var dg = $(this);
	var opts = dg.datagrid('options');
	var pager = dg.datagrid('getPager');
	pager.pagination({
		onSelectPage : function(pageNum, pageSize) {
			opts.pageNumber = pageNum;
			opts.pageSize = pageSize;
			pager.pagination('refresh', {
				pageNumber : pageNum,
				pageSize : pageSize
			});
			dg.datagrid('loadData', data);
		}
	});
	if (!data.originalRows) {
		data.originalRows = (data.rows);
	}

	var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
	var end = start + parseInt(opts.pageSize);
	data.rows = (data.originalRows.slice(start, end));
	return data;
}
/**
 * 扩展easyui的validator插件rules，支持更多类型验证
 */
$.extend($.fn.validatebox.defaults.rules, {
	minLength : { // 判断最小长度
		validator : function(value, param) {
			return value.length >= param[0];
		},
		message : '最少输入 {0} 个字符'
	},
	length : { // 长度
		validator : function(value, param) {
			var len = $.trim(value).length;
			return len >= param[0] && len <= param[1];
		},
		message : "输入内容长度必须介于{0}和{1}之间"
	},
	phone : {// 验证电话号码
		validator : function(value) {
			return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
		},
		message : '格式不正确,请使用下面格式:020-88888888'
	},
	mobile : {// 验证手机号码
		validator : function(value) {
			return /^(13|15|18)\d{9}$/i.test(value);
		},
		message : '手机号码格式不正确'
	},
	phoneAndMobile : {// 电话号码或手机号码
		validator : function(value) {
			return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value) || /^(13|15|18)\d{9}$/i.test(value);
		},
		message : '电话号码或手机号码格式不正确'
	},
	idcard : {// 验证身份证
		validator : function(value) {
			return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value) || /^\d{18}(\d{2}[A-Za-z0-9])?$/i.test(value);
		},
		message : '身份证号码格式不正确'
	},
	intOrFloat : {// 验证整数或小数
		validator : function(value) {
			return /^\d+(\.\d+)?$/i.test(value);
		},
		message : '请输入数字，并确保格式正确'
	},
	currency : {// 验证货币
		validator : function(value) {
			return /^\d+(\.\d+)?$/i.test(value);
		},
		message : '货币格式不正确'
	},
	qq : {// 验证QQ,从10000开始
		validator : function(value) {
			return /^[1-9]\d{4,9}$/i.test(value);
		},
		message : 'QQ号码格式不正确'
	},
	integer : {// 验证整数
		validator : function(value) {
			return /^[+]?[1-9]+\d*$/i.test(value);
		},
		message : '请输入整数'
	},
	chinese : {// 验证中文
		validator : function(value) {
			return /^[\u0391-\uFFE5]+$/i.test(value);
		},
		message : '请输入中文'
	},
	chineseAndLength : {// 验证中文及长度
		validator : function(value) {
			var len = $.trim(value).length;
			if (len >= param[0] && len <= param[1]) {
				return /^[\u0391-\uFFE5]+$/i.test(value);
			}
		},
		message : '请输入中文'
	},
	english : {// 验证英语
		validator : function(value) {
			return /^[A-Za-z]+$/i.test(value);
		},
		message : '请输入英文'
	},
	englishAndLength : {// 验证英语及长度
		validator : function(value, param) {
			var len = $.trim(value).length;
			if (len >= param[0] && len <= param[1]) {
				return /^[A-Za-z]+$/i.test(value);
			}
		},
		message : '请输入英文'
	},
	englishUpperCase : {// 验证英语大写
		validator : function(value) {
			return /^[A-Z]+$/.test(value);
		},
		message : '请输入大写英文'
	},
	unnormal : {// 验证是否包含空格和非法字符
		validator : function(value) {
			return /.+/i.test(value);
		},
		message : '输入值不能为空和包含其他非法字符'
	},
	username : {// 验证用户名
		validator : function(value) {
			return /^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(value);
		},
		message : '用户名不合法（字母开头，允许6-16字节，允许字母数字下划线）'
	},
	faxno : {// 验证传真
		validator : function(value) {
			return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value);
		},
		message : '传真号码不正确'
	},
	zip : {// 验证邮政编码
		validator : function(value) {
			return /^[1-9]\d{5}$/i.test(value);
		},
		message : '邮政编码格式不正确'
	},
	ip : {// 验证IP地址
		validator : function(value) {
			return /d+.d+.d+.d+/i.test(value);
		},
		message : 'IP地址格式不正确'
	},
	name : {// 验证姓名，可以是中文或英文
		validator : function(value) {
			return /^[\u0391-\uFFE5]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
		},
		message : '请输入姓名'
	},
	engOrChinese : {// 可以是中文或英文
		validator : function(value) {
			return /^[\u0391-\uFFE5]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
		},
		message : '请输入中文'
	},
	engOrChineseAndLength : {// 可以是中文或英文
		validator : function(value) {
			var len = $.trim(value).length;
			if (len >= param[0] && len <= param[1]) {
				return /^[\u0391-\uFFE5]+$/i.test(value) | /^\w+[\w\s]+\w+$/i.test(value);
			}
		},
		message : '请输入中文或英文'
	},
	carNo : {
		validator : function(value) {
			return /^[\u4E00-\u9FA5][\da-zA-Z]{6}$/.test(value);
		},
		message : '车牌号码无效（例：粤B12350）'
	},
	carenergin : {
		validator : function(value) {
			return /^[a-zA-Z0-9]{16}$/.test(value);
		},
		message : '发动机型号无效(例：FG6H012345654584)'
	},
	same : {
		validator : function(value, param) {
			if ($("#" + param[0]).val() != "" && value != "") {
				return $("#" + param[0]).val() == value;
			} else {
				return true;
			}
		},
		message : '两次输入的密码不一致!'
	}
});