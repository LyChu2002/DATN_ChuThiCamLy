package vn.babycare.controller.backend;

import java.io.IOException;
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
	
	@RequestMapping(value = "/admin/banner-list", method = RequestMethod.GET)
	public String bannerList(final Model model) throws IOException{
		List<Banner> banners = bannerService.findAll();
		model.addAttribute("banners", banners);
		return "backend/banner/banner_list";
	}
	
	@RequestMapping(value = "/admin/banner-add", method = RequestMethod.GET)
	public String bannerAdd(final Model model) throws IOException{
		Banner banner = new Banner();
		model.addAttribute("banner", banner);
		return "backend/banner/banner_add";
	}
	
	@RequestMapping(value = "/admin/banner-add-save", method = RequestMethod.POST)
	public String bannerAddSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("banner") Banner banner,
			@RequestParam("imageFile") MultipartFile imageFile) throws IOException{
		String code = request.getParameter("code");
		String message = "", alert = "";
		if(!fileUtils.isUploadFile(imageFile)) {
			message = "Chọn ảnh";
			alert = "danger";
		}
		else if(!StringUtils.isEmpty(code)) {
			Banner bannerByCode = bannerService.findByCode(code);
			if(bannerByCode == null) {
					message = "Thêm thành công";
					alert = "success";
					bannerService.saveNewBanner(banner, imageFile);
			}
			else {
				message = "Mã code đã tồn tại";
				alert = "danger";
			}
		}
		else {
			message = "Thêm không thành công";
			alert = "danger";
		}
		model.addAttribute("messageResponse", message);
		model.addAttribute("alert", alert);
		return "backend/banner/banner_add";
	}
	
	@RequestMapping(value = "/admin/banner-delete/{bannerId}", method = RequestMethod.GET)
	public String bannerDelete(@PathVariable("bannerId") int bannerId) throws IOException{
		Banner banner = bannerService.getById(bannerId);
		banner.setStatus(false);
		bannerService.saveOrUpdate(banner);
		return "redirect:/admin/banner-list";
	}
}
