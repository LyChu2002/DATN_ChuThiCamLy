package vn.babycare.controller.backend;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.babycare.model.Product;
import vn.babycare.model.TypeProduct;
import vn.babycare.model.Vendor;
import vn.babycare.service.ProductService;
import vn.babycare.service.TypeProductService;
import vn.babycare.service.VendorService;

@Controller
public class AdminProductController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private VendorService vendorService;
	
	@Autowired
	private TypeProductService typeProductService;
	
	@RequestMapping(value = "/admin/product-list", method = RequestMethod.GET)
	public String productList(final Model model) throws IOException{
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		return "backend/product/product-list";
	}
	
	@RequestMapping(value = "/admin/product-add", method = RequestMethod.GET)
	public String productAdd(final Model model) throws IOException{
		Product product = new Product();
		product.setCreateDate(new Date());
		model.addAttribute("product", product);
		List<Vendor> vendors = vendorService.findAllActive();
		model.addAttribute("vendors", vendors);
		List<TypeProduct> typeProducts = typeProductService.findAllActive();
		model.addAttribute("typeProducts", typeProducts);
		return "backend/product/product-add";
	}
	
	@RequestMapping(value = "/admin/product-add-save", method = RequestMethod.POST)
	public String productAddSave(final HttpServletRequest request,
			final Model model,
			@ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles) throws IOException{
		String message = "", alert = "";
		product.setCreateDate(new Date());
		product.setSoldQuantity(0);
		if(product.getVoucher() != null) {
			BigDecimal discount = product.getSellPrice().multiply(BigDecimal.valueOf(product.getVoucher())).divide(BigDecimal.valueOf(100));
			BigDecimal saleOffPrice = product.getSellPrice().subtract(discount);
			product.setSaleSellPrice(saleOffPrice);
		}
		else {
			product.setVoucher(0);
			product.setSaleSellPrice(product.getSellPrice());
		}
		Product productByCode = productService.findByCode(request.getParameter("code"));
		if(productByCode == null) {
			message = "Thêm thành công";
			alert = "success";
			productService.saveNewProduct(product, avatarFile, imageFiles);
		}
		else {
			message = "Mã sản phẩm đã tồn tại";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);	
		List<Vendor> vendors = vendorService.findAllActive();
		model.addAttribute("vendors", vendors);
		List<TypeProduct> typeProducts = typeProductService.findAllActive();
		model.addAttribute("typeProducts", typeProducts);
		return "backend/product/product-add";
	}
	
	@RequestMapping(value = "/admin/product-update/{productId}", method = RequestMethod.GET)
	public String productUpdate(final Model model,
			@PathVariable("productId") int id) throws IOException {
		Product product = productService.getById(id);
		model.addAttribute("product", product);
		List<Vendor> vendors = vendorService.findAllActive();
		model.addAttribute("vendors", vendors);
		List<TypeProduct> typeProducts = typeProductService.findAllActive();
		model.addAttribute("typeProducts", typeProducts);
		return "backend/product/product-update";
	}
	
	@RequestMapping(value = "/admin/product-update-save", method = RequestMethod.POST)
	public String productUpdateSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles
			) throws IOException{
		String message = "", alert = "";
		if(product.getVoucher() != null) {
			BigDecimal discount = product.getSellPrice().multiply(BigDecimal.valueOf(product.getVoucher())).divide(BigDecimal.valueOf(100));
			BigDecimal saleOffPrice = product.getSellPrice().subtract(discount);
			product.setSaleSellPrice(saleOffPrice);
		}
		else {
			product.setVoucher(0);
			product.setSaleSellPrice(product.getSellPrice());
		}
		Product productByCode = productService.findByCode(request.getParameter("code"));
		if(productByCode == null || productByCode.getId() == product.getId()) {
			message = "Cập nhật thành công";
			alert = "success";
			productService.saveUpdateProduct(product, avatarFile, imageFiles);
		}
		else {
			message = "Mã sản phẩm đã tồn tại";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);	
		List<Vendor> vendors = vendorService.findAllActive();
		model.addAttribute("vendors", vendors);
		List<TypeProduct> typeProducts = typeProductService.findAllActive();
		model.addAttribute("typeProducts", typeProducts);
		return "backend/product/product-update";
	}
	
	@RequestMapping(value = "/admin/product-delete/{productId}", method = RequestMethod.GET)
	public String productSoftDeleteById(@PathVariable("productId") int productId) throws IOException{
		Product productById = productService.getById(productId);
		productById.setStatus(false);
		productService.saveOrUpdate(productById);
		return "redirect:/admin/product-list";
	}
	
	@RequestMapping(value = "/admin/product-delete", method = RequestMethod.POST)
	public String productMultipleSoftDelete(final HttpServletRequest request) throws IOException{
		if(request.getParameterValues("productId") != null) {
			for(String productId : request.getParameterValues("productId")) {
				Product product = productService.getById(Integer.parseInt(productId));
				product.setStatus(false);
				productService.saveOrUpdate(product);
			}
		}
		return "redirect:/admin/product-list";
	}
}
