package vn.babycare.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.babycare.model.Order;

@Service
public class OrderService extends BaseService<Order>{

	@Override
	public Class<Order> clazz() {
		// TODO Auto-generated method stub
		return Order.class;
	}
	
	public List<Order> findAll(){
		String sql = "SELECT * FROM sale_order ORDER BY id desc";
		return super.executeNativeSql(sql);
	}

}
