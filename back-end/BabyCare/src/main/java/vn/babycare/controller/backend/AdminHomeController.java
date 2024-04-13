package vn.babycare.controller.backend;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminHomeController {
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	public String homeAdmin() throws IOException{
		return "backend/home";
	}
}
