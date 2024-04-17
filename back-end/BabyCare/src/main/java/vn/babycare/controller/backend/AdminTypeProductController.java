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
		return "backend/type_product/type_product_list";
	}
	
	@RequestMapping(value = "/admin/type-product-add", method = RequestMethod.GET)
	public String typeProductAdd(final Model model) {
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		TypeProduct typeProduct = new TypeProduct();
		typeProduct.setCreateDate(new Date());
		model.addAttribute("typeProduct", typeProduct);
		return "backend/type_product/type_product_add";
	}
	
	@RequestMapping(value = "/admin/type-product-add-save", method = RequestMethod.POST)
	public String typeProductAddSave(final Model model,
			final HttpServletRequest request,
			@Valid @ModelAttribute("typeProduct") TypeProduct typeProduct) throws IOException{
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String idCategory = request.getParameter("category.id");
		String message = "";
		String alert = "";
		if(!StringUtils.isEmpty(code) && !StringUtils.isEmpty(name) && !StringUtils.isEmpty(idCategory)) {
			TypeProduct type = typeProductService.findByCode(code);
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
			message = "Thêm không thành công";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/type_product/type_product_add";
	}
	
	@RequestMapping(value = "/admin/type-product-update/{typeProductId}", method = RequestMethod.GET)
	public String typeProductUpdate(final Model model,
			@PathVariable("typeProductId") int typeProductId) throws IOException{
		List<Category> categoryList = categoryService.findAllActive();
		model.addAttribute("categories", categoryList);
		TypeProduct typeProduct = typeProductService.getById(typeProductId);
		model.addAttribute("typeProduct", typeProduct);
		
		return "backend/type_product/type_product_update";
	}
	
	@RequestMapping(value = "/admin/type-product-update-save", method = RequestMethod.POST)
	public String typeProductUpdateSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("typeProduct") TypeProduct typeProduct) {
		List<Category> categoryList = categoryService.findAllActive();
		model.addAttribute("categories", categoryList);
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String idCategory = request.getParameter("category.id");
		String message = "";
		String alert = "";
		if(!StringUtils.isEmpty(code) && !StringUtils.isEmpty(name) && !StringUtils.isEmpty(request) && !StringUtils.isEmpty(idCategory)) {
			TypeProduct type = typeProductService.findByCode(code);
			if(type == null || type.getId() == typeProduct.getId()) {
				message = "Sửa thành công";
				alert = "success";
				typeProductService.saveOrUpdate(typeProduct);
			}
			else {
				message = "Mã loại sản phẩm đã tồn tại";
				alert = "danger";
			}
		}
		else {
			message = "Sửa không thành công";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/type_product/type_product_update";
	}
	
	@RequestMapping(value = "/admin/type-product-delete/{typeProductId}", method = RequestMethod.GET)
	public String typeProductSoftDelete(@PathVariable("typeProductId") int typeProductId) {
		TypeProduct typeProduct = typeProductService.getById(typeProductId);
		typeProduct.setStatus(false);
		typeProductService.saveOrUpdate(typeProduct);
		return "redirect:/admin/type-product-list";
	}
}
