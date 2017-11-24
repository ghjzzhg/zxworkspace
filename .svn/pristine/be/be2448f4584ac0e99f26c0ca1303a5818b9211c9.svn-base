package cn.zx.ghjmaven.dao;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import cn.zx.ghjmaven.domain.Employee;

public interface EmployeeDao extends JpaRepository<Employee, String>, JpaSpecificationExecutor<Employee>{

	@Modifying
	@Query("update Employee set deltag = '0' where id = ?")
	public void batchDelete(String id);

	@Query("from Employee where deltag = '1'")
	public List<Employee> findEmployeeInUse();

	@Query("from Employee where deltag ='1' and position = '项目专员'")
	public List<Employee> findEmployeeByMember();
	
	@Query("from Employee where deltag ='1' and position = '项目经理'")
	public List<Employee> findEmployeeByManager();

//	@Query("from Employee where deltag = '1'")
//	public Page<Employee> findAll(Specification<Employee> spec,PageRequest pageRequest);

}
