$(function() {
	loadModuleData();
	tabCloseEven();
	addTab("我的工作台", "comm/Welcome", "icon tu1112", false);
	$('ul li a').click(function() {
		var tabTitle = $(this).text();
		var url = $(this).attr("rel"); // 获取地址
		var id = $(this).attr("id"); // 获取id
		var icon = $(this).attr("icon"); // 获取图标
		addTab(tabTitle, url, icon, true, id);
	});
	$('#loginOut').click(function() {
		$.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

			if (r) {
				location.href = 'login_toLogin';
			}
		});
	});
});
var _menus;
/* ajax获取菜单数据 */
function loadModuleData() {
	$.ajax({
		url : "module/listByUser",
		async : false,
		dataType : "json",
		cache : false,
		success : function(data) {
			if (data.length > 0) {
				_menus = data;
				addNav(data);
			}
		}
	});
}
// 左侧导航加载
function addNav(data) {
	$.each(data, function(i, sm) {
		var menulist1 = "";
		// sm 常用菜单 邮件 列表
		menulist1 = GetMenuList(sm, menulist1);
		menulist1 = '<ul id="tt" class="easyui-tree" data-options="animate:true,lines:false">' + menulist1.substring(4);
		$('#wnav').accordion('add', {
			title : sm.name,
			content : menulist1,
			iconCls :  'icon ' +sm.icon
		});

	});
	var pp = $('#wnav').accordion('panels');
	var t = pp[0].panel('options').title;
	$('#wnav').accordion('select', t);

}

function GetMenuList(data, menulist) {
	if (data.children == null) {
		return menulist;
	} else {
		menulist += '<ul>';
		$.each(data.children, function(i, sm) {
			if (sm.url != "") {
				menulist += '<li iconCls="icon ' + sm.icon + '"><span ><a icon="icon '+sm.icon+'" rel="' + sm.url + '" href="#"  name="' + sm.name + '" ref="' + sm.id + '">' + sm.name + '</a></span>';
			} else {
				menulist += '<li><span  class="icon ' + sm.icon + '">' + sm.name + '</span>'
			}
			menulist = GetMenuList(sm, menulist);
		})
		menulist += '</ul>';
	}
	return menulist;
}
function addTab(subtitle, url, icon, closable, id) {
	if (!$('#tabs').tabs('exists', subtitle)) {
		$('#tabs').tabs('add', {
			title : subtitle,
			content : createFrame(url, id),
			closable : closable,
			icon : icon
		});
	} else {
		$('#tabs').tabs('select', subtitle);

	}
	tabClose();
}

function createFrame(url, id) {
	var s = '<iframe id="' + id + '" scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:99%;overflow-y: auto; "></iframe>';
	return s;
}
function tabClose() {
	/* 双击关闭TAB选项卡 */
	$(".tabs-inner").dblclick(function() {
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close', subtitle);
	})
	/* 为选项卡绑定右键 */
	$(".tabs-inner").bind('contextmenu', function(e) {
		$('#mm').menu('show', {
			left : e.pageX,
			top : e.pageY
		});

		var subtitle = $(this).children(".tabs-closable").text();

		$('#mm').data("currtab", subtitle);
		$('#tabs').tabs('select', subtitle);
		return false;
	});
}
// 绑定右键菜单事件
function tabCloseEven() {
	// 刷新
	$('#mm-tabupdate').click(function() {
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		var id = $(currTab.panel('options').content).attr('id');
		; // 获取id

		$('#tabs').tabs('update', {
			tab : currTab,
			options : {
				content : createFrame(url, id)
			}
		})
	})
	// 关闭
	$('#mm-tabclose').click(function() {
		var currtab_title = $('#mm').data("currtab");
		$('#tabs').tabs('close', currtab_title);
	})
	// 关闭其他
	$('#closeother').click(function() {
		// 所有所有tab对象
		var allTabs = $('#tabs').tabs('tabs');
		var currentTab = $('#tabs').tabs('getSelected');
		var currtab_title = currentTab.panel('options').title;

		for (var i = (allTabs.length - 1); i >= 0; i--) {

			var tab = allTabs[i];
			var opt = tab.panel('options');
			// 获取标题
			var title = opt.title;
			if (currtab_title == title) {
				continue;
			}
			// 是否可关闭 ture:会显示一个关闭按钮，点击该按钮将关闭选项卡
			var closable = opt.closable;
			if (closable) {
				// alert('title' + title + ' curTabTitle:' + curTabTitle);
				$('#tabs').tabs('close', title);
			}

		}
	})
	// 全部关闭
	$('#mm-tabAllclose').click(function() {
		// 所有所有tab对象
		var allTabs = $('#tabs').tabs('tabs');
		for (var i = (allTabs.length - 1); i >= 0; i--) {
			var tab = allTabs[i];
			var opt = tab.panel('options');
			// 获取标题
			var title = opt.title;
			// 是否可关闭 ture:会显示一个关闭按钮，点击该按钮将关闭选项卡
			var closable = opt.closable;
			if (closable) {
				// alert('title' + title + ' curTabTitle:' + curTabTitle);
				$('#tabs').tabs('close', title);
			}

		}
	})
}