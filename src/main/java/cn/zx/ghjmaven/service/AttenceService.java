package cn.zx.ghjmaven.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import cn.zx.ghjmaven.domain.Attence;
import cn.zx.ghjmaven.domain.Itemer;

public interface AttenceService {

	Page<Attence> pageQuery(PageRequest pageRequest);

	void save(Attence model);

	
}
