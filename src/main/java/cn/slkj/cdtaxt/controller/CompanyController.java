package cn.slkj.cdtaxt.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import cn.slkj.cdtaxt.entity.Company;
import cn.slkj.cdtaxt.service.CompanyService;
import cn.slkj.slUtil.easyuiUtil.EPager;
import cn.slkj.slUtil.easyuiUtil.JsonResult;

@Controller
@RequestMapping(value = "/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;

	/* 跳转页面 */
	@RequestMapping("/comListPage")
	public String comListPage() {
		return "backend/company";
	}
	@RequestMapping("/comAddPage")
	public String toComAddPage() {
		return "backend/companyInfo";
	}
	
	@RequestMapping("/comEditPage")
	public String toComEditPage() {
		return "backend/editCompany";
	}
	/**
	 * 
	 * @param page
	 * @param rows
	 * @param gsmc
	 * @param location
	 * @param session
	 * @return 返回easyUI datagrid 数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/list")
	public EPager<Company> list(HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		map.put("compName", request.getParameter("compName"));
		String sortString = "id.asc";
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<Company> list = companyService.getAll(map, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<Company>(pageList.getPaginator().getTotalCount(), list);
	}

	@ResponseBody
	@RequestMapping(value = "/queryComList")
	public List<Company> queryComList(String name) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("compName", name);
		return companyService.queryComList(map);
	}

	/**
	 * 获取公司/车队实体
	 * 
	 * @param classification
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryOne")
	public Company queryOne(String id) {
		return companyService.queryOne(id);
	}

	/** 保存公司/车队 */
	@ResponseBody
	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public JsonResult save(Company company) {
		int i = companyService.save(company);
		if (i > 0) {
			return new JsonResult(true, "");
		} else {
			return new JsonResult(false, "保存失败！");
		}
	}

	/** 编辑保存 */
	@ResponseBody
	@RequestMapping(value = "/editCompany")
	public JsonResult editCompany(Company company) throws Exception {
		try {
			int i = companyService.edit(company);
			if (i > 0) {
				return new JsonResult(true, "");
			} else {
				return new JsonResult(false, "编辑失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, e.toString());
		}

	}

	/** 批量删除 */
	@ResponseBody
	@RequestMapping(value = "/delete")
	public JsonResult deletes(String id) {
		int i = companyService.delete(id);
		try {
			if (i > 0) {
				return new JsonResult(true, "");
			} else {
				return new JsonResult(false, "操作失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, e.toString());
		}

	}
}
