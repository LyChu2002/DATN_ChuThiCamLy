package vn.babycare.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.babycare.model.ProductImage;

@Service
public class ProductImageService extends BaseService<ProductImage>{

	@Override
	public Class<ProductImage> clazz() {
		// TODO Auto-generated method stub
		return ProductImage.class;
	}
	
	public List<ProductImage> findByProduct(int productId){
		String sql = "SELECT * FROM product_image WHERE status=1 and id_product = " + productId;
		return super.executeNativeSql(sql);
	}

}
