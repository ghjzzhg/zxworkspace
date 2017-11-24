package cn.zx.ghjmaven.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import cn.zx.ghjmaven.domain.Itemer;

public interface ItemerService {

	Page<Itemer> pageQuery(PageRequest pageRequest);

	void save(Itemer model);

	void batchDelete(String ids);

	List<Itemer> findItemerInuse();

	void batchImport(List<Itemer> itemers);
	
}
