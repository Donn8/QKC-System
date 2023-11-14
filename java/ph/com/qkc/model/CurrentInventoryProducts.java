package ph.com.qkc.model;

public class CurrentInventoryProducts {

	private String sku_cd;
	private String sku_name;	
	private Long total_quantity;
	private String unit_of_measurement;
	private String branch_name;
	
	public CurrentInventoryProducts() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CurrentInventoryProducts(String sku_cd, String sku_name, Long total_quantity, String unit_of_measurement,
			String branch_name) {
		super();
		this.sku_cd = sku_cd;
		this.sku_name = sku_name;
		this.total_quantity = total_quantity;
		this.unit_of_measurement = unit_of_measurement;
		this.branch_name = branch_name;
	}

	public String getFpl_id() {
		return sku_cd;
	}

	public void setFpl_id(String sku_cd) {
		this.sku_cd = sku_cd;
	}

	public String getSku_name() {
		return sku_name;
	}

	public void setSku_name(String sku_name) {
		this.sku_name = sku_name;
	}

	public Long getTotal_quantity() {
		return total_quantity;
	}

	public void setTotal_quantity(Long total_quantity) {
		this.total_quantity = total_quantity;
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
		return "CurrentInventoryProducts [sku_cd=" + sku_cd + ", sku_name=" + sku_name + ", total_quantity="
				+ total_quantity + ", unit_of_measurement=" + unit_of_measurement + ", branch_name=" + branch_name
				+ "]";
	} 
	
	
}