package vn.babycare.controller.frontend;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.babycare.model.Category;
import vn.babycare.service.CategoryService;

@Controller
public class UserHomeController {
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(final Model model) throws IOException{
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		return "frontend/index";
	}
}
