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
@Table(name = "product")
public class Product extends BaseModel{
	@Column(name = "code", length = 20, nullable = false)
	private String code;
	
	@Column(name = "name", length = 200, nullable = false)
	private String name;
	
	@Column(name = "avatar", length = 500, nullable = true)
	private String avatar;
	
	@Column(name = "sell_price", nullable = true)
	private BigDecimal sellPrice;
	
	@Column(name = "sale_sell_price", nullable = true)
	private BigDecimal saleSellPrice;
	
	public BigDecimal getSaleSellPrice() {
		return saleSellPrice;
	}

	public void setSaleSellPrice(BigDecimal saleSellPrice) {
		this.saleSellPrice = saleSellPrice;
	}

	@Column(name = "import_price", nullable = true)
	private BigDecimal importPrice;
	
	@Column(name = "voucher", nullable = true)
	private Integer voucher;
	
	@Column(name = "is_hot", nullable = true)
	private Boolean isHot = Boolean.FALSE;
	
	@Column(name = "is_new", nullable = true)
	private Boolean isNew = Boolean.FALSE;
	
	@Column(name = "weight", nullable = true)
	private Double weight;
		
	@Column(name = "spec", length = 800, nullable = true)
	private String spec;
	
	@Column(name = "sold_quantity", nullable = true)
	private Integer soldQuantity;
	
	@Column(name = "warehouse_quantity", nullable = true)
	private Integer warehouseQuantity;
	
	@Column(name = "detail_description", nullable = true)
	private String detailDescription;
	
//-----Mapping many-to-one: Product to TypeProduct
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_typeProduct")
	private TypeProduct typeProduct;
	
//----Mapping many-to-one: Product to Vendor
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_vendor")
	private Vendor vendor;
	
//---Mapping one-to-many: Product to ProductImage
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<ProductImage> productImages = new HashSet<ProductImage>();
	
//----Mapping one-to-many: product to order_detail----------------
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public void addRelationalProductImage(ProductImage productImage) {
		productImages.add(productImage);
		productImage.setProduct(this);
	}

	public Set<ProductImage> getProductImages() {
		return productImages;
	}

	public void setProductImages(Set<ProductImage> productImages) {
		this.productImages = productImages;
	}

	public Product() {
		super();
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public BigDecimal getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(BigDecimal sellPrice) {
		this.sellPrice = sellPrice;
	}

	public BigDecimal getImportPrice() {
		return importPrice;
	}

	public void setImportPrice(BigDecimal importPrice) {
		this.importPrice = importPrice;
	}

	public Integer getVoucher() {
		return voucher;
	}

	public void setVoucher(Integer voucher) {
		this.voucher = voucher;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public Boolean getIsNew() {
		return isNew;
	}

	public void setIsNew(Boolean isNew) {
		this.isNew = isNew;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public Integer getSoldQuantity() {
		return soldQuantity;
	}

	public void setSoldQuantity(Integer soldQuantity) {
		this.soldQuantity = soldQuantity;
	}

	public Integer getWarehouseQuantity() {
		return warehouseQuantity;
	}

	public void setWarehouseQuantity(Integer warehouseQuantity) {
		this.warehouseQuantity = warehouseQuantity;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	public TypeProduct getTypeProduct() {
		return typeProduct;
	}

	public void setTypeProduct(TypeProduct typeProduct) {
		this.typeProduct = typeProduct;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}
	
	
}
