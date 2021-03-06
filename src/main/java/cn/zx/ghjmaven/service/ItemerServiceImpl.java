package cn.zx.ghjmaven.service;

import java.io.File;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.zx.ghjmaven.dao.ItemerDao;
import cn.zx.ghjmaven.domain.Itemer;
import cn.zx.ghjmaven.domain.UploadState;
import cn.zx.ghjmaven.utils.UploadFileUtils;

@Service("itemerService")
@Transactional
public class ItemerServiceImpl implements ItemerService {

	@Autowired
	private ItemerDao itemerDao;
	public Page<Itemer> pageQuery(PageRequest pageRequest) {
		return itemerDao.findAll(pageRequest);
	}
	private Itemer itemer;
	public void save(Itemer model) {
		try {
//			UploadFileUtils.validTypeByName4Others(itemer.getFileName());
//			UploadState upload4Stream = UploadFileUtils.upload4Stream(itemer.getFile().getName(), itemer.getFile().getPath(), itemer.getFile());
//			System.out.println(upload4Stream);
			itemerDao.save(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void batchDelete(String ids) {
		if (StringUtils.isNotBlank(ids)) {
			String[] idsArr = ids.split(",");
			for (int i = 0; i < idsArr.length; i++) {
				System.out.println(idsArr[i]);
				itemerDao.delete(idsArr[i]);
			}
		}
	}
	public List<Itemer> findItemerInuse() {
		return itemerDao.findItemerInuse();
	}
	public void batchImport(List<Itemer> itemers) {
		itemerDao.save(itemers);
	}

}
