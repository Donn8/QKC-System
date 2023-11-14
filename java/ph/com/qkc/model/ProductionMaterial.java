package ph.com.qkc.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "grp2_production_materials")
public class ProductionMaterial {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pm_id; //primary
//	private Integer dpp_id; //foreign
//	private String material_cd; //foreign
	private Integer quantity_to_use;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "dpp_id")
	@JsonIgnore
	private DailyPlannedProduction dailyPlannedProduction;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "material_cd")
	private RawMaterial rawMaterial;

	public ProductionMaterial() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductionMaterial(Integer pm_id, Integer quantity_to_use, DailyPlannedProduction dailyPlannedProduction,
			RawMaterial rawMaterial) {
		super();
		this.pm_id = pm_id;
		this.quantity_to_use = quantity_to_use;
		this.dailyPlannedProduction = dailyPlannedProduction;
		this.rawMaterial = rawMaterial;
	}

	public Integer getPm_id() {
		return pm_id;
	}

	public void setPm_id(Integer pm_id) {
		this.pm_id = pm_id;
	}

	public Integer getQuantity_to_use() {
		return quantity_to_use;
	}

	public void setQuantity_to_use(Integer quantity_to_use) {
		this.quantity_to_use = quantity_to_use;
	}

	public DailyPlannedProduction getDailyPlannedProduction() {
		return dailyPlannedProduction;
	}

	public void setDailyPlannedProduction(DailyPlannedProduction dailyPlannedProduction) {
		this.dailyPlannedProduction = dailyPlannedProduction;
	}

	public RawMaterial getRawMaterial() {
		return rawMaterial;
	}

	public void setRawMaterial(RawMaterial rawMaterial) {
		this.rawMaterial = rawMaterial;
	}

	@Override
	public String toString() {
		return "ProductionMaterial [pm_id=" + pm_id + ", quantity_to_use=" + quantity_to_use
				+ ", dailyPlannedProduction=" + dailyPlannedProduction + ", rawMaterial=" + rawMaterial + "]";
	}
	
}
