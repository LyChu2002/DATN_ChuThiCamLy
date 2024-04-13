package vn.babycare.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import vn.babycare.service.CategoryService;

@Controller
public class AdminCategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "/admin/category-list", method = RequestMethod.GET)
	public String categoryList(final Model model) throws IOException{
		List<Category> categoryList = categoryService.findAll();
		model.addAttribute("categories", categoryList);
		return "backend/category/category_list";
	}
	
	@RequestMapping(value = "/admin/category-add", method = RequestMethod.GET)
	public String categoryAdd(final Model model) throws IOException{
		Category category = new Category();
		model.addAttribute("category", category);
		return "backend/category/category_add";
	}
	
	@RequestMapping(value = "/admin/category-add-save", method = RequestMethod.POST)
	public String categoryAddSave(final Model model,
			@Valid @ModelAttribute("category") Category category, 
			final HttpServletRequest request) throws IOException{
		String codeRequest = request.getParameter("code");
		String nameRequest = request.getParameter("name");
		String message = "";
		category.setCreateDate(new Date());
		if(!StringUtils.isEmpty(codeRequest) && !StringUtils.isEmpty(nameRequest)) {
			Category cate = categoryService.findByCode(codeRequest);
			if(cate == null) {
				message = "Thêm thành công";
				model.addAttribute("messageResponse", message);
				model.addAttribute("alert", "success");
				categoryService.saveOrUpdate(category);		
//				return "redirect:/admin/category-list";
			}
			else {
				message = "Mã danh mục đã tồn tại";
				model.addAttribute("messageResponse", message);
				model.addAttribute("alert", "danger");
			}
		}
		else {
			message = "Thêm không thành công";
			model.addAttribute("messageResponse", message);
			model.addAttribute("alert", "danger");
		}
		
		return "backend/category/category_add";
	}
}
