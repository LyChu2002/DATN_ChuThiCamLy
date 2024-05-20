package vn.babycare.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.babycare.model.Review;

@Service
public class ReviewService extends BaseService<Review>{

	@Override
	public Class<Review> clazz() {
		// TODO Auto-generated method stub
		return Review.class;
	}

	public List<Review> findAllByProductId(int productId){
		String sql = "SELECT * FROM review WHERE status = 1 AND id_product = " + productId;
		return super.executeNativeSql(sql);
	}
}
