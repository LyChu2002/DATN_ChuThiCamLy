package vn.babycare.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
		return "backend/category/category-list";
	}
	
	@RequestMapping(value = "/admin/category-add", method = RequestMethod.GET)
	public String categoryAdd(final Model model) throws IOException{
		Category category = new Category();
		category.setCreateDate(new Date());
		model.addAttribute("category", category);
		return "backend/category/category-add";
	}
	
	@RequestMapping(value = "/admin/category-add-save", method = RequestMethod.POST)
	public String categoryAddSave(final Model model,
			@Valid @ModelAttribute("category") Category category, 
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("bannerFile") MultipartFile bannerFile,
			final HttpServletRequest request) throws IOException{
		String message = "", alert = "";
		category.setCreateDate(new Date());
		Category cate = categoryService.findByCode(request.getParameter("code"));
		if(cate == null) {
			message = "Thêm thành công";
			alert = "success";
			categoryService.saveNewCategory(category, avatarFile, bannerFile);		
		}
		else {
			message = "Mã danh mục đã tồn tại";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		
		return "backend/category/category-add";
	}
	
	@RequestMapping(value = "/admin/category-update/{categoryId}", method = RequestMethod.GET)
	public String categoryUpdate(final Model model,
			@PathVariable("categoryId") int categoryId) throws IOException{
		Category category = categoryService.getById(categoryId);
		model.addAttribute("category", category);
		return "backend/category/category-update";
	}
	
	@RequestMapping(value = "/admin/category-update-save", method = RequestMethod.POST)
	public String categoryUpdateSave(final Model model,
			final HttpServletRequest request,
			@Valid @ModelAttribute("category") Category category,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("bannerFile") MultipartFile bannerFile) throws IOException {
		String message = "", alert = "";
		Category cateByCode = categoryService.findByCode(request.getParameter("code"));
		if(cateByCode == null || cateByCode.getId() == category.getId()) {
			message = "Cập nhật thành công";
			alert = "success";
			categoryService.saveUpdateCategory(category, avatarFile, bannerFile);
		}
		else {
			message = "Mã danh mục đã tồn tại";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/category/category-update";
	}
	
	@RequestMapping(value = "/admin/category-delete/{categoryId}", method = RequestMethod.GET)
	public String categorySoftDelete(@PathVariable("categoryId") int categoryId) {
		Category category = categoryService.getById(categoryId);
		category.setStatus(false);
		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category-list";
	}
	
	@RequestMapping(value = "/admin/category-delete", method = RequestMethod.POST)
	public String categoryMultipleSoftDelete(final HttpServletRequest request) throws IOException{
		if(request.getParameterValues("categoryId") != null) {
			for(String categoryId : request.getParameterValues("categoryId")) {
				Category category = categoryService.getById(Integer.parseInt(categoryId));
				category.setStatus(false);
				categoryService.saveOrUpdate(category);
			}
		}
		return "redirect:/admin/category-list";
	}
}
