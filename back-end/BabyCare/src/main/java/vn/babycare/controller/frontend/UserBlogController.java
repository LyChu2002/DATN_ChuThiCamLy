package vn.babycare.controller.frontend;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.babycare.model.Blog;
import vn.babycare.service.BlogService;

@Controller
public class UserBlogController extends BaseController{
	@Autowired
	private BlogService blogService;
	
	@RequestMapping(value = "/blog", method = RequestMethod.GET)
	public String userBlog(final Model model) throws IOException{
		List<Blog> blogs = blogService.findAllActive();
		model.addAttribute("blogs", blogs);
		return "frontend/blog";
	}
	
	@RequestMapping(value = "/blog-detail/{blogId}", method = RequestMethod.GET)
	public String userDetailBlog(final Model model, @PathVariable("blogId") int blogId) throws IOException{
		Blog blog = blogService.getById(blogId);
		model.addAttribute("blog", blog);
		List<Blog> newBlogs = blogService.findTopNew();
		model.addAttribute("newBlogs", newBlogs);
		return "frontend/blog-detail";
	}
}
