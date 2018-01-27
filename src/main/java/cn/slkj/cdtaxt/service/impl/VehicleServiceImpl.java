package cn.slkj.cdtaxt.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.echarts.TotalNum;
import cn.slkj.cdtaxt.entity.Vehicle;
import cn.slkj.cdtaxt.mapper.VehicleMapper;
import cn.slkj.cdtaxt.service.VehicleService;
import cn.slkj.slUtil.ExportUtil;

@Service
public class VehicleServiceImpl implements VehicleService {
	@Autowired
	private VehicleMapper mapper;

	@Override
	public List<Vehicle> getAllList(HashMap<String, Object> hashMap, PageBounds pageBounds) {
		return mapper.getAllList(hashMap, pageBounds);
	}

	@Override
	public List<Vehicle> getList(HashMap<String, Object> hashMap) {
		return mapper.getAllList(hashMap);
	}

	@Override
	public int save(Vehicle vehicle) {
		return mapper.save(vehicle);
	}

	@Override
	public Vehicle queryOne(HashMap<String, Object> hashMap) {
		return mapper.queryOne(hashMap);
	}

	@Override
	public int edit(Vehicle vehicle) {
		// TODO Auto-generated method stub
		return mapper.edit(vehicle);
	}

	/**
	 * 导出Excel
	 */
	public void exportExcel(HashMap<String, Object> map, String[] titles, ServletOutputStream outputStream) {
		List<Vehicle> list = mapper.getAllList(map);
		// 创建一个workbook 对应一个excel应用文件
		XSSFWorkbook workBook = new XSSFWorkbook();
		// 在workbook中添加一个sheet,对应Excel文件中的sheet
		XSSFSheet sheet = workBook.createSheet("车辆信息");
		ExportUtil exportUtil = new ExportUtil(workBook, sheet);
		XSSFCellStyle headStyle = exportUtil.getHeadStyle();
		XSSFCellStyle bodyStyle = exportUtil.getBodyStyle();
		// 构建表头
		XSSFRow headRow = sheet.createRow(0);
		XSSFCell cell = null;
		for (int i = 0; i < titles.length; i++) {
			cell = headRow.createCell(i);
			cell.setCellStyle(headStyle);
			cell.setCellValue(titles[i]);
		}
		// 构建表体数据
		if (list != null && list.size() > 0) {
			for (int j = 0; j < list.size(); j++) {
				XSSFRow bodyRow = sheet.createRow(j + 1);
				Vehicle ve = list.get(j);
				// 营运证号
				cell = bodyRow.createCell(0);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(ve.getTransportNo());
				// 车牌号
				cell = bodyRow.createCell(1);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(ve.getCarPlateNo());
				// 燃料类型
				cell = bodyRow.createCell(2);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(ve.getCarType2());
				// 颜色
				cell = bodyRow.createCell(3);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(ve.getCarColor());
				// 车辆品牌
				cell = bodyRow.createCell(4);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(ve.getCarBrandText());
				// 公司名称
				cell = bodyRow.createCell(5);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(ve.getCustomerName());
				// 车主
				cell = bodyRow.createCell(6);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(ve.getCarOwner());
				// 联系电话
				cell = bodyRow.createCell(7);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(ve.getCarOwnerTel());
				// 身份证号
				cell = bodyRow.createCell(8);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(ve.getDriver2());
				// 家庭住址
				cell = bodyRow.createCell(9);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue(ve.getDriver2Tel());
				// 原车号
				cell = bodyRow.createCell(10);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue("--");
				// 原车主
				cell = bodyRow.createCell(11);
				cell.setCellStyle(bodyStyle);
				cell.setCellValue("--");
			}
		}
		try {
			workBook.write(outputStream);
			outputStream.flush();
			outputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public List<TotalNum> getBarData(HashMap<String, Object> hashMap) {
		// TODO Auto-generated method stub
		return mapper.getBarData(hashMap);
	}

	@Override
	public List<TotalNum> queryByCom(HashMap<String, Object> hashMap) {
		// TODO Auto-generated method stub
		return mapper.queryByCom(hashMap);
	}
	@Override
	public List<TotalNum> queryByCarType(HashMap<String, Object> hashMap) {
		// TODO Auto-generated method stub
		return mapper.queryByCarType(hashMap);
	}
	
}
