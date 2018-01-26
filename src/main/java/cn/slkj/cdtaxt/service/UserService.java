package cn.slkj.cdtaxt.service;

import java.util.HashMap;
import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.cdtaxt.entity.User;

public interface UserService {

	List<User> getAllUsers(HashMap<String, Object> hashMap, PageBounds pageBounds);
	
	List<User> queryAll(HashMap<String, Object> hashMap);

	public User queryOne(HashMap<String, Object> hashMap);

	public int save(User user);

	public int edit(User user);

	public int delete(String id);

	public User goDingLogin(String userid);

	User userLogin(HashMap<String, Object> map);
}
