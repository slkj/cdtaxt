package cn.slkj.slUtil;

import org.springframework.context.ApplicationContext;

/**
 * 
*/
public class Const {
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";
	public static final String SESSION_USER = "sessionUser";
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	public static final String SESSION_menuList = "menuList"; // 当前菜单
	public static final String SESSION_allmenuList = "allmenuList"; // 全部菜单
	public static final String SESSION_QX = "QX";
	public static final String SESSION_userpds = "userpds";
	public static final String SESSION_USERROL = "USERROL"; // 用户对象
	public static final String SESSION_USERNAME = "USERNAME"; // 用户名
	public static final String TRUE = "T";
	public static final String FALSE = "F";
	public static final String LOGIN = "/login_toLogin"; // 登录地址
	public static final String SYSNAME = "config/SYSNAME.txt"; // 系统名称路径
	public static final String PAGE = "config/PAGE.txt"; // 分页条数配置路径
	public static final String EMAIL = "config/EMAIL.txt"; // 邮箱服务器配置路径
	public static final String SMS1 = "config/SMS1.txt"; // 短信账户配置路径1
	public static final String SMS2 = "config/SMS2.txt"; // 短信账户配置路径2
	public static final String FWATERM = "config/FWATERM.txt"; // 文字水印配置路径
	public static final String IWATERM = "aconfig/IWATERM.txt"; // 图片水印配置路径
	public static final String WEIXIN = "config/WEIXIN.txt"; // 微信配置路径
	public static final String WEBSOCKET = "config/WEBSOCKET.txt";// WEBSOCKET配置路径
	public static final String FILEPATHIMG = "uploadFiles/uploadImgs/"; // 图片上传路径
	public static final String FILEPATHFILE = "uploadFiles/file/"; // 文件上传路径
	public static final String FILEPATHTWODIMENSIONCODE = "uploadFiles/twoDimensionCode/"; // 二维码存放路径
	public static final String NO_INTERCEPTOR_PATH = "\b|.*/((login)|(logout)|(weixin)|(excel)|(appweb)|(css)|(data)|(js)|(easyui)|(images)).*"; // 不对匹配该值的访问路径拦截（正则）

	public static ApplicationContext WEB_APP_CONTEXT = null; // 该值会在web容器启动时由WebAppContextListener初始化

}
