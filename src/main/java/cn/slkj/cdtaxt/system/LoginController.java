package cn.slkj.cdtaxt.system;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
// @SessionAttributes(Const.SESSION_USER)
public class LoginController {

	@RequestMapping("/login_toLogin")
	public String toLogin(HttpServletRequest request) {
		return "login";
	}

	@RequestMapping("/index")
	public String index() {
		return "index";
	}

}