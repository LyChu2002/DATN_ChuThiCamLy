package vn.babycare.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "sale_order")
public class Order extends BaseModel{
	@Column(name = "total", nullable = true)
	private BigDecimal total;
	
	@Column(name = "customer_name", length = 300, nullable = false)
	private String customerName;
	
	@Column(name = "customer_mobile", length = 120, nullable = false)
	private String customerMobile;
	
	@Column(name = "customer_email", length = 120, nullable = true)
	private String customerEmail;
	
	@Column(name = "customer_address", length = 200, nullable = true)
	private String customerAddress;
	
	@Column(name = "note", length = 500, nullable = true)
	private String note;
	
	@Column(name = "order_status", nullable = true)
	private Integer orderStatus;
	
//-------------Mapping many-to-one: sale_order to user
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;

//---------Mapping one-to-many: tbl_sale_order-to-tbl_sale_order_product
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "order")
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();
	
	public void addRelationalOrderDetails(OrderDetail orderDetail) {
		orderDetails.add(orderDetail);
		orderDetail.setOrder(this);
	}

	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public Order() {
		super();
	}

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerMobile() {
		return customerMobile;
	}

	public void setCustomerMobile(String customerMobile) {
		this.customerMobile = customerMobile;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	
}
