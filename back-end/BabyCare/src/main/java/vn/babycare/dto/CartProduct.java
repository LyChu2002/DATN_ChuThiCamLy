package vn.babycare.dto;

import java.math.BigDecimal;

import vn.babycare.model.Vendor;

public class CartProduct {
	private int productId;
	private Integer quantity;
	private BigDecimal price;
	private BigDecimal prevPrice;
	private String productName;
	private String avatar;
	private String productCode;
	private Vendor vendor;
	private Integer voucher;
	
	public BigDecimal getPrevPrice() {
		return prevPrice;
	}

	public void setPrevPrice(BigDecimal prevPrice) {
		this.prevPrice = prevPrice;
	}

	public Integer getVoucher() {
		return voucher;
	}

	public void setVoucher(Integer voucher) {
		this.voucher = voucher;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public BigDecimal totalPrice() {
		return this.price.multiply(new BigDecimal(this.quantity.toString()));
	}

	public CartProduct() {
		super();
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	
}
