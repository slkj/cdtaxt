package cn.slkj.cdtaxt.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.Vehicle;

public interface VehicleService {
	List<Vehicle> getAllList(HashMap<String, Object> hashMap, PageBounds pageBounds);

	int save(Vehicle vehicle);

	Vehicle queryOne(HashMap<String, Object> hashMap);

	int edit(Vehicle vehicle);
	
	public void exportExcel(HashMap<String, Object> map, String[] titles, ServletOutputStream outputStream);
	
	List<Vehicle> getList(HashMap<String, Object> hashMap);
}
