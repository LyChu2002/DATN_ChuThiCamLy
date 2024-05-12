package vn.babycare.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import vn.babycare.dto.search.OrderSearch;
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

	//Search order
	public List<Order> searchOrder(OrderSearch orderSearch){
		String sql = "SELECT * FROM sale_order s WHERE 1 = 1";
		if(orderSearch.getStatus() != 2) {
			sql += " AND s.status = " + orderSearch.getStatus();
		}
		if(orderSearch.getOrderStatus() != 5) {
			sql += " AND s.order_status = " + orderSearch.getOrderStatus();
		}
		if(!StringUtils.isEmpty(orderSearch.getMobile())) {
			sql += " AND s.customer_mobile = " + orderSearch.getMobile();
		}
		if (!StringUtils.isEmpty(orderSearch.getBeginDate()) && !StringUtils.isEmpty(orderSearch.getEndDate())){
			String beginDate = orderSearch.getBeginDate();
			String endDate = orderSearch.getEndDate();
			
			sql += " AND s.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
		}
		
		return super.executeNativeSql(sql);
	}
}
