package cn.zx.ghjmaven.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import cn.zx.ghjmaven.domain.Customer;

public interface CustomerService {
	void save(Customer customer);

	//查询
	public Page<Customer> pageQuery(PageRequest pageRequest);
}
