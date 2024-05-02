package vn.babycare.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vn.babycare.constant.FilePath;
import vn.babycare.model.Category;
import vn.babycare.utils.FileUploadUtils;

@Service
public class CategoryService extends BaseService<Category>{
	@Autowired
	private FileUploadUtils fileUtils;
	
	@Override
	public Class<Category> clazz() {
		// TODO Auto-generated method stub
		return Category.class;
	}
	
	public Category findByCode(String code) {
		String sql = "SELECT * FROM category WHERE code = '" + code + "'";
		return super.getEntityByNativeSQL(sql);
	}
	
	public List<Category> findAll(){
		String sql = "SELECT * FROM category ORDER BY id desc";
		return super.executeNativeSql(sql);
	}
	
	public List<Category> findAllActive(){
		String sql = "SELECT * FROM category WHERE status = 1";
		return super.executeNativeSql(sql);
	}
	
	@Transactional
	public Category saveNewCategory(Category category, MultipartFile avatarFile) throws IOException{
		if(fileUtils.isUploadFile(avatarFile)) {
			String path = FilePath.Url.FOLDER_UPLOAD + "Category/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			category.setAvatar("Category/Avatar/" + avatarFile.getOriginalFilename());
		}
		
		return super.saveOrUpdate(category);
	}
	
	@Transactional
	public Category saveUpdateCategory(Category category, MultipartFile avatarFile) throws IOException{
		Category dbCategory = super.getById(category.getId());
		if(fileUtils.isUploadFile(avatarFile)) {
			String path = FilePath.Url.FOLDER_UPLOAD + dbCategory.getAvatar();
			File file = new File(path);
			file.delete();
			
			path = FilePath.Url.FOLDER_UPLOAD + "Category/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			category.setAvatar("Category/Avatar/" + avatarFile.getOriginalFilename());
		}
		else {
			category.setAvatar(dbCategory.getAvatar());
		}
		return super.saveOrUpdate(category);
	}
}
