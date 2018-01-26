package cn.slkj.cdtaxt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/writ")
public class WritController {
	/* 跳转页面 */
	@RequestMapping("/writAddPage")
	public String toWritAddPage() {
		return "writ/writAdd";
	}
	
	/* 跳转页面 */
	@RequestMapping("/writListPage")
	public String toWritListPage() {
		return "writ/writList";
	}
}
