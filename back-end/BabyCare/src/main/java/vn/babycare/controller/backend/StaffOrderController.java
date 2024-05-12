package vn.babycare.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.babycare.controller.frontend.BaseController;
import vn.babycare.dto.SearchConstant;
import vn.babycare.dto.search.OrderSearch;
import vn.babycare.model.Order;
import vn.babycare.model.OrderDetail;
import vn.babycare.model.Product;
import vn.babycare.model.Vendor;
import vn.babycare.service.OrderDetailService;
import vn.babycare.service.OrderService;
import vn.babycare.service.ProductService;

@Controller
public class StaffOrderController extends BaseController implements SearchConstant{
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/staff/order-list", method = RequestMethod.GET)
	public String orderList(final Model model,
			final HttpServletRequest request) throws IOException{
//		List<Order> orders = orderService.findAll();
//		model.addAttribute("orders", orders);
		OrderSearch orderSearch = new OrderSearch();
		orderSearch.setStatus(2);
		orderSearch.setOrderStatus(5);
		if(!StringUtils.isEmpty(request.getParameter("status"))) {
			orderSearch.setStatus(Integer.parseInt(request.getParameter("status")));
		}
		if(!StringUtils.isEmpty(request.getParameter("orderStatus"))) {
			orderSearch.setOrderStatus(Integer.parseInt(request.getParameter("orderStatus")));
		}
		orderSearch.setMobile(request.getParameter("mobile"));
		orderSearch.setBeginDate(request.getParameter("beginDate"));
		orderSearch.setEndDate(request.getParameter("endDate"));
		if(!StringUtils.isEmpty(request.getParameter("page"))) {
			orderSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		else {
			orderSearch.setCurrentPage(1);
		}
		List<Order> allOrders = orderService.searchOrder(orderSearch);
		List<Order> orders = new ArrayList<Order>();
		
		int totalPages = allOrders.size() / SIZE_OF_PAGE;
		if(allOrders.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		
		if(totalPages < orderSearch.getCurrentPage()) {
			orderSearch.setCurrentPage(1);
		}
		
		int firstIndex = (orderSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < allOrders.size() && count < SIZE_OF_PAGE) {
			orders.add(allOrders.get(index));
			index++;
			count++;
		}
		orderSearch.setSizeOfPage(SIZE_OF_PAGE);
		orderSearch.setTotalItems(allOrders.size());
		
		model.addAttribute("orders", orders);
		model.addAttribute("orderSearch", orderSearch);
		return "backend/order/order-list";
				
	}
	
	@RequestMapping(value = "/staff/order-list", method = RequestMethod.POST)
	public String orderUpdate(final Model model,
			final HttpServletRequest request) throws IOException{
//		List<Order> orders = orderService.findAll();
//		model.addAttribute("orders", orders);
		OrderSearch orderSearch = new OrderSearch();
		orderSearch.setStatus(2);
		orderSearch.setOrderStatus(5);
		if(!StringUtils.isEmpty(request.getParameter("status"))) {
			orderSearch.setStatus(Integer.parseInt(request.getParameter("status")));
		}
		if(!StringUtils.isEmpty(request.getParameter("orderStatus"))) {
			orderSearch.setOrderStatus(Integer.parseInt(request.getParameter("orderStatus")));
		}
		orderSearch.setMobile(request.getParameter("mobile"));
		orderSearch.setBeginDate(request.getParameter("beginDate"));
		orderSearch.setEndDate(request.getParameter("endDate"));
		if(!StringUtils.isEmpty(request.getParameter("page"))) {
			orderSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		else {
			orderSearch.setCurrentPage(1);
		}
		List<Order> allOrders = orderService.searchOrder(orderSearch);
		List<Order> orders = new ArrayList<Order>();
		
		int totalPages = allOrders.size() / SIZE_OF_PAGE;
		if(allOrders.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		
		if(totalPages < orderSearch.getCurrentPage()) {
			orderSearch.setCurrentPage(1);
		}
		
		int firstIndex = (orderSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < allOrders.size() && count < SIZE_OF_PAGE) {
			orders.add(allOrders.get(index));
			index++;
			count++;
		}
		orderSearch.setSizeOfPage(SIZE_OF_PAGE);
		orderSearch.setTotalItems(allOrders.size());
		
		model.addAttribute("orders", orders);
		model.addAttribute("orderSearch", orderSearch);
		

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
						List<OrderDetail> orderDetails = orderDetailService.findByOrderId(order_id);
						for(OrderDetail orderDetail : orderDetails) {
							int product_id = orderDetail.getProduct().getId();
							int cancelQuantity = orderDetailService.findByOrderProductId(order_id, product_id).getQuantity();
							Product orderProduct = orderDetail.getProduct();
							orderProduct.setWarehouseQuantity(orderProduct.getWarehouseQuantity() + cancelQuantity);
							orderProduct.setSoldQuantity(orderProduct.getSoldQuantity() - cancelQuantity);
							productService.saveOrUpdate(orderProduct);
						}
					}
				}
			}
		}
		
		if(request.getParameter("deleteOrder") != null) {
			if(request.getParameterValues("orderId") != null) {
				for(String orderId : request.getParameterValues("orderId")) {
					Order order = orderService.getById(Integer.parseInt(orderId));
					order.setStatus(false);
					orderService.saveOrUpdate(order);
				}
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
	
	@RequestMapping(value = "/staff/order-detail/{orderId}", method = RequestMethod.GET)
	public String orderDetail(final Model model,
			@PathVariable("orderId") int orderId) throws IOException{
		Order order = orderService.getById(orderId);
		model.addAttribute("order", order);
		
		List<OrderDetail> listProducts = orderDetailService.findByOrderId(orderId);
		model.addAttribute("listProducts", listProducts);
		return "backend/order/order-detail";
	}
}
