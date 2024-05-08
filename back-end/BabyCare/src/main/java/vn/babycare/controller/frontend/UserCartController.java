package vn.babycare.controller.frontend;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.babycare.dto.Cart;
import vn.babycare.dto.CartProduct;
import vn.babycare.dto.Customer;
import vn.babycare.model.Order;
import vn.babycare.model.OrderDetail;
import vn.babycare.model.Product;
import vn.babycare.model.User;
import vn.babycare.service.OrderService;
import vn.babycare.service.ProductService;

@Controller
public class UserCartController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;

	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@RequestBody CartProduct addedProduct) throws IOException{
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Cart cart = null;
		if(session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		}else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		if(addedProduct.getQuantity() == null) {
			jsonResult.put("code", 404);
			jsonResult.put("message", "Bạn chưa nhập số lượng");
		}
		else {
			Product dbProduct = productService.getById(addedProduct.getProductId());
			int index = cart.findProductById(addedProduct.getProductId());
			Integer newQuantity = addedProduct.getQuantity();
			if(newQuantity.intValue() < 1) {
				jsonResult.put("code", 404);
				jsonResult.put("message", "Số lượng phải lớn hơn 0");
			}
			else {
				if(newQuantity <= dbProduct.getWarehouseQuantity()) {
					if(index != -1) {
						cart.getCartProducts().get(index).setQuantity(cart.getCartProducts().get(index).getQuantity() +  newQuantity);
					}
					else {
						addedProduct.setAvatar(dbProduct.getAvatar());
						addedProduct.setProductCode(dbProduct.getCode());
						addedProduct.setProductName(dbProduct.getName());
						addedProduct.setPrice(dbProduct.getSaleSellPrice());
						addedProduct.setPrevPrice(dbProduct.getSellPrice());
						addedProduct.setVoucher(dbProduct.getVoucher());
						cart.getCartProducts().add(addedProduct);
					}
					dbProduct.setWarehouseQuantity(dbProduct.getWarehouseQuantity() - newQuantity);
					//productService.saveOrUpdate(dbProduct);
					jsonResult.put("code", 202);
					jsonResult.put("message", "Đã thêm "+ newQuantity +" sản phẩm '" + dbProduct.getName() + "' vào giỏ hàng");
					jsonResult.put("totalCartProducts", cart.totalCartProducts());
				}
				else {
					jsonResult.put("code", 404);
					jsonResult.put("message", "Vượt quá sản phẩm trong kho");
				}
			}
		}
		
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/cart-view", method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request) throws IOException{
		HttpSession session = request.getSession();
		String errorMessage = "";
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart != null) {
			cart = (Cart) session.getAttribute("cart");
			model.addAttribute("totalCartPrice", cart.totalCartPrice());
			model.addAttribute("totalCartProducts", cart.totalCartProducts());
		}
		else {
			errorMessage = "Chưa có sản phẩm trong giỏ hàng";
		}
		model.addAttribute("errorMessage", errorMessage);
		return "frontend/cart-view";
	}
	
	@RequestMapping(value = "/update-product-quantity", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updateProductQuantity(final Model model,
			final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody CartProduct updatedProduct) throws IOException {

		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		int index = cart.findProductById(updatedProduct.getProductId());
		Product dbProduct = productService.getById(updatedProduct.getProductId());
		Integer newQuantity = cart.getCartProducts().get(index).getQuantity() + updatedProduct.getQuantity();
		if (newQuantity.intValue() < 1) {
			newQuantity = 1;
		}
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		if(newQuantity.intValue() <= dbProduct.getWarehouseQuantity()) {
			cart.getCartProducts().get(index).setQuantity(newQuantity);
			session.setAttribute("cart", cart);
		}
		else {
			newQuantity = dbProduct.getWarehouseQuantity();
			cart.getCartProducts().get(index).setQuantity(newQuantity);
			session.setAttribute("cart", cart);
		}
		
		jsonResult.put("totalCartProducts", cart.totalCartProducts());
		jsonResult.put("totalCartPrice", cart.totalCartPrice());
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/change-product-quantity", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updateProductQuantity1(final Model model,
			final HttpServletRequest request, final HttpServletResponse response,
			@RequestBody CartProduct updatedProduct) throws IOException {

		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		int index = cart.findProductById(updatedProduct.getProductId());
		Product dbProduct = productService.getById(updatedProduct.getProductId());

		Integer newQuantity = updatedProduct.getQuantity();
		if (newQuantity.intValue() < 1) {
			newQuantity = 1;
		}
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		if(newQuantity.intValue() <= dbProduct.getWarehouseQuantity()) {
			cart.getCartProducts().get(index).setQuantity(newQuantity);

			session.setAttribute("cart", cart);

		}
		else {
			jsonResult.put("code", 404);
			jsonResult.put("message", "Vượt quá sản phẩm trong kho");
		}
		
		jsonResult.put("totalCartProducts", cart.totalCartProducts());
		jsonResult.put("totalCartPrice", cart.totalCartPrice());
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/product-cart-delete/{productId}", method = RequestMethod.GET)
	public String deleteCartProduct(final Model model, final HttpServletRequest request,
			@PathVariable("productId") int productId) throws IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		int index = cart.findProductById(productId);

		if (index != -1) {
			cart.getCartProducts().remove(index);
		}

		session.setAttribute("cart", cart);
		model.addAttribute("totalCartPrice", cart.totalCartPrice());
		model.addAttribute("totalCartProducts", cart.totalCartProducts());
		return "redirect:/cart-view";
	}
	
	@RequestMapping(value = "/place-order", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> placeOrder(final Model model,
			@RequestBody Customer customer,
			final HttpServletRequest request) throws IOException{
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		if(customer.getTxtName().isEmpty()) {
			jsonResult.put("code", 404);
			jsonResult.put("message", "Bạn chưa nhập họ tên");
		} else if (customer.getTxtMobile().isEmpty()) {
			jsonResult.put("code", 404);
			jsonResult.put("message", "Bạn chưa nhập số điện thoại");
		} else if (customer.getTxtAddress().isEmpty()) {
			jsonResult.put("code", 404);
			jsonResult.put("message", "Bạn chưa nhập địa chỉ");
		} else {
			HttpSession session = request.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			if(cart != null) {
				if(cart.totalCartProducts().intValue() > 0) {
					Order order = new Order();
					order.setCustomerName(customer.getTxtName());
					order.setCustomerMobile(customer.getTxtMobile());
					order.setCustomerEmail(customer.getTxtEmail());
					order.setCustomerAddress(customer.getTxtAddress());
					order.setNote(customer.getNote());
					order.setStatus(true);
					order.setTotal(cart.totalCartPrice());
					order.setCreateDate(new Date());
					if(isLogined()) {
						order.setUser(getLoginedUser());
					}
					else {
						User user = new User();
						user.setId(8);
						order.setUser(user);
					}
					
					for(CartProduct cartProduct : cart.getCartProducts()) {
						OrderDetail orderDetail = new OrderDetail();
						orderDetail.setQuantity(cartProduct.getQuantity());
						Product product = productService.getById(cartProduct.getProductId());
						orderDetail.setProduct(product);
						order.addRelationalOrderDetails(orderDetail);
					}
					orderService.saveOrUpdate(order);
					cart = new Cart();
					session.setAttribute("cart", null);
					jsonResult.put("code", 202);
					jsonResult.put("message", "Bạn đã đặt hàng thành công");
				}
				else {
					jsonResult.put("code", 202);
					jsonResult.put("message", "Không có sản phẩm");
				}
			} else {
				jsonResult.put("code", 202);
				jsonResult.put("message", "Chưa có giỏ hàng");
			}
		}
		
		return ResponseEntity.ok(jsonResult);
	}
	
}
