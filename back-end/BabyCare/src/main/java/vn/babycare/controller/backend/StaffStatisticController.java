package vn.babycare.controller.backend;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.babycare.dto.SearchConstant;
import vn.babycare.dto.search.StatisticProductSearch;
import vn.babycare.model.OrderDetail;
import vn.babycare.model.Product;
import vn.babycare.service.OrderDetailService;
import vn.babycare.service.ProductService;

@Controller
public class StaffStatisticController implements SearchConstant{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
//	@RequestMapping(value = "/staff/product-statistic", method = RequestMethod.GET)
//	public String statisticProduct(final Model model) throws IOException{
////		List<Product> product_statistics = productService.findAllActive();
////		model.addAttribute("product_statistics", product_statistics);
//		
//		StatisticProductSearch productSearch = new StatisticProductSearch();
//		List<Product> product_statistics = productService.searchStatisticsProduct(productSearch);
//		model.addAttribute("product_statistics", product_statistics);
//		
//
//		Map<Integer, BigDecimal> revenue = new HashMap<Integer, BigDecimal>();
//		Map<Integer, BigDecimal> profit = new HashMap<Integer, BigDecimal>();
//		int totalImportQuantity = 0;
//		int totalSoldQuantity = 0;
//		BigDecimal totalRevenue = BigDecimal.valueOf(0);
//		BigDecimal totalProfit = BigDecimal.valueOf(0);
//
//		for(Product product : product_statistics) {
//			totalImportQuantity += product.getSoldQuantity() + product.getWarehouseQuantity();
//			totalSoldQuantity += product.getSoldQuantity();
//			List<OrderDetail> orderDetails = orderDetailService.findByProductId(product.getId());
//			BigDecimal totalPrice = BigDecimal.valueOf(0);
//			for(OrderDetail orderDetail : orderDetails) {
//				BigDecimal total = orderDetail.getPrice().multiply(new BigDecimal(orderDetail.getQuantity().toString()));
//				totalPrice = totalPrice.add(total);
//			}
//			
//			totalRevenue = totalRevenue.add(totalPrice);
//			revenue.put(product.getId(), totalPrice);
//			BigDecimal importPrice = product.getImportPrice().multiply(new BigDecimal(product.getSoldQuantity().toString()));
//			profit.put(product.getId(), totalPrice.subtract(importPrice));
//			totalProfit = totalProfit.add(totalPrice.subtract(importPrice));
//		}
//		model.addAttribute("revenue", revenue);
//		model.addAttribute("profit", profit);
//		model.addAttribute("totalImportQuantity", totalImportQuantity);
//		model.addAttribute("totalSoldQuantity", totalSoldQuantity);
//		model.addAttribute("totalRevenue", totalRevenue);
//		model.addAttribute("totalProfit", totalProfit);
//		
//		return "backend/statistic/product_statistic";
//	}
	
	@RequestMapping(value = "/staff/product-statistic", method = RequestMethod.GET)
	public String statisticProduct(final HttpServletRequest request,
			final Model model) throws IOException{
		
		StatisticProductSearch productSearch = new StatisticProductSearch();
		productSearch.setCriteriaSort(4);
		if(!StringUtils.isEmpty(request.getParameter("criteriaSort"))) {
			productSearch.setCriteriaSort(Integer.parseInt(request.getParameter("criteriaSort")));
		}
		productSearch.setSortBy(2);
		if(!StringUtils.isEmpty(request.getParameter("sortBy"))) {
			productSearch.setSortBy(Integer.parseInt(request.getParameter("sortBy")));
		}
		productSearch.setCode(request.getParameter("code"));
		productSearch.setName(request.getParameter("name"));
		if (!StringUtils.isEmpty(request.getParameter("page"))) {
			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		} else {
			productSearch.setCurrentPage(1);
		}
		
//		List<Product> product_statistics = productService.searchStatisticsProduct(productSearch);
//		model.addAttribute("product_statistics", product_statistics);
		
		List<Product> allProducts = productService.searchStatisticsProduct(productSearch);
		List<Product> product_statistics = new ArrayList<Product>();
		
		int totalPages = allProducts.size() / SIZE_OF_PAGE;
		if (allProducts.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}

		if (totalPages < productSearch.getCurrentPage()) {
			productSearch.setCurrentPage(1);
		}

		int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while (index < allProducts.size() && count < SIZE_OF_PAGE) {
			product_statistics.add(allProducts.get(index));
			index++;
			count++;
		}
		productSearch.setSizeOfPage(SIZE_OF_PAGE);
		productSearch.setTotalItems(allProducts.size());

		model.addAttribute("product_statistics", product_statistics);
		model.addAttribute("productSearch", productSearch);

		Map<Integer, BigDecimal> revenue = new HashMap<Integer, BigDecimal>();
		Map<Integer, BigDecimal> profit = new HashMap<Integer, BigDecimal>();
		int totalImportQuantity = 0;
		int totalSoldQuantity = 0;
		BigDecimal totalRevenue = BigDecimal.valueOf(0);
		BigDecimal totalProfit = BigDecimal.valueOf(0);
		BigDecimal totalImportPrice = BigDecimal.valueOf(0);

		for(Product product : allProducts) {
			totalImportQuantity += product.getSoldQuantity() + product.getWarehouseQuantity();
			totalSoldQuantity += product.getSoldQuantity();
			List<OrderDetail> orderDetails = orderDetailService.findByProductIdActive(product.getId());
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
			totalImportPrice = totalImportPrice.add(product.getImportPrice().multiply(new BigDecimal(totalImportQuantity)));
		}
		model.addAttribute("revenue", revenue);
		model.addAttribute("profit", profit);
		model.addAttribute("totalImportQuantity", totalImportQuantity);
		model.addAttribute("totalSoldQuantity", totalSoldQuantity);
		model.addAttribute("totalRevenue", totalRevenue);
		model.addAttribute("totalProfit", totalProfit);
		model.addAttribute("totalImportPrice", totalImportPrice);
		
		return "backend/statistic/product_statistic";
	}
}
