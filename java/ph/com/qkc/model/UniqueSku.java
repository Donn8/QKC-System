package ph.com.qkc.model;

public class UniqueSku {

	private Integer fplId;
	private String skuName;
	private Long totalQty;
	private String unit_of_measurement;
	private String branch_name;
	
	public UniqueSku() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UniqueSku(Integer fplId, String skuName, Long totalQty, String unit_of_measurement, String branch_name) {
		super();
		this.fplId = fplId;
		this.skuName = skuName;
		this.totalQty = totalQty;
		this.unit_of_measurement = unit_of_measurement;
		this.branch_name = branch_name;
	}

	
	public Integer getFplId() {
		return fplId;
	}

	public void setFplId(Integer fplId) {
		this.fplId = fplId;
	}

	public String getSkuName() {
		return skuName;
	}

	public void setSkuName(String skuName) {
		this.skuName = skuName;
	}

	public Long getTotalQty() {
		return totalQty;
	}

	public void setTotalQty(Long totalQty) {
		this.totalQty = totalQty;
	}

	public String getUnit_of_measurement() {
		return unit_of_measurement;
	}

	public void setUnit_of_measurement(String unit_of_measurement) {
		this.unit_of_measurement = unit_of_measurement;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}

	@Override
	public String toString() {
		return "UniqueSku [fplId=" + fplId + ", skuName=" + skuName + ", totalQty=" + totalQty
				+ ", unit_of_measurement=" + unit_of_measurement + ", branch_name=" + branch_name + "]";
	}
	
	
}