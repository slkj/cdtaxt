package cn.slkj.cdtaxt.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import cn.slkj.cdtaxt.entity.User;
import cn.slkj.cdtaxt.service.UserService;
import cn.slkj.slUtil.Const;
import cn.slkj.slUtil.UuidUtil;
import cn.slkj.slUtil.easyuiUtil.EPager;
import cn.slkj.slUtil.easyuiUtil.JsonResult;
import cn.slkj.slUtil.javaUtil.date.DateStyle;
import cn.slkj.slUtil.javaUtil.date.DateUtil;

/**
 * 
 * @ClassName: UserController
 * @Description: 用户信息
 * @author maxh
 *
 */
@Controller
@RequestMapping(value = "/user")
@SessionAttributes("userSession")
public class UserController {
	@Resource
	private UserService userService;

	/* 跳转页面 */
	@RequestMapping("/userListPage")
	public String toUserPage() {
		return "backend/user/userList";
	}

	/* 跳转页面 */
	@RequestMapping("/userAddPage")
	public String toUserAddPage() {
		return "backend/user/userInfo";
	}

	/**
	 * 查询用户列表，返回easyUI数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/list", method = { RequestMethod.POST })
	public EPager<User> getAllUsers(HttpServletRequest request, HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page, // 第几页
			@RequestParam(required = false, defaultValue = "15") Integer rows) {
		String sortString = "create_time.desc";
		String status = request.getParameter("status");
		String username = request.getParameter("username");
		String departcode = request.getParameter("dcode");
		String realname = request.getParameter("realname");
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("status", status);
		hashMap.put("username", username);
		hashMap.put("realname", realname);
		hashMap.put("departcode", departcode);
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<User> list = userService.getAllUsers(hashMap, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<User>(pageList.getPaginator().getTotalCount(), list);
	}

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public JsonResult login(HttpSession session, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("username", request.getParameter("username"));
		map.put("password", request.getParameter("password"));
		User user = userService.userLogin(map);
		if (user != null) {
			session.removeAttribute(Const.SESSION_USER);
			session.setAttribute(Const.SESSION_USER, user);
			return new JsonResult(true, "登录成功！");
		}
		return new JsonResult(false, "登录失败！");

	}

	/**
	 * 保存用户信息
	 * 
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public JsonResult save(User user) {
		try {
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("username", user.getUsername().trim());
			User u = userService.queryOne(hashMap);
			user.setPassword("000000");
			int i = -1;
			if (u != null) {
				return new JsonResult(false, "用户已经存在，请重新填写。");
			} else {
				user.setPassword("000000");
				user.setCreate_time(DateUtil.DateToString(new Date(), DateStyle.YYYY_MM_DD));
				i = userService.save(user);
			}
			if (i != -1) {
				return new JsonResult(true, "用户创建成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, e.toString());
		}
		return new JsonResult(false, "创建失败！");
	}

	/**
	 * 
	 * @Title: editUser @Description: 编辑用户信息 @param user @return JsonResult @throws
	 */
	@ResponseBody
	@RequestMapping(value = "/editUser", method = RequestMethod.POST)
	public JsonResult editUser(User user) {
		try {
			int i = -1;
			i = userService.edit(user);
			if (i != -1) {
				// if (!StringUtil.isEmpty(user.getRoleId())) {
				// saveRole(user.getId(), user.getRoleId());
				// }
				return new JsonResult(true, "操作成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "操作异常！");
		}
		return new JsonResult(false, "操作失败！");
	}

	/**
	 * 删除用户
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/delete")
	public JsonResult deletes(String id) {
		int i = userService.delete(id);
		try {
			if (i > 0) {
				return new JsonResult(true, "删除成功。");
			} else {
				return new JsonResult(false, "删除失败。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "操作异常。");
		}
	}
}
