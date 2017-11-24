package cn.zx.ghjmaven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.zx.ghjmaven.dao.UserDao;
import cn.zx.ghjmaven.domain.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	public void save(User user) {
		// save saveOrUpdaten判断该实体是否是一个 托管 update (iod) 还是瞬时对象 insert
		userDao.save(user);
	}

	public void delete(User user) {
		// TODO Auto-generated method stub
		userDao.delete(user);
	}

	public void delete(String id) {
		// TODO Auto-generated method stub
		userDao.delete(id);
	}

	public void update(User user) {
		// user 托管对象
		userDao.save(user);
	}

	public User findUserById(String id) {
		// TODO Auto-generated method stub
		return userDao.findOne(id);
	}

	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userDao.findAll();
	}
	
	//查询登录用户
	public User findUserByUsernameAndPassword(String username, String password) {
		return userDao.login(username,password);
	}

	public void editPassword(String password, Integer id) {
		userDao.editPassword(password,id);
	}

	public User findUserByUsername(String username) {
		return userDao.findUserByUsername(username);
	}





}
