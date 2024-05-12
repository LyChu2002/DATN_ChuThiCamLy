package vn.babycare.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.babycare.constant.FilePath;
import vn.babycare.dto.search.ProductSearch;
import vn.babycare.dto.search.VendorSearch;
import vn.babycare.dto.search.WarehouseSearch;
import vn.babycare.model.Product;
import vn.babycare.model.ProductImage;
import vn.babycare.model.Vendor;
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
	
	public List<Product> findAllHot(){
		String sql = "SELECT * FROM product WHERE status = 1 and is_hot = 1";
		return super.executeNativeSql(sql);
	}
	
	public Product findByCode(String code) {
		String sql = "SELECT * FROM product WHERE code = '" + code + "'";
		return super.getEntityByNativeSQL(sql);
	}
	
	public List<Product> findAllByType(int idTypeProduct){
		String sql = "SELECT * FROM product WHERE status = 1 and id_type_product = " + idTypeProduct;
		return super.executeNativeSql(sql);
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
	
	//search warehouse product
	public List<Product> searchWarehouseProduct(WarehouseSearch warehouseSearch){
		String sql = "SELECT * FROM product p WHERE p.status = 1 ";
		if(!StringUtils.isEmpty(warehouseSearch.getCode())) {
			sql += " AND p.code = '" + warehouseSearch.getCode() + "' ";
		}
		if(!StringUtils.isEmpty(warehouseSearch.getName())) {
			String name = warehouseSearch.getName().toLowerCase();
			sql += "AND (LOWER(p.name) LIKE '%" + name + "%') ";
		}
		if(warehouseSearch.getWarehouseStatus() != 2) {
			if(warehouseSearch.getWarehouseStatus() == 1) {
				sql += "AND p.warehouse_quantity > 0 ";
			}
			else {
				sql += "AND p.warehouse_quantity <= 0 ";
			}
		}
		if(warehouseSearch.getSortQuantity() != 2) {
			if(warehouseSearch.getSortQuantity() == 1) {
				sql += "ORDER BY p.warehouse_quantity asc ";
			}
			else {
				sql += "ORDER BY p.warehouse_quantity desc ";
			}
		}
		return super.executeNativeSql(sql);
	}
	
	//search product
	public List<Product> searchProduct(ProductSearch productSearch){
		String sql = "SELECT * FROM product p WHERE 1=1 ";
		if(productSearch.getStatus() != 2) {
			sql += " AND p.status = " + productSearch.getStatus();
		}
		
		if(!StringUtils.isEmpty(productSearch.getCode())) {
			sql += " AND p.code = '" + productSearch.getCode() + "'";
		}
		
		if(!StringUtils.isEmpty(productSearch.getName())) {
			String name = productSearch.getName().toLowerCase();
			sql += " AND (LOWER(p.name) like '%" + name + "%')";
		}
		return super.executeNativeSql(sql);
	}
	
	//search by name
	public List<Product> searchProductByName(ProductSearch productSearch){
		String sql = "SELECT * FROM product p WHERE p.status = 1";
		if(!StringUtils.isEmpty(productSearch.getName())) {
			String name = productSearch.getName().toLowerCase();
			sql += " AND (LOWER(p.name) LIKE '%" + name + "%')";
		}
		return super.executeNativeSql(sql);
	}
}
