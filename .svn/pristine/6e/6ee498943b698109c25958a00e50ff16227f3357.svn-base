package cn.zx.ghjmaven.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.zx.ghjmaven.dao.CustomerDao;
import cn.zx.ghjmaven.domain.Customer;


@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao customerDao;
	public void save(Customer model) {
		customerDao.save(model);
	}
	public Page<Customer> pageQuery(PageRequest pageRequest) {
		return customerDao.findAll(pageRequest);
	}

}
