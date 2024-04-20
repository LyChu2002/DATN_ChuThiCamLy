package vn.babycare.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.babycare.model.User;

@Service
public class UserService extends BaseService<User>{

	@Override
	public Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}
	
	public List<User> findAll(){
		String sql = "SELECT * FROM user";
		return super.executeNativeSql(sql);
	}

	public List<User> findAllActive(){
		String sql = "SELECT * FROM user WHERE status = 1";
		return super.executeNativeSql(sql);
	}
	
	public User findByEmail(String email) {
		String sql = "SELECT * FROM user WHERE email = '" + email + "'";
		return super.getEntityByNativeSQL(sql);
	}
}
