package cn.slkj.cdtaxt.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import cn.slkj.cdtaxt.echarts.EchartData;
import cn.slkj.cdtaxt.echarts.Series;
import cn.slkj.cdtaxt.echarts.TotalNum;
import cn.slkj.cdtaxt.entity.Vehicle;
import cn.slkj.cdtaxt.service.VehicleService;
import cn.slkj.slUtil.easyuiUtil.EPager;
import cn.slkj.slUtil.easyuiUtil.JsonResult;

/**
 * 
 * @ClassName: UserController
 * @Description: 用户信息
 * @author maxh
 *
 */
@Controller
@RequestMapping(value = "/vehicle")
public class VehicleController {
	@Autowired
	private VehicleService vehicleService;

	/* 跳转页面 */
	@RequestMapping("/vehicleListPage")
	public String toCarListPage() {
		return "vehicle/vehicleList";
	}

	@RequestMapping("/vehicleFormPage")
	public String toVehicleFormPage() {
		return "vehicle/vehicleForm";
	}

	/**
	 * 查询用户列表，返回easyUI数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/list", method = { RequestMethod.POST })
	public EPager<Vehicle> getAllUsers(HttpServletRequest request, HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page, // 第几页
			@RequestParam(required = false, defaultValue = "20") Integer rows) {
		String sortString = "";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("carPlateNo", request.getParameter("carPlateNo"));
		hashMap.put("transportNo", request.getParameter("transportNo"));
		hashMap.put("carOwner", request.getParameter("carOwner"));
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<Vehicle> list = vehicleService.getAllList(hashMap, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<Vehicle>(pageList.getPaginator().getTotalCount(), list);
	}

	/**
	 * 查询单条信息
	 */
	@ResponseBody
	@RequestMapping(value = "/queryOne", method = { RequestMethod.POST })
	public Vehicle queryOne(String id) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("id", id);
		Vehicle vehicle = vehicleService.queryOne(hashMap);
		return vehicle;
	}

	/**
	 * 保存车辆信息
	 * 
	 * @param vehicle
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public JsonResult save(Vehicle vehicle, HttpServletRequest request) {
		try {
			int i = -1;
			HttpSession session = request.getSession();
			i = vehicleService.save(vehicle);
			if (i != -1) {
				return new JsonResult(true, "添加成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, e.toString());
		}
		return new JsonResult(false, "添加失败！");
	}

	/**
	 * 编辑车辆信息
	 * 
	 * @param vehicle
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public JsonResult editVehicle(Vehicle vehicle) {
		try {
			int i = -1;
			i = vehicleService.edit(vehicle);
			if (i != -1) {
				return new JsonResult(true, "操作成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, e.toString());
		}
		return new JsonResult(false, "操作失败！");
	}

	@RequestMapping("/getWithImage")
	public void getWithImage(String imageType, String pkey, HttpServletResponse response, HttpServletRequest request) throws Exception {
		// 根据id获取车辆信息
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("id", pkey);
		Vehicle vehicle = vehicleService.queryOne(hashMap);
		String carPotoPath = "";

		switch (imageType) {
		case "carOwnerPhoto":
			carPotoPath = vehicle.getCarOwnerPhoto();
			break;
		case "carPhoto":
			carPotoPath = vehicle.getCarPhoto();
			break;
		case "certificatePhoto":
			carPotoPath = vehicle.getCertificatePhoto();
			break;
		case "certificatePhoto2":
			carPotoPath = vehicle.getCertificatePhoto2();
			break;
		case "driverPhoto":
			carPotoPath = vehicle.getDriverPhoto();
			break;
		}
		if (carPotoPath == null) {
			return;
		}
		String baseFilePath = "D:\\weblogs\\cdtaxt\\";
		// 返回照片流
		// 设置响应头:内容处理方式 → attachment(附件,有为下载,没有为预览加载) →指定文件名
		// response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
		// 从服务器上下载图片,要找到图片在服务器中的真实位置
		// 从服务器上读入程序中
		InputStream fileInputStream = new FileInputStream(baseFilePath + carPotoPath);
		// 从程序中写出下载到客户端
		OutputStream outputStream = response.getOutputStream();
		// copy以及关闭流资源
		IOUtils.copy(fileInputStream, outputStream);
		outputStream.close();
		fileInputStream.close();

	}

	/**
	 * 导出设备汇总表
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/exporsb")
	public String exporsb(HttpServletResponse response, HttpServletRequest request) {
		response.setContentType("application/binary;charset=ISO8859_1");
		try {
			ServletOutputStream outputStream = response.getOutputStream();
			String fileName = new String(("车辆信息").getBytes(), "ISO8859_1");
			response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xlsx");// 组装附件名称和格式
			String[] titles = { "营运证号", "车牌号", "燃料类型", "颜色", "车辆品牌", "公司名称", "车主", "联系电话", "身份证号", "家庭住址", "原车号", "原车主" };
			HashMap<String, Object> pageMap = new HashMap<String, Object>();
			pageMap.put("rktime", request.getParameter("rktime"));
			pageMap.put("rktime1", request.getParameter("rktime1"));
			pageMap.put("lytime", request.getParameter("lytime"));
			pageMap.put("lytime1", request.getParameter("lytime1"));
			pageMap.put("fhtime", request.getParameter("fhtime"));
			pageMap.put("fhtime1", request.getParameter("fhtime1"));
			pageMap.put("state", request.getParameter("state"));
			pageMap.put("ustate", request.getParameter("ustate"));
			pageMap.put("lyr", request.getParameter("lyr"));
			pageMap.put("firm", request.getParameter("firm"));
			pageMap.put("listnum", request.getParameter("listnum"));
			pageMap.put("carNumber", request.getParameter("carNumber"));
			pageMap.put("model", request.getParameter("model"));
			pageMap.put("simNumber", request.getParameter("simNumber"));
			pageMap.put("inspector", request.getParameter("inspector"));
			
			vehicleService.exportExcel(pageMap, titles, outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	   /**
     * 饼状图
     * @param <T>
     * @return
     */
    @RequestMapping("/showEchartBar")
    @ResponseBody
    public EchartData BarData() {
        System.out.println("柱状图");
        List<String> category = new ArrayList<String>();
        List<Long> serisData=new ArrayList<Long>();
        HashMap<String, Object> hashMap = new HashMap<>();
		List<TotalNum> list = vehicleService.getBarData(hashMap );
		 for (TotalNum totalNum : list) {
	            category.add(totalNum.getWeek());
	            serisData.add(totalNum.getCount());
	        }
        List<String> legend = new ArrayList<String>(Arrays.asList(new String[] { "合计" }));// 数据分组
        List<Series> series = new ArrayList<Series>();// 纵坐标
        series.add(new Series("合计", "bar", serisData));
        EchartData data = new EchartData(legend, category, series);
        return data;
    }
    @RequestMapping("/queryByCom")
    @ResponseBody
    public List<TotalNum>  queryByCom() {
    	HashMap<String, Object> hashMap = new HashMap<>();
    	List<TotalNum> list = vehicleService.queryByCom(hashMap );
        return list;
    }
    @RequestMapping("/queryByCarType")
    @ResponseBody
    public List<TotalNum>  queryByCarType() {
    	HashMap<String, Object> hashMap = new HashMap<>();
    	List<TotalNum> list = vehicleService.queryByCarType(hashMap );
        return list;
    }
    
}
