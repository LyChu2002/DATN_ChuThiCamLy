package vn.babycare.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.babycare.model.OrderDetail;

@Service
public class OrderDetailService extends BaseService<OrderDetail>{

	@Override
	public Class<OrderDetail> clazz() {
		// TODO Auto-generated method stub
		return OrderDetail.class;
	}

	public List<OrderDetail> findByOrderId(int orderId){
		String sql = "SELECT * FROM order_detail WHERE sale_order_id = " + orderId;
		return super.executeNativeSql(sql);
	}
	
	public OrderDetail findByOrderProductId(int orderId, int productId){
		String sql = "SELECT * FROM order_detail WHERE sale_order_id = " + orderId + " AND product_id = " + productId;
		return super.getEntityByNativeSQL(sql);
	}
}
