package vn.babycare.controller.frontend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import vn.babycare.dto.search.ProductSearch;
import vn.babycare.model.Banner;
import vn.babycare.model.Category;
import vn.babycare.model.Product;
import vn.babycare.model.ProductImage;
import vn.babycare.model.Review;
import vn.babycare.model.Vendor;
import vn.babycare.service.BannerService;
import vn.babycare.service.CategoryService;
import vn.babycare.service.ProductImageService;
import vn.babycare.service.ProductService;
import vn.babycare.service.ReviewService;
import vn.babycare.service.VendorService;

@Controller
public class UserHomeController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductImageService productImageService;
	
	@Autowired
	private BannerService bannerService;
	
	@Autowired
	private VendorService vendorService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(final Model model) throws IOException{
		List<Banner> banners = bannerService.findAllActive();
		model.addAttribute("banners", banners);
		List<Vendor> vendors = vendorService.findAllActive();
		model.addAttribute("vendors", vendors);
		List<Product> hotProducts = productService.findAllHot();
		model.addAttribute("hotProducts", hotProducts);
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		return "frontend/index";
	}
	
	@RequestMapping(value = "/product-detail/{productId}", method = RequestMethod.GET)
	public String productDetail(final Model model,
			@PathVariable("productId") int id) throws IOException{
		Product product = productService.getById(id);
		model.addAttribute("product", product);
		
		List<ProductImage> productImages = productImageService.findByProduct(id);
		model.addAttribute("productImages", productImages);
		
		List<Product> relativeProducts = productService.findAllByType(product.getTypeProduct().getId());
		model.addAttribute("relativeProducts", relativeProducts);
		
		List<Review> reviews = reviewService.findAllByProductId(id);
		model.addAttribute("reviews", reviews);
		return "frontend/product-detail";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchResult(final Model model, final HttpServletRequest request) throws IOException{
		ProductSearch productSearch = new ProductSearch();
		String searchName = "";
		if(!StringUtils.isEmpty(request.getParameter("name"))) {
			searchName = request.getParameter("name");
			productSearch.setName(request.getParameter("name"));
		}
		
		List<Product> searchProducts = productService.searchProductByName(productSearch);
		model.addAttribute("searchProducts", searchProducts);
		model.addAttribute("totalSearchProducts", searchProducts.size());
		model.addAttribute("searchName", searchName);
		return "frontend/search-result";
	}
	
	@RequestMapping(value = "/productNamesAutocomplete")
	@ResponseBody
	public List<String> productNamesAutocomplete(@RequestParam (value="term", required = false, defaultValue = "") String term){
		List<String> suggestions = new ArrayList<String>();
		ProductSearch productSearch = new ProductSearch();
		productSearch.setName(term);
		List<Product> products = productService.searchProductByName(productSearch);
		for(Product product : products) {
			suggestions.add(product.getName());
		}
		
		
		return suggestions;
	}
	
	@RequestMapping(value = "/review-post/{productId}", method = RequestMethod.POST)
	public String postReview(@PathVariable("productId") int productId,
			final HttpServletRequest request) throws IOException{
		if(!StringUtils.isEmpty(request.getParameter("review"))) {
			Review review = new Review();
			review.setContent(request.getParameter("review"));
			review.setStatus(true);
			review.setCreateDate(new Date());
			review.setUser(getLoginedUser());
			review.setProduct(productService.getById(productId));
			reviewService.saveOrUpdate(review);
		}
		return "redirect:/product-detail/{productId}";
	}
}
