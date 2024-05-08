package vn.babycare.dto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<CartProduct> cartProducts = new ArrayList<CartProduct>();

	public Cart() {
		super();
	}

	public List<CartProduct> getCartProducts() {
		return cartProducts;
	}

	public void setCartProducts(List<CartProduct> cartProducts) {
		this.cartProducts = cartProducts;
	}
	
	//Find product in cart by id
	public int findProductById(int id) {
		for(int index = 0; index < this.cartProducts.size(); index++) {
			if(this.cartProducts.get(index).getProductId() == id) {
				return index;
			}
		}
		return -1;
	}
	
	//Total products in cart
	public Integer totalCartProducts() {
		Integer total = 0;
		for(CartProduct cartProduct : cartProducts) {
			total += cartProduct.getQuantity();
		}
		return total;
	}
	
	//Total money in cart
	public BigDecimal totalCartPrice() {
		BigDecimal total = BigDecimal.ZERO;
		for(CartProduct cartProduct : cartProducts) {
			total = total.add(cartProduct.totalPrice());
		}
		return total;
	}
}
