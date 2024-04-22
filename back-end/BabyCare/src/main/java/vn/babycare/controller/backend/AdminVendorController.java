package vn.babycare.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import vn.babycare.model.Vendor;
import vn.babycare.service.VendorService;

@Controller
public class AdminVendorController {
	@Autowired
	private VendorService vendorService;
	
	@RequestMapping(value = "/admin/vendor-list", method = RequestMethod.GET)
	public String vendorList(final Model model) throws IOException{
		List<Vendor> vendors = vendorService.findAll();
		model.addAttribute("vendors", vendors);
		return "backend/vendor/vendor-list";
	}
	
	@RequestMapping(value = "/admin/vendor-add", method = RequestMethod.GET)
	public String vendorAdd(final Model model) throws IOException{
		Vendor vendor = new Vendor();
		vendor.setCreateDate(new Date());
		model.addAttribute("vendor", vendor);
		return "backend/vendor/vendor-add";
	}
	
	@RequestMapping(value = "/admin/vendor-add-save", method = RequestMethod.POST)
	public String vendorAddSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("vendor") Vendor vendor,
			@RequestParam("imageFile") MultipartFile imageFile) throws IOException{
		String message = "", alert = "";
		vendor.setCreateDate(new Date());
		Vendor vendorByCode = vendorService.findByCode(request.getParameter("code"));
		if(vendorByCode == null) {
			message = "Thêm thành công";
			alert = "success";
			vendorService.saveNewVendor(vendor, imageFile);
		}
		else {
			message = "Mã nhà cung cấp đã tồn tại";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/vendor/vendor-add";
	}
	
	@RequestMapping(value = "/admin/vendor-update/{vendorId}", method = RequestMethod.GET)
	public String vendorUpdate(final Model model,
			@PathVariable("vendorId") int vendorId) throws IOException{
		Vendor vendor = vendorService.getById(vendorId);
		model.addAttribute("vendor", vendor);
		return "backend/vendor/vendor-update";
	}
	
	@RequestMapping(value = "/admin/vendor-update-save", method = RequestMethod.POST)
	public String vendorUpdateSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("vendor") Vendor vendor,
			@RequestParam("imageFile") MultipartFile image) throws IOException{
		String message = "", alert = "";	
		Vendor vendorByCode = vendorService.findByCode(request.getParameter("code"));
		if(vendorByCode == null || vendorByCode.getId() == vendor.getId()) {
			message = "Cập nhật thành công";
			alert = "success";
			vendorService.updateVendor(vendor, image);
		}
		else {
			message = "Mã nhà cung cấp đã tồn tại";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/vendor/vendor-update";
	}
	
	@RequestMapping(value = "/admin/vendor-delete/{vendorId}", method = RequestMethod.GET)
	public String vendorSoftDeleteById(@PathVariable("vendorId") int vendorId) throws IOException{
		Vendor vendor = vendorService.getById(vendorId);
		vendor.setStatus(false);
		vendorService.saveOrUpdate(vendor);
		return "redirect:/admin/vendor-list";
	}
	
	@RequestMapping(value = "/admin/vendor-delete", method = RequestMethod.POST)
	public String vendorMultipleSoftDelete(final Model model,
			final HttpServletRequest request) throws IOException{
		if(request.getParameterValues("vendorId") != null) {
			for(String vendorId : request.getParameterValues("vendorId")) {
				Vendor vendor = vendorService.getById(Integer.parseInt(vendorId));
				vendor.setStatus(false);
				vendorService.saveOrUpdate(vendor);
			}
		}
		return "redirect:/admin/vendor-list";
	}
	
	@RequestMapping(value = "/jsonexample")
	@ResponseBody
	public List<String> plantAutoComplete(){
		List<String> suggestions = new ArrayList<String>();
		suggestions.add("Red Cedar");
		suggestions.add("RedBull");
		suggestions.add("Red Maple");
		suggestions.add("Red Oak");
		return suggestions;
	}
	
}
