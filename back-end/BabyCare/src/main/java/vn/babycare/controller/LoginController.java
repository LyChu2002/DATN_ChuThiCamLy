package vn.babycare.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.babycare.controller.frontend.BaseController;
import vn.babycare.model.Role;
import vn.babycare.model.User;
import vn.babycare.service.RoleService;
import vn.babycare.service.UserService;

@Controller
public class LoginController extends BaseController{
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() throws IOException{
		return "login";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerPage() throws IOException{
		return "frontend/register";
	}
	
	@RequestMapping(value = "/register-submit", method = RequestMethod.POST)
	public String register(final Model model,
			final HttpServletRequest request) throws IOException{
		String message = "", alert = "";
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(new BCryptPasswordEncoder(4).encode(request.getParameter("password")));
		user.setMobile(request.getParameter("mobile"));
		user.setCreateDate(new Date());
		if(!StringUtils.isEmpty(request.getParameter("email"))) {
			User userByEmail = userService.findByEmail(request.getParameter("email"));
			if(userByEmail != null) {
				message = "Email đã dùng để đăng ký tài khoản";
				alert = "danger";
			}
			else {
				user.setEmail(request.getParameter("email"));
				Role role = roleService.getRoleByName("CUSTOMER");
				user.addRelationalUserRole(role);
				userService.saveOrUpdate(user);
				message = "Đăng ký tài khoản thành công";
				alert = "success";
			}
		}
		
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		
		return "frontend/register";
	}
}
