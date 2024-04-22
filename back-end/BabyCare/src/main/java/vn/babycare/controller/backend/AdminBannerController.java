package vn.babycare.controller.backend;

import java.io.IOException;
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

import vn.babycare.model.Banner;
import vn.babycare.service.BannerService;
import vn.babycare.utils.FileUploadUtils;

@Controller
public class AdminBannerController {
	@Autowired
	private FileUploadUtils fileUtils;
	
	@Autowired
	private BannerService bannerService;
	
	@RequestMapping(value = "/staff/banner-list", method = RequestMethod.GET)
	public String bannerList(final Model model) throws IOException{
		List<Banner> banners = bannerService.findAll();
		model.addAttribute("banners", banners);
		return "backend/banner/banner-list";
	}
	
	@RequestMapping(value = "/staff/banner-add", method = RequestMethod.GET)
	public String bannerAdd(final Model model) throws IOException{
		Banner banner = new Banner();
		banner.setCreateDate(new Date());
		model.addAttribute("banner", banner);
		return "backend/banner/banner-add";
	}
	
	@RequestMapping(value = "/staff/banner-add-save", method = RequestMethod.POST)
	public String bannerAddSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("banner") Banner banner,
			@RequestParam("imageFile") MultipartFile imageFile) throws IOException{
		String message = "", alert = "";
		banner.setCreateDate(new Date());
		Banner bannerByCode = bannerService.findByCode(request.getParameter("code"));
		if(bannerByCode == null) {
			if(fileUtils.isUploadFile(imageFile)) {
				message = "Thêm thành công";
				alert = "success";
				bannerService.saveNewBanner(banner, imageFile);
			}
			else {
				message = "Chọn ảnh";
				alert = "danger";
			}	
		}
		else {
			message = "Mã code đã tồn tại";
			alert = "danger";
		}
		
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/banner/banner-add";
	}
	
	@RequestMapping(value = "/staff/banner-update/{bannerId}", method = RequestMethod.GET)
	public String bannerUpdate(final Model model, @PathVariable("bannerId") int id) throws IOException{
		Banner banner = bannerService.getById(id);
		model.addAttribute("banner", banner);
		return "backend/banner/banner-update";
	}
	
	@RequestMapping(value = "/staff/banner-update-save", method = RequestMethod.POST)
	public String bannerUpdateSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("banner") Banner banner,
			@RequestParam("imageFile") MultipartFile imageFile) throws IOException{
		String message = "", alert = "";
		Banner bannerByCode = bannerService.findByCode(request.getParameter("code"));
		if(bannerByCode == null || bannerByCode.getId() == banner.getId()) {
			message = "Cập nhật thành công";
			alert = "success";
			bannerService.updateBanner(banner, imageFile);
		}
		else {
			message = "Mã banner đã tồn tại";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/banner/banner-update";
	}
	
	@RequestMapping(value = "/staff/banner-delete/{bannerId}", method = RequestMethod.GET)
	public String bannerSoftDeleteById(@PathVariable("bannerId") int bannerId) throws IOException{
		Banner banner = bannerService.getById(bannerId);
		banner.setStatus(false);
		bannerService.saveOrUpdate(banner);
		return "redirect:/admin/banner-list";
	}
	
	@RequestMapping(value = "/staff/banner-delete", method = RequestMethod.POST)
	public String bannerMultipleSoftDelete(final HttpServletRequest request) throws IOException{
		if(request.getParameterValues("bannerId") != null) {
			for(String bannerId : request.getParameterValues("bannerId")){
				Banner banner = bannerService.getById(Integer.parseInt(bannerId));
				banner.setStatus(false);
				bannerService.saveOrUpdate(banner);
			}
		}
		return "redirect:/admin/banner-list";
	}
}
