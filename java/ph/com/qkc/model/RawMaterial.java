package ph.com.qkc.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "grp2_raw_material")
public class RawMaterial {

	@Id
	private String material_cd;
	private String material_name;
	private String unit_of_measurement;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "rawMaterial")
	private List<RawMaterialList> rawMaterialList = new ArrayList<>();
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "rawMaterial")
	private List<ProductionMaterial> productionMaterial = new ArrayList<>();

	public RawMaterial() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RawMaterial(String material_cd, String material_name, String unit_of_measurement) {
		super();
		this.material_cd = material_cd;
		this.material_name = material_name;
		this.unit_of_measurement = unit_of_measurement;
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

	public String getUnit_of_measurement() {
		return unit_of_measurement;
	}

	public void setUnit_of_measurement(String unit_of_measurement) {
		this.unit_of_measurement = unit_of_measurement;
	}

	@Override
	public String toString() {
		return "RawMaterial [material_cd=" + material_cd + ", material_name=" + material_name + ", unit_of_measurement="
				+ unit_of_measurement + "]";
	}

}
