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
	public String typeProductList() {
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
}
