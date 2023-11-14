package ph.com.qkc.model;

public class CurrentRawMaterialInventory {
	
	private String material_cd;
	private String material_name;
	private Long total_quantity;
	private String unit_of_measurement;
	private String branch_name;
	
	public CurrentRawMaterialInventory(String material_cd, String material_name, Long total_quantity,
			String unit_of_measurement, String branch_name) {
		super();
		this.material_cd = material_cd;
		this.material_name = material_name;
		this.total_quantity = total_quantity;
		this.unit_of_measurement = unit_of_measurement;
		this.branch_name = branch_name;
	}

	public CurrentRawMaterialInventory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMaterial_cd() {
		return material_cd;
	}

	public void setMaterial_cd(String material_cd) {
		this.material_cd = material_cd;
	}

	public String getMaterial_name() {
		return material_name;
	}

	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
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
		return "CurrentRawMaterialInventory [material_cd=" + material_cd + ", material_name=" + material_name
				+ ", total_quantity=" + total_quantity + ", unit_of_measurement=" + unit_of_measurement
				+ ", branch_name=" + branch_name + "]";
	}
	
	
}
