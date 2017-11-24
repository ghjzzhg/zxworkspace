package cn.zx.ghjmaven.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;

import cn.zx.ghjmaven.domain.Employee;
import cn.zx.ghjmaven.domain.Itemer;


public interface EmployeeService {
	void save(Employee employee);
	
	Page<Employee> pageQuery(PageRequest pageRequest);

	void bacthDelete(String ids);

	List<Employee> findEmployeeInUse();

	List<Employee> findEmployeeByMember();

	List<Employee> findEmployeeByManager();

	Page<Employee> pageQuery(Specification<Employee> spec,PageRequest pageRequest);

	
	

//	public void delete(Employee employee);
//
//	public void delete(String id);
//
//	public void update(Employee employee);
//
//	public Employee findEmployeeById(String id);
//
//	public List<Employee> findAll();
}
