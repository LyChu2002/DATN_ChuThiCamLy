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
	private OrderDetailService orderDetailService;
	
	@RequestMapping(value = "/staff/product-statistic", method = RequestMethod.GET)
	public String statisticProduct(final Model model) throws IOException{
		List<Product> product_statistics = productService.findAllActive();
		model.addAttribute("product_statistics", product_statistics);

		Map<Integer, BigDecimal> revenue = new HashMap<Integer, BigDecimal>();
		Map<Integer, BigDecimal> profit = new HashMap<Integer, BigDecimal>();
		int totalImportQuantity = 0;
		int totalSoldQuantity = 0;
		BigDecimal totalRevenue = BigDecimal.valueOf(0);
		BigDecimal totalProfit = BigDecimal.valueOf(0);

		for(Product product : product_statistics) {
			totalImportQuantity += product.getSoldQuantity() + product.getWarehouseQuantity();
			totalSoldQuantity += product.getSoldQuantity();
			List<OrderDetail> orderDetails = orderDetailService.findByProductId(product.getId());
			BigDecimal totalPrice = BigDecimal.valueOf(0);
			for(OrderDetail orderDetail : orderDetails) {
				BigDecimal total = orderDetail.getPrice().multiply(new BigDecimal(orderDetail.getQuantity().toString()));
				totalPrice = totalPrice.add(total);
			}
			
			totalRevenue = totalRevenue.add(totalPrice);
			revenue.put(product.getId(), totalPrice);
			BigDecimal importPrice = product.getImportPrice().multiply(new BigDecimal(product.getSoldQuantity().toString()));
			profit.put(product.getId(), totalPrice.subtract(importPrice));
			totalProfit = totalProfit.add(totalPrice.subtract(importPrice));
		}
		model.addAttribute("revenue", revenue);
		model.addAttribute("profit", profit);
		model.addAttribute("totalImportQuantity", totalImportQuantity);
		model.addAttribute("totalSoldQuantity", totalSoldQuantity);
		model.addAttribute("totalRevenue", totalRevenue);
		model.addAttribute("totalProfit", totalProfit);
		
		return "backend/statistic/product_statistic";
	}
}
