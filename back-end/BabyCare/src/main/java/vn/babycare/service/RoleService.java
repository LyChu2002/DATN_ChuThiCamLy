package vn.babycare.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.babycare.model.Role;

@Service
public class RoleService extends BaseService<Role>{

	@Override
	public Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}
	
	public List<Role> findAll(){
		String sql = "SELECT * FROM role";
		return super.executeNativeSql(sql);
	}
	
	public List<Role> findAllActive(){
		String sql = "SELECT * FROM role WHERE status = 1";
		return super.executeNativeSql(sql);
	}

	public Role getRoleByName(String name) {
		String sql = "SELECT * FROM role WHERE name = '" + name + "'";
		return super.getEntityByNativeSQL(sql);
	}
}
