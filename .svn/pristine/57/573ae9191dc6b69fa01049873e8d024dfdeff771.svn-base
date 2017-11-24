package cn.zx.ghjmaven.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import cn.zx.ghjmaven.domain.Employee;
import cn.zx.ghjmaven.domain.Itemer;

public interface ItemerDao extends JpaRepository<Itemer, String>{
	
//	@Query("from Itemer where date_format=%y-%M-%d")
//	public Itemer findAll(String iid);
	
	@Modifying
	@Query("delete from Itemer where iid = ?")
	public void delete(String iid);


	@Query("from Employee where deltag = '1'")
	public List<Employee> findEmployeeInUse();
	
	@Query("from Itemer where status = '1'")
	public List<Itemer> findItemerInuse();
	
//	@Query("from Employee where deltag = '1'")
//	public List<Employee> findEmployeeInUse();
}
