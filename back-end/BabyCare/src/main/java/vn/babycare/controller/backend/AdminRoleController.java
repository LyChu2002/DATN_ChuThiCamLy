package vn.babycare.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vn.babycare.model.Role;
import vn.babycare.service.RoleService;

@Controller
public class AdminRoleController {
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "/admin/role-list", method = RequestMethod.GET)
	public String roleList(final Model model) throws IOException{
		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);
		return "backend/role/role-list";
	}
	
	@RequestMapping(value = "/admin/role-add", method = RequestMethod.GET)
	public String roleAdd(final Model model) throws IOException{
		Role role = new Role();
		model.addAttribute("role", role);
		return "backend/role/role-add";
	}
	
	@RequestMapping(value = "/admin/role-add-save", method = RequestMethod.POST)
	public String roleAddSave(final Model model, 
			@RequestParam("name") String name,
			@ModelAttribute("role") Role role) throws IOException{
		String message = "", alert = "";
		if(!StringUtils.isEmpty(name)) {
			Role roleByName = roleService.getRoleByName(name);
			if(roleByName == null) {
				message = "Thêm thành công";
				alert = "success";
				role.setCreateDate(new Date());
				roleService.saveOrUpdate(role);
			}
			else {
				message = "Đã tồn tại quyền";
				alert = "danger";
			}
		}
		else {
			message = "Nhập tên quyền";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/role/role-add";
	}
	
	@RequestMapping(value = "/admin/role-update/{roleId}", method = RequestMethod.GET)
	public String roleUpdate(final Model model, @PathVariable("roleId") int id) throws IOException{
		Role role = roleService.getById(id);
		model.addAttribute("role", role);
		return "backend/role/role-update";
	}
	
	@RequestMapping(value = "/admin/role-update-save", method = RequestMethod.POST)
	public String roleUpdateSave(@ModelAttribute("role") Role role,
			final Model model,
			@RequestParam("name") String name) throws IOException{
		String message = "", alert = "";
		if(!StringUtils.isEmpty(name)) {
			Role roleByName = roleService.getRoleByName(name);
			if(roleByName == null || roleByName.getId() == role.getId()) {
				message = "Cập nhật thành công";
				alert = "success";
				roleService.saveOrUpdate(role);
			}
			else {
				message = "Tên quyền đã tồn tại";
				alert = "danger";
			}
		}
		else {
			message = "Nhập tên quyền";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/role/role-update";
	}
	
	@RequestMapping(value = "/admin/role-delete/{roleId}", method = RequestMethod.GET)
	public String roleSoftDeleteById(@PathVariable("roleId") int id) throws IOException{
		Role role = roleService.getById(id);
		role.setStatus(false);
		roleService.saveOrUpdate(role);
		return "redirect:/admin/role-list";
	}
	
	@RequestMapping(value = "/admin/role-delete", method = RequestMethod.POST)
	public String roleMultipleSoftDelete(final HttpServletRequest request) throws IOException{
		if(request.getParameterValues("roleId") != null) {
			for(String roleId : request.getParameterValues("roleId")) {
				int id = Integer.parseInt(roleId);
				Role role = roleService.getById(id);
				role.setStatus(false);
				roleService.saveOrUpdate(role);
			}
		}
		return "redirect:/admin/role-list";
	}

}
