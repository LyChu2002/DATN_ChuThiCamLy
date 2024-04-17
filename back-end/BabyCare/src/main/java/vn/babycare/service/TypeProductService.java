package vn.babycare.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.babycare.model.TypeProduct;

@Service
public class TypeProductService extends BaseService<TypeProduct>{

	@Override
	public Class<TypeProduct> clazz() {
		return TypeProduct.class;
	}

	public TypeProduct findByCode(String code) {
		String sql = "SELECT * FROM type_product WHERE code = '" + code + "'";
		return super.getEntityByNativeSQL(sql);
	}
	
	public List<TypeProduct> findAll(){
		String sql = "SELECT * FROM type_product";
		return super.executeNativeSql(sql);
	}
	
	public List<TypeProduct> findAllActive(){
		String sql = "SELECT * FROM type_product WHERE status = 1";
		return super.executeNativeSql(sql);
	}
	
	public List<TypeProduct> findByCategory(int idCate){
		String sql = "SELECT * FROM type_product WHERE status = 1 and id_category = " + idCate;
		return super.executeNativeSql(sql);
	}
}
