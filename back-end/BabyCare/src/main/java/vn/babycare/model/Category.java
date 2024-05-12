package vn.babycare.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category extends BaseModel{
	@Column(name = "code", length = 20, nullable = false)
	private String code;
	
	@Column(name = "name", length = 200, nullable = false)
	private String name;
	
	@Column(name = "avatar", length = 500, nullable = true)
	private String avatar;
	
	@Column(name = "image", length = 500, nullable = true)
	private String image;
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	//--------Mapping one-to-many: category to type_product---------------
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "category")
	private Set<TypeProduct> typeProducts = new HashSet<TypeProduct>();


	public Set<TypeProduct> getTypeProducts() {
		return typeProducts;
	}

	public void setTypeProducts(Set<TypeProduct> typeProducts) {
		this.typeProducts = typeProducts;
	}
	
	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}


	public Category() {
		super();
	}

	public Category(String code, String name) {
		super();
		this.code = code;
		this.name = name;
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
	
	
}
