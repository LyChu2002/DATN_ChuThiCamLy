package vn.babycare.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vn.babycare.constant.FilePath;
import vn.babycare.model.Banner;
import vn.babycare.utils.FileUploadUtils;

@Service
public class BannerService extends BaseService<Banner>{
	@Autowired
	private FileUploadUtils fileUtils;
	
	
	@Override
	public Class<Banner> clazz() {
		// TODO Auto-generated method stub
		return Banner.class;
	}
	
	public List<Banner> findAll(){
		String sql = "SELECT * FROM banner";
		return super.executeNativeSql(sql);
	}
	
	public Banner findByCode(String code) {
		String sql = "SELECT * FROM banner WHERE code = '" + code + "'";
		return super.getEntityByNativeSQL(sql);
	}

	@Transactional
	public Banner saveNewBanner(Banner banner, MultipartFile imageFile) throws IOException{
		if(fileUtils.isUploadFile(imageFile)) {
			String path = FilePath.Url.FOLDER_UPLOAD + "Banner/Image/" + imageFile.getOriginalFilename();
			File file = new File(path);
			imageFile.transferTo(file);
			String bannerPath = "Banner/Image/" + imageFile.getOriginalFilename();
			banner.setImage(bannerPath);
			return super.saveOrUpdate(banner);
		}
		else return null;
	}
	
	@Transactional
	public Banner updateBanner(Banner banner, MultipartFile imageFile) throws IOException{
		Banner dbBanner = super.getById(banner.getId());
		if(fileUtils.isUploadFile(imageFile)) {
			String path = FilePath.Url.FOLDER_UPLOAD + "Banner/Image/" + imageFile.getOriginalFilename();
			File file = new File(path);
			file.delete();
			
			path = FilePath.Url.FOLDER_UPLOAD + "Banner/Image/" + imageFile.getOriginalFilename();
			file = new File(path);
			imageFile.transferTo(file);
			banner.setImage("Banner/Image/" + imageFile.getOriginalFilename());
		}
		else {
			banner.setImage(dbBanner.getImage());
		}
		return super.saveOrUpdate(banner);
	}
}
