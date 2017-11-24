package cn.zx.ghjmaven.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import cn.zx.ghjmaven.domain.User;

public interface UserDao extends JpaRepository<User, String>{
	
//	//添加员工
//	S save(User user);
//	
//	//查询员工
//	List<User> findAll();

//	User findUserByUsernameAndPassword(String username, Integer password);
	@Query(value = "select * from zxuser where username = ?1 and password = ?2", nativeQuery = true)
	User login(String username, String password);
	
	@Modifying
	@Query(value = "update User set password = ?1 where id = ?2")
	void editPassword(String password, Integer id);
	
	@Query("from User where username = ?")
	User findUserByUsername(String username);
	
}
