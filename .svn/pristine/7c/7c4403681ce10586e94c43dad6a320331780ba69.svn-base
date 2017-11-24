package cn.zx.ghjmaven.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.zx.ghjmaven.dao.EmployeeDao;
import cn.zx.ghjmaven.domain.Employee;


@Service("employeeService")
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeDao employeeDao;

	public void save(Employee model) {
		employeeDao.save(model);
	}

	public Page<Employee> pageQuery(PageRequest pageRequest) {
		return employeeDao.findAll(pageRequest);
	}

	public void bacthDelete(String ids) {
		if (StringUtils.isNotBlank(ids)) {
			String[] delIds = ids.split(",");
			for (int i = 0; i < delIds.length; i++) {
				employeeDao.batchDelete(delIds[i]);
			}
		}
	}

	public List<Employee> findEmployeeInUse() {
		return employeeDao.findEmployeeInUse();
	}

	public List<Employee> findEmployeeByMember() {
		return employeeDao.findEmployeeByMember();
	}

	public List<Employee> findEmployeeByManager() {
		return employeeDao.findEmployeeByManager();
	}

	public Page<Employee> pageQuery(Specification<Employee> spec,PageRequest pageRequest) {
		return employeeDao.findAll(spec, pageRequest);
	}

//	@Override
//	public void delete(Employee employee) {
//		employeeDao.delete(employee);
//	}
//
//	@Override
//	public void delete(String id) {
//		employeeDao.deleteEmployeeById(id);
//	}
//
//	@Override
//	public void update(Employee employee) {
//		employeeDao.updateEmployee(employee);
//	}
//
//	@Override
//	public Employee findEmployeeById(String id) {
//		return employeeDao.findEmployeeById(id);
//	}
//
//	@Override
//	public List<Employee> findAll() {
//		return employeeDao.findAll();
//	}

}
