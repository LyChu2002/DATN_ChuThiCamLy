package vn.babycare.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
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

import vn.babycare.model.Role;
import vn.babycare.model.User;
import vn.babycare.service.RoleService;
import vn.babycare.service.UserService;

@Controller
public class AdminUserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "/admin/user-list", method = RequestMethod.GET)
	public String userList(final Model model) throws IOException{
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		return "backend/user/user-list";
	}
	
	@RequestMapping(value = "/admin/user-add", method = RequestMethod.GET)
	public String userAdd(final Model model) throws IOException{
		User user = new User();
		model.addAttribute("user", user);
		List<Role> roles = roleService.findAllActive();
		model.addAttribute("roles", roles);
		return "backend/user/user-add";
	}
	
	@RequestMapping(value = "/admin/user-add-save", method = RequestMethod.POST)
	public String userAddSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("user") User user) throws IOException{
		if(request.getParameterValues("role") != null) {
			for(String roleById : request.getParameterValues("role")) {
				int roleId = Integer.parseInt(roleById);
				Role role = roleService.getById(roleId);
				user.getRoles().add(role);
				role.getUsers().add(user);
			}
		}
		userService.saveOrUpdate(user);
		return "backend/user/user-add";
	}
	
	@RequestMapping(value = "/admin/user-update/{userId}", method = RequestMethod.GET)
	public String userUpdate(final Model model,
			@PathVariable("userId") int userId) throws IOException{
		User user = userService.getById(userId);
		model.addAttribute("user", user);
		List<Role> roles = roleService.findAllActive();
		model.addAttribute("roles", roles);
		return "backend/user/user-update";
	}
	
	@RequestMapping(value = "/admin/user-update-save", method = RequestMethod.POST)
	public String userUpdateSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("user") User user) throws IOException{
		List<Role> roles = roleService.findAllActive();
		model.addAttribute("roles", roles);
		User userById = userService.getById(user.getId());
		List<Role> currentListRole = userService.getById(user.getId()).getRoles();
		for(Role role : currentListRole) {
			role.getUsers().remove(userById);
		}
		user.setRoles(new ArrayList<Role>());
		if(request.getParameterValues("role") != null) {
			for(String roleId : request.getParameterValues("role")) {
				Role roleById = roleService.getById(Integer.parseInt(roleId));
				user.getRoles().add(roleById);
				roleById.getUsers().add(user);
			}
		}
		userService.saveOrUpdate(user);
		return "backend/user/user-update";
	}
	
	@RequestMapping(value = "/admin/user-delete/{userId}", method = RequestMethod.GET)
	public String userSoftDeleteById(@PathVariable("userId") int id) throws IOException{
		User user = userService.getById(id);
		user.setStatus(false);
		userService.saveOrUpdate(user);
		return "redirect:/admin/user-list";
	}
	
	
}
