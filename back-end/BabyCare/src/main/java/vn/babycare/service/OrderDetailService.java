package vn.babycare.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

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
	
	public List<OrderDetail> findByProductId(int productId){
		String sql = "SELECT * FROM order_detail WHERE product_id = " + productId;
		return super.executeNativeSql(sql);
	}
	
	public OrderDetail findByOrderProductId(int orderId, int productId){
		String sql = "SELECT * FROM order_detail WHERE sale_order_id = " + orderId + " AND product_id = " + productId;
		return super.getEntityByNativeSQL(sql);
	}
	
	@SuppressWarnings("unchecked")
	public Map<Integer, BigDecimal> countTotalByProduct(int productId){
		String sql = "SELECT p.product_id, SUM(price * quantity) FROM order_detail p where p.product_id = " + productId;
		Query query = entityManager.createNativeQuery(sql, clazz());	
		List<Object[]> results = query.getResultList();
		Map<Integer, BigDecimal> counts = new HashMap<Integer, BigDecimal>();
		for(Object[] result : results) {
			Integer idProduct = (Integer) result[0];
			BigDecimal sum = (BigDecimal) result[1];
			counts.put(idProduct, sum);
		}
		return counts;
		
	}
}
