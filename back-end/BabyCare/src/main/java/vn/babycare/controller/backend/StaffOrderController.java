package vn.babycare.controller.backend;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.babycare.controller.frontend.BaseController;
import vn.babycare.model.Order;
import vn.babycare.service.OrderService;

@Controller
public class StaffOrderController extends BaseController{
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/staff/order-list", method = RequestMethod.GET)
	public String orderList(final Model model,
			final HttpServletRequest request) throws IOException{
		List<Order> orders = orderService.findAll();
		model.addAttribute("orders", orders);
		
		if(request.getParameter("updateStatus") != null) {
			for(Order order : orders) {
				int order_id = order.getId();
				if(request.getParameter("orderStatus_" + order_id) != null) {
					Order dbOrder = orderService.getById(order_id);
					int newOrderStatus = Integer.parseInt(request.getParameter("orderStatus_" + order_id));
					dbOrder.setOrderStatus(newOrderStatus);
					orderService.saveOrUpdate(dbOrder);
					//Huy don hang
					if(dbOrder.getOrderStatus() == 4) {
						
					}
				}
			}
		}
		
		for(Order order : orders) {
			if(request.getParameter("orderStatus_" + order.getId()) != null) {
				int newOrderStatus = Integer.parseInt(request.getParameter("orderStatus_" + order.getId()));
				order.setOrderStatus(newOrderStatus);
				orderService.saveOrUpdate(order);
			}
		}
		return "backend/order/order-list";
				
	}
	
	@RequestMapping(value = "/staff/order-delete/{orderId}", method = RequestMethod.GET)
	public String deleteOrderById(@PathVariable("orderId") int orderId) throws IOException{
		Order order = orderService.getById(orderId);
		order.setStatus(false);
		orderService.saveOrUpdate(order);
		return "redirect:/staff/order-list";
	}
}
