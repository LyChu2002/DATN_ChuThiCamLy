package vn.babycare.dto;

public class Customer {
	private String txtName;
	private String txtEmail;
	private String txtMobile;
	private String txtAddress;
	private String note;
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getTxtName() {
		return txtName;
	}
	public void setTxtName(String txtName) {
		this.txtName = txtName;
	}
	public String getTxtEmail() {
		return txtEmail;
	}
	public void setTxtEmail(String txtEmail) {
		this.txtEmail = txtEmail;
	}
	public String getTxtMobile() {
		return txtMobile;
	}
	public void setTxtMobile(String txtMobile) {
		this.txtMobile = txtMobile;
	}
	public String getTxtAddress() {
		return txtAddress;
	}
	public void setTxtAddress(String txtAddress) {
		this.txtAddress = txtAddress;
	}
	public Customer() {
		super();
	}
	
}
