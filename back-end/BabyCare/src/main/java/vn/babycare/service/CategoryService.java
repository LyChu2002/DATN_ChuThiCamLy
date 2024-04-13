package vn.babycare.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.babycare.model.Category;

@Service
public class CategoryService extends BaseService<Category>{

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
}
