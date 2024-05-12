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

import vn.babycare.model.Blog;
import vn.babycare.model.Product;
import vn.babycare.model.TypeProduct;
import vn.babycare.model.User;
import vn.babycare.model.Vendor;
import vn.babycare.service.BlogService;
import vn.babycare.service.ProductService;
import vn.babycare.service.TypeProductService;
import vn.babycare.service.UserService;
import vn.babycare.service.VendorService;

@Controller
public class AdminBlogController {
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/admin/blog-list", method = RequestMethod.GET)
	public String productList(final Model model) throws IOException{
		List<Blog> blogs = blogService.findAll();
		model.addAttribute("blogs", blogs);
		return "backend/blog/blog-list";
	}
	
	@RequestMapping(value = "/admin/blog-add", method = RequestMethod.GET)
	public String productAdd(final Model model) throws IOException{
		Blog blog = new Blog();
		blog.setCreateDate(new Date());
		model.addAttribute("blog", blog);
		List<User> users = userService.findAllActive();
		model.addAttribute("users", users);
		return "backend/blog/blog-add";
	}
	
	@RequestMapping(value = "/admin/blog-add-save", method = RequestMethod.POST)
	public String productAddSave(final HttpServletRequest request,
			final Model model,
			@ModelAttribute("blog") Blog blog,
			@RequestParam("avatarFile") MultipartFile avatarFile) throws IOException{
		String message = "", alert = "";
		blog.setCreateDate(new Date());
		blogService.saveNewBlog(blog, avatarFile);
		message = "Thêm thành công";
		alert = "success";
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);	
		List<User> users = userService.findAllActive();
		model.addAttribute("users", users);
		return "backend/blog/blog-add";
	}
	
	@RequestMapping(value = "/admin/blog-update/{blogId}", method = RequestMethod.GET)
	public String productUpdate(final Model model,
			@PathVariable("blogId") int id) throws IOException {
		Blog blog = blogService.getById(id);
		model.addAttribute("blog", blog);
		List<User> users = userService.findAllActive();
		model.addAttribute("users", users);
		return "backend/blog/blog-update";
	}
	
	@RequestMapping(value = "/admin/blog-update-save", method = RequestMethod.POST)
	public String productUpdateSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("blog") Blog blog,
			@RequestParam("avatarFile") MultipartFile avatarFile) throws IOException{
		String message = "", alert = "";
		blogService.updateBlog(blog, avatarFile);
		message = "Cập nhật thành công";
		alert = "success";	
	
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);	
		List<User> users = userService.findAllActive();
		model.addAttribute("users", users);
		return "backend/blog/blog-update";
	}
	
	@RequestMapping(value = "/admin/blog-delete/{blogId}", method = RequestMethod.GET)
	public String productSoftDeleteById(@PathVariable("blogId") int blogId) throws IOException{
		Blog blogById = blogService.getById(blogId);
		blogById.setStatus(false);
		blogService.saveOrUpdate(blogById);
		return "redirect:/admin/blog-list";
	}
	

}
