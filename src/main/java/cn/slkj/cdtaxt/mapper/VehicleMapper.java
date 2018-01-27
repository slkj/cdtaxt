package cn.slkj.cdtaxt.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.echarts.TotalNum;
import cn.slkj.cdtaxt.entity.Vehicle;
@Repository
public interface VehicleMapper {

	public List<Vehicle> getAllList(HashMap<String, Object> hashMap, PageBounds pageBounds);

	public int save(Vehicle vehicle);

	public Vehicle queryOne(HashMap<String, Object> hashMap);

	public int edit(Vehicle vehicle);

	public List<Vehicle> getAllList(HashMap<String, Object> hashMap);

	public List<TotalNum> getBarData(HashMap<String, Object> hashMap);

	public List<TotalNum> queryByCom(HashMap<String, Object> hashMap);
	public List<TotalNum> queryByCarType(HashMap<String, Object> hashMap);
}