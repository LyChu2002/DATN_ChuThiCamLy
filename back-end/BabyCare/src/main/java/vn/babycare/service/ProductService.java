package vn.babycare.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vn.babycare.constant.FilePath;
import vn.babycare.model.Product;
import vn.babycare.model.ProductImage;
import vn.babycare.utils.FileUploadUtils;

@Service
public class ProductService extends BaseService<Product>{
	@Autowired
	private FileUploadUtils fileUtils;
	
	@Override
	public Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}

	public List<Product> findAll(){
		String sql = "SELECT * FROM product ORDER BY id desc";
		return super.executeNativeSql(sql);
	}
	
	public List<Product> findAllActive(){
		String sql = "SELECT * FROM product WHERE status = 1";
		return super.executeNativeSql(sql);
	}
	
	public Product findByCode(String code) {
		String sql = "SELECT * FROM product WHERE code = '" + code + "'";
		return super.getEntityByNativeSQL(sql);
	}
	
	@Transactional
	public Product saveNewProduct(Product product, MultipartFile avatarFile, MultipartFile[] imageFiles) throws IOException{
		if(fileUtils.isUploadFile(avatarFile)) {
			String path = FilePath.Url.FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}
		
		if(fileUtils.isUploadFiles(imageFiles)) {
			for(MultipartFile imageFile : imageFiles) {
				if(fileUtils.isUploadFile(imageFile)) {
					String path = FilePath.Url.FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imageFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imageFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					product.addRelationalProductImage(productImage);
				}
			}
		}
		return super.saveOrUpdate(product);
	}
	
	@Transactional
	public Product saveUpdateProduct(Product product, MultipartFile avatarFile, MultipartFile[] imageFiles) throws IOException{
		Product dbProduct = super.getById(product.getId());
		if(fileUtils.isUploadFile(avatarFile)) {
			String path = FilePath.Url.FOLDER_UPLOAD + dbProduct.getAvatar();
			File file = new File(path);
			file.delete();
			
			path = FilePath.Url.FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}
		else {
			product.setAvatar(dbProduct.getAvatar());
		}
		if(fileUtils.isUploadFiles(imageFiles)) {
			for(MultipartFile imaFile : imageFiles) {
				if(fileUtils.isUploadFile(imaFile)) {
					String path = FilePath.Url.FOLDER_UPLOAD + "Product/Image/" + imaFile.getOriginalFilename();
					File file = new File(path);
					imaFile.transferTo(file);
					ProductImage productImage = new ProductImage();
					productImage.setTitle(imaFile.getOriginalFilename());
					productImage.setPath("Product/Image/" + imaFile.getOriginalFilename());
					productImage.setStatus(Boolean.TRUE);
					productImage.setCreateDate(new Date());
					product.addRelationalProductImage(productImage);
				}
			}
		}
		return super.saveOrUpdate(product);
	}
	
}
