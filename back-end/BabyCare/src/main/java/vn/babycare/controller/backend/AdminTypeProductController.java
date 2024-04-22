package vn.babycare.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.babycare.model.Category;
import vn.babycare.model.TypeProduct;
import vn.babycare.service.CategoryService;
import vn.babycare.service.TypeProductService;

@Controller
public class AdminTypeProductController {
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private TypeProductService typeProductService;
	
	@RequestMapping(value = "/admin/type-product-list", method = RequestMethod.GET)
	public String typeProductList(final Model model) {
		List<TypeProduct> typeProductList = typeProductService.findAll();
		model.addAttribute("typeProducts", typeProductList);
		return "backend/type_product/type_product-list";
	}
	
	@RequestMapping(value = "/admin/type-product-add", method = RequestMethod.GET)
	public String typeProductAdd(final Model model) {
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		TypeProduct typeProduct = new TypeProduct();
		typeProduct.setCreateDate(new Date());
		model.addAttribute("typeProduct", typeProduct);
		return "backend/type_product/type_product-add";
	}
	
	@RequestMapping(value = "/admin/type-product-add-save", method = RequestMethod.POST)
	public String typeProductAddSave(final Model model,
			final HttpServletRequest request,
			@Valid @ModelAttribute("typeProduct") TypeProduct typeProduct) throws IOException{
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		String message = "", alert = "";
		if(!StringUtils.isEmpty(request.getParameter("category.id"))) {
			TypeProduct type = typeProductService.findByCode(request.getParameter("code"));
			if(type == null) {
				message = "Thêm thành công";
				alert = "success";
				typeProductService.saveOrUpdate(typeProduct);
			}
			else {
				message = "Mã loại sản phẩm đã tồn tại";
				alert = "danger";
			}
		}
		else {
			message = "Chọn danh mục";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/type_product/type_product-add";
	}
	
	@RequestMapping(value = "/admin/type-product-update/{typeProductId}", method = RequestMethod.GET)
	public String typeProductUpdate(final Model model,
			@PathVariable("typeProductId") int typeProductId) throws IOException{
		List<Category> categoryList = categoryService.findAllActive();
		model.addAttribute("categories", categoryList);
		TypeProduct typeProduct = typeProductService.getById(typeProductId);
		model.addAttribute("typeProduct", typeProduct);
		
		return "backend/type_product/type_product-update";
	}
	
	@RequestMapping(value = "/admin/type-product-update-save", method = RequestMethod.POST)
	public String typeProductUpdateSave(final Model model,
			final HttpServletRequest request,
			@Valid @ModelAttribute("typeProduct") TypeProduct typeProduct) {
		List<Category> categoryList = categoryService.findAllActive();
		model.addAttribute("categories", categoryList);
		String message = "", alert = "";
		if(!StringUtils.isEmpty(request.getParameter("category.id"))) {
			TypeProduct type = typeProductService.findByCode(request.getParameter("code"));
			if(type == null || type.getId() == typeProduct.getId()) {
				message = "Cập nhật thành công";
				alert = "success";
				typeProductService.saveOrUpdate(typeProduct);
			}
			else {
				message = "Mã loại sản phẩm đã tồn tại";
				alert = "danger";
			}
		}
		else {
			message = "Chọn danh mục";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/type_product/type_product-update";
	}
	
	@RequestMapping(value = "/admin/type-product-delete/{typeProductId}", method = RequestMethod.GET)
	public String typeProductSoftDelete(@PathVariable("typeProductId") int typeProductId) {
		TypeProduct typeProduct = typeProductService.getById(typeProductId);
		typeProduct.setStatus(false);
		typeProductService.saveOrUpdate(typeProduct);
		return "redirect:/admin/type-product-list";
	}
	
	@RequestMapping(value = "/admin/type-product-delete", method = RequestMethod.POST)
	public String typeProductMultipleSoftDelete(final HttpServletRequest request) throws IOException{
		if(request.getParameterValues("typeProductId") != null) {
			for(String typeProductId : request.getParameterValues("typeProductId")) {
				TypeProduct typeProduct = typeProductService.getById(Integer.parseInt(typeProductId));
				typeProduct.setStatus(false);
				typeProductService.saveOrUpdate(typeProduct);
			}
		}
		return "redirect:/admin/type-product-list";
	}
}
