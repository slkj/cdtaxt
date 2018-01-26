package cn.slkj.cdtaxt.mapper;

import java.util.HashMap;
import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.User;

public interface UserMapper {
	User userLogin(HashMap<String, Object> map);

	public List<User> getAllUsers(HashMap<String, Object> hashMap, PageBounds pageBounds);

	public List<User> queryAll(HashMap<String, Object> hashMap);

	public User queryOne(HashMap<String, Object> map);

	public int save(User user);

	public int edit(User user);

	public int delete(String id);

	public User goDingLogin(String userid);

}