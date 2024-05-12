package vn.babycare.dto.search;

public class WarehouseSearch {
	private String code;
	private String name;
	private int warehouseStatus;
	private int sortQuantity;
	
	private int sizeOfPage;
	private int currentPage;
	private int totalItems;
	public WarehouseSearch() {
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
	public int getWarehouseStatus() {
		return warehouseStatus;
	}
	public void setWarehouseStatus(int warehouseStatus) {
		this.warehouseStatus = warehouseStatus;
	}
	public int getSortQuantity() {
		return sortQuantity;
	}
	public void setSortQuantity(int sortQuantity) {
		this.sortQuantity = sortQuantity;
	}
	public int getSizeOfPage() {
		return sizeOfPage;
	}
	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalItems() {
		return totalItems;
	}
	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}
	
	
}
