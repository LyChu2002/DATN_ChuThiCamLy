package vn.babycare.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.babycare.dto.SearchConstant;
import vn.babycare.dto.search.WarehouseSearch;
import vn.babycare.model.Product;
import vn.babycare.service.ProductService;

@Controller
public class StaffWarehouseController implements SearchConstant{
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/staff/warehouse", method = RequestMethod.GET)
	public String warehouseList(final Model model,
			final HttpServletRequest request) throws IOException {
		WarehouseSearch warehouseSearch = new WarehouseSearch();
		warehouseSearch.setWarehouseStatus(2);
		warehouseSearch.setSortQuantity(2);
		warehouseSearch.setCode(request.getParameter("code"));
		warehouseSearch.setName(request.getParameter("name"));
		if(!StringUtils.isEmpty(request.getParameter("page"))) {
			warehouseSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		else {
			warehouseSearch.setCurrentPage(1);
		}
		
		List<Product> allProducts = productService.searchWarehouseProduct(warehouseSearch);
		List<Product> products = new ArrayList<Product>();
		
		int totalPages = allProducts.size() / SIZE_OF_PAGE;
		if(allProducts.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		
		if(totalPages < warehouseSearch.getCurrentPage()) {
			warehouseSearch.setCurrentPage(1);
		}
		
		int firstIndex = (warehouseSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < allProducts.size() && count < SIZE_OF_PAGE) {
			products.add(allProducts.get(index));
			index++;
			count++;
		}
		
		warehouseSearch.setSizeOfPage(SIZE_OF_PAGE);
		warehouseSearch.setTotalItems(allProducts.size());
		
		model.addAttribute("warehouseSearch", warehouseSearch);
		model.addAttribute("products", products);
		return "backend/warehouse";
	}
	
	@RequestMapping(value = "/staff/warehouse", method = RequestMethod.POST)
	public String warehouseUpdate(final Model model,
			final HttpServletRequest request) throws IOException {
		WarehouseSearch warehouseSearch = new WarehouseSearch();
		warehouseSearch.setWarehouseStatus(2);
		warehouseSearch.setSortQuantity(2);
		if(!StringUtils.isEmpty(request.getParameter("warehouseStatus"))) {
			warehouseSearch.setWarehouseStatus(Integer.parseInt(request.getParameter("warehouseStatus")));
		}
		if(!StringUtils.isEmpty(request.getParameter("sortQuantity"))) {
			warehouseSearch.setSortQuantity(Integer.parseInt(request.getParameter("sortQuantity")));
		}
		warehouseSearch.setCode(request.getParameter("code"));
		warehouseSearch.setName(request.getParameter("name"));
		if(!StringUtils.isEmpty(request.getParameter("page"))) {
			warehouseSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		else {
			warehouseSearch.setCurrentPage(1);
		}
		
		List<Product> allProducts = productService.searchWarehouseProduct(warehouseSearch);
		List<Product> products = new ArrayList<Product>();
		
		int totalPages = allProducts.size() / SIZE_OF_PAGE;
		if(allProducts.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		
		if(totalPages < warehouseSearch.getCurrentPage()) {
			warehouseSearch.setCurrentPage(1);
		}
		
		int firstIndex = (warehouseSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < allProducts.size() && count < SIZE_OF_PAGE) {
			products.add(allProducts.get(index));
			index++;
			count++;
		}
		
		warehouseSearch.setSizeOfPage(SIZE_OF_PAGE);
		warehouseSearch.setTotalItems(allProducts.size());
		
		model.addAttribute("warehouseSearch", warehouseSearch);
		model.addAttribute("products", products);
		
		if(request.getParameter("updateQuantity") != null) {
			for(Product product : allProducts) {
				if(!StringUtils.isEmpty(request.getParameter("updateQuantity_" + product.getId()))) {
					int importQuantity = Integer.parseInt(request.getParameter("updateQuantity_" + product.getId()));
					Product dbProduct = productService.getById(product.getId());
					int newQuantity = dbProduct.getWarehouseQuantity() + importQuantity;
					dbProduct.setWarehouseQuantity(newQuantity);
					productService.saveOrUpdate(dbProduct);
				}
			}
		}
		
		return "backend/warehouse";
	}
}
