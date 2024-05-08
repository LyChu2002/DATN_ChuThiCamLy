package vn.babycare.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.babycare.dto.Cart;
import vn.babycare.model.Category;
import vn.babycare.model.User;
import vn.babycare.service.CategoryService;

public class BaseController {
	@Autowired
	private CategoryService categoryService;
	
	@ModelAttribute("menuCategories")
	public List<Category> getMenuCategory(final Model model) throws IOException{
		List<Category> categories = categoryService.findAllActive();
		model.addAttribute("categories", categories);
		return categoryService.findAllActive();
	}
	
	@ModelAttribute("totalCartProducts")
	public Integer getTotalCartProducts(final HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			return cart.totalCartProducts();
		}
		return 0;
	}
	
	@ModelAttribute("loginedUser")
	public User getLoginedUser() {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loginedUser != null && loginedUser instanceof UserDetails) {
			User user = (User) loginedUser;
			return user;
		}
		return new User();
	}
	
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loginedUser != null && loginedUser instanceof UserDetails) {
			return true;
		}
		return false;
	}
}
