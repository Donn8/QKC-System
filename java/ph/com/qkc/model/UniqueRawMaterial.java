package ph.com.qkc.model;

import java.math.BigDecimal;

public class UniqueRawMaterial {
	
	private String material_cd;
	private String material_name;
	private BigDecimal total_quantity;
	
	
	public UniqueRawMaterial() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UniqueRawMaterial(Object material_cd, String material_name, Object total_quantity) {
		super();
		this.material_cd = material_cd.toString();
		this.material_name = material_name;
		this.total_quantity = (BigDecimal)(total_quantity);
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

	public BigDecimal getTotal_quantity() {
		return total_quantity;
	}

	public void setTotal_quantity(BigDecimal total_quantity) {
		this.total_quantity = total_quantity;
	}

	@Override
	public String toString() {
		return "UniqueRawMaterial [material_cd=" + material_cd + ", material_name=" + material_name
				+ ", total_quantity=" + total_quantity + "]";
	}

}
