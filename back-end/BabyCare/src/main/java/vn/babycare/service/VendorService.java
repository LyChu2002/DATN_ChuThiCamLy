package vn.babycare.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.babycare.constant.FilePath;
import vn.babycare.dto.search.VendorSearch;
import vn.babycare.model.Vendor;
import vn.babycare.utils.FileUploadUtils;

@Service
public class VendorService extends BaseService<Vendor>{
	@Autowired
	private FileUploadUtils fileUtils;
	
	@Override
	public Class<Vendor> clazz() {
		// TODO Auto-generated method stub
		return Vendor.class;
	}
	
	public Vendor findByCode(String code) {
		String sql = "SELECT * FROM vendor WHERE code = '" + code + "'";
		return super.getEntityByNativeSQL(sql);
	}
	
	public List<Vendor> findAllActive(){
		String sql = "SELECT * FROM vendor WHERE status = 1";
		return super.executeNativeSql(sql);
	}
	
	public List<Vendor> findAll(){
		String sql = "SELECT * FROM vendor";
		return super.executeNativeSql(sql);
	}

	@Transactional
	public Vendor saveNewVendor(Vendor vendor, MultipartFile imageFile) throws IOException{
		if(fileUtils.isUploadFile(imageFile)) {
			String path = FilePath.Url.FOLDER_UPLOAD + "Vendor/Image/" + imageFile.getOriginalFilename();
			File file = new File(path);
			imageFile.transferTo(file);
			String imageVendor = "Vendor/Image/" + imageFile.getOriginalFilename();
			vendor.setImage(imageVendor);
		}
		return super.saveOrUpdate(vendor);
	}
	
	@Transactional
	public Vendor updateVendor(Vendor vendor, MultipartFile imageFile) throws IOException{
		Vendor dbVendor = super.getById(vendor.getId());
		if(fileUtils.isUploadFile(imageFile)) {
			String path = FilePath.Url.FOLDER_UPLOAD + vendor.getImage();
			File file = new File(path);
			file.delete();
			
			path = FilePath.Url.FOLDER_UPLOAD + "Vendor/Image/" + imageFile.getOriginalFilename();
			file = new File(path);
			imageFile.transferTo(file);
			vendor.setImage("Vendor/Image/" + imageFile.getOriginalFilename());
		}
		else {
			vendor.setImage(dbVendor.getImage());
		}
		return super.saveOrUpdate(vendor);
	}
	
	//Search vendor
	public List<Vendor> searchVendor(VendorSearch vendorSearch){
		String sql = "SELECT * FROM vendor v WHERE 1=1 ";
		if(vendorSearch.getStatus() != 2) {
			sql += " AND v.status = " + vendorSearch.getStatus();
		}
		
		if(!StringUtils.isEmpty(vendorSearch.getKeyword())) {
			String keyword = vendorSearch.getKeyword().toLowerCase();
			sql += " AND (LOWER(v.name) like '%" + keyword + "%')";
		}
		return super.executeNativeSql(sql);
	}
}
