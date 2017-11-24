package cn.zx.ghjmaven.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.zx.ghjmaven.dao.AttenceDao;
import cn.zx.ghjmaven.domain.Attence;

@Service("attenceService")
@Transactional
public class AttenceServiceImpl implements AttenceService {
	@Autowired
	private AttenceDao attenceDao;
	public Page<Attence> pageQuery(PageRequest pageRequest) {
		return attenceDao.findAll(pageRequest);
	}
	public void save(Attence model) {
		attenceDao.save(model);
	}

}
