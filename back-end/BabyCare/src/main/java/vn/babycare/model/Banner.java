package vn.babycare.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "banner")
public class Banner extends BaseModel{
	@Column(name = "code", length = 20, nullable = false)
	private String code;
	
	@Column(name = "image", length = 1000, nullable = false)
	private String image;

	public Banner() {
		super();
	}

	public Banner(String code, String image) {
		super();
		this.code = code;
		this.image = image;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
}
