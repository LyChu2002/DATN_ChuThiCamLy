package vn.babycare.service;

import org.springframework.stereotype.Service;

import vn.babycare.model.Order;

@Service
public class OrderService extends BaseService<Order>{

	@Override
	public Class<Order> clazz() {
		// TODO Auto-generated method stub
		return Order.class;
	}

}
