package vn.babycare.service;

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
}
