package vn.babycare.controller.backend;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.babycare.model.OrderDetail;
import vn.babycare.model.Product;
import vn.babycare.service.OrderDetailService;
import vn.babycare.service.ProductService;

@Controller
public class StaffStatisticController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderDetailService orderDeatailService;
	
	@RequestMapping(value = "/staff/product-statistic", method = RequestMethod.GET)
	public String statisticProduct(final Model model) throws IOException{
		List<Product> product_statistics = productService.findAllActive();
		model.addAttribute("product_statistics", product_statistics);
		
		
		
		Map<Integer, BigDecimal> data = new HashMap<Integer, BigDecimal>();
//		for(Product product : product_statistics) {
//			Map<Integer, BigDecimal> revenue = orderDeatailService.countTotalByProduct(product.getId());
//			data.put(product.getId(), revenue.get(product.getId()));
//		}
		for(Product product : product_statistics) {
			List<OrderDetail> orderDetails = orderDeatailService.findByProductId(product.getId());
			BigDecimal totalPrice = BigDecimal.valueOf(0);
			for(OrderDetail orderDetail : orderDetails) {
				BigDecimal total = orderDetail.getPrice().multiply(new BigDecimal(orderDetail.getQuantity().toString()));
				totalPrice = totalPrice.add(total);
			}
			data.put(product.getId(), totalPrice);
		}
		model.addAttribute("data", data);
		
		return "backend/statistic/product_statistic";
	}
}
