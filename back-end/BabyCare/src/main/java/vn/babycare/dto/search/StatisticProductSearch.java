package vn.babycare.dto.search;

public class StatisticProductSearch {
	private String code;
	private String name;
	
	private int criteriaSort;
	private int sortBy;
	
	private int sizeOfPage;
	private int currentPage;
	private int totalItems;
	
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

	public int getCriteriaSort() {
		return criteriaSort;
	}

	public void setCriteriaSort(int criteriaSort) {
		this.criteriaSort = criteriaSort;
	}

	public int getSortBy() {
		return sortBy;
	}

	public void setSortBy(int sortBy) {
		this.sortBy = sortBy;
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

	public StatisticProductSearch() {
		super();
	}
	
	
}
