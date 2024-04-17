package vn.babycare.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
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
		return "backend/vendor/vendor_list";
	}
	
	@RequestMapping(value = "/admin/vendor-add", method = RequestMethod.GET)
	public String vendorAdd(final Model model) throws IOException{
		Vendor vendor = new Vendor();
		vendor.setCreateDate(new Date());
		model.addAttribute("vendor", vendor);
		return "backend/vendor/vendor_add";
	}
	
	@RequestMapping(value = "/admin/vendor-add-save", method = RequestMethod.POST)
	public String vendorAddSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("vendor") Vendor vendor,
			@RequestParam("imageFile") MultipartFile imageFile) throws IOException{
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String message = "";
		String alert = "";
		if(!StringUtils.isEmpty(code) && !StringUtils.isEmpty(name)) {
			Vendor vendorByCode = vendorService.findByCode(code);
			System.out.println(vendorByCode);
			if(vendorByCode == null) {
				message = "Thêm thành công";
				alert = "success";
				vendorService.saveNewVendor(vendor, imageFile);
			}
			else {
				message = "Mã nhà cung cấp đã tồn tại";
				alert = "danger";
			}
		}
		else {
			message = "Thêm không thành công";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/vendor/vendor_add";
	}
	
	@RequestMapping(value = "/admin/vendor-update/{vendorId}", method = RequestMethod.GET)
	public String vendorUpdate(final Model model,
			@PathVariable("vendorId") int vendorId) throws IOException{
		Vendor vendor = vendorService.getById(vendorId);
		model.addAttribute("vendor", vendor);
		return "backend/vendor/vendor_update";
	}
	
	@RequestMapping(value = "/admin/vendor-update-save", method = RequestMethod.POST)
	public String vendorUpdateSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("vendor") Vendor vendor,
			@RequestParam("imageFile") MultipartFile image) throws IOException{
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String message = "";
		String alert = "";
		if(!StringUtils.isEmpty(code) && !StringUtils.isEmpty(name)) {
			Vendor vendorByCode = vendorService.findByCode(code);
			if(vendorByCode == null || vendorByCode.getId() == vendor.getId()) {
				message = "Sửa thành công";
				alert = "success";
				vendorService.updateVendor(vendor, image);
			}
			else {
				message = "Mã nhà cung cấp đã tồn tại";
				alert = "danger";
			}
		}
		else {
			message = "Sửa không thành công";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		
		return "backend/vendor/vendor_update";
	}
	
	@RequestMapping(value = "/admin/vendor-delete/{vendorId}", method = RequestMethod.GET)
	public String vendorDelete(@PathVariable("vendorId") int vendorId) throws IOException{
		Vendor vendor = vendorService.getById(vendorId);
		vendor.setStatus(false);
		vendorService.saveOrUpdate(vendor);
		return "redirect:/admin/vendor-list";
	}
}
