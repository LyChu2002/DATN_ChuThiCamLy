package vn.babycare.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vn.babycare.constant.FilePath;
import vn.babycare.model.Blog;
import vn.babycare.utils.FileUploadUtils;

@Service
public class BlogService extends BaseService<Blog>{
	@Autowired
	private FileUploadUtils fileUtils;
	
	@Override
	public Class<Blog> clazz() {
		// TODO Auto-generated method stub
		return Blog.class;
	}

	public List<Blog> findAll(){
		String sql = "SELECT * FROM blog";
		return super.executeNativeSql(sql);
	}
	
	public List<Blog> findAllActive(){
		String sql = "SELECT * FROM blog WHERE status = 1";
		return super.executeNativeSql(sql);
	}
	
	public List<Blog> findTopNew(){
		String sql = "SELECT * FROM blog WHERE status = 1 ORDER BY create_date desc LIMIT 4";
		return super.executeNativeSql(sql);
	}
	

	@Transactional
	public Blog saveNewBlog(Blog blog, MultipartFile imageFile) throws IOException{
		if(fileUtils.isUploadFile(imageFile)) {
			String path = FilePath.Url.FOLDER_UPLOAD + "Blog/Image/" + imageFile.getOriginalFilename();
			File file = new File(path);
			imageFile.transferTo(file);
			String imageVendor = "Blog/Image/" + imageFile.getOriginalFilename();
			blog.setAvatar(imageVendor);
		}
		return super.saveOrUpdate(blog);
	}
	
	@Transactional
	public Blog updateBlog(Blog blog, MultipartFile imageFile) throws IOException{
		Blog dbBlog = super.getById(blog.getId());
		if(fileUtils.isUploadFile(imageFile)) {
			String path = FilePath.Url.FOLDER_UPLOAD + blog.getAvatar();
			File file = new File(path);
			file.delete();
			
			path = FilePath.Url.FOLDER_UPLOAD + "Blog/Image/" + imageFile.getOriginalFilename();
			file = new File(path);
			imageFile.transferTo(file);
			blog.setAvatar("Blog/Image/" + imageFile.getOriginalFilename());
		}
		else {
			blog.setAvatar(dbBlog.getAvatar());
		}
		return super.saveOrUpdate(blog);
	}
}
