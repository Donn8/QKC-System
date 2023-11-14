package ph.com.qkc.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "grp2_daily_planned_production")
public class DailyPlannedProduction {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer dpp_id; //primary
	private Date production_date = new Date();
//	private Integer branch_id; //foreign
//	private String sku_cd; //foreign
	private Integer quantity;
	private String status = "On Going"; //by Default
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "dailyPlannedProduction")
	private List<ProductionMaterial> productionMaterial = new ArrayList<>();
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "branch_id")
	private Branch branch;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sku_cd")
	private Sku sku;

	public DailyPlannedProduction() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DailyPlannedProduction(Integer dpp_id, Date production_date, Integer quantity, String status,
			List<ProductionMaterial> productionMaterial, Branch branch, Sku sku) {
		super();
		this.dpp_id = dpp_id;
		this.production_date = production_date;
		this.quantity = quantity;
		this.status = status;
		this.productionMaterial = productionMaterial;
		this.branch = branch;
		this.sku = sku;
	}

	public Integer getDpp_id() {
		return dpp_id;
	}

	public void setDpp_id(Integer dpp_id) {
		this.dpp_id = dpp_id;
	}

	public Date getProduction_date() {
		return production_date;
	}

	public void setProduction_date(Date production_date) {
		this.production_date = production_date;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<ProductionMaterial> getProductionMaterial() {
		return productionMaterial;
	}

	public void setProductionMaterial(List<ProductionMaterial> productionMaterial) {
		this.productionMaterial = productionMaterial;
	}

	public Branch getBranch() {
		return branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

	public Sku getSku() {
		return sku;
	}

	public void setSku(Sku sku) {
		this.sku = sku;
	}

	@Override
	public String toString() {
		return "DailyPlannedProduction [dpp_id=" + dpp_id + ", production_date=" + production_date + ", quantity="
				+ quantity + ", status=" + status + ", branch=" + branch
				+ ", sku=" + sku + "]";
	}
	
	
}
