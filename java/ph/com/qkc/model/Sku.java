package ph.com.qkc.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "grp2_sku")
public class Sku {
	
	@Id
	private String sku_cd; //primary
	private String sku_name;
	private String unit_of_measurement;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "sku")
	private List<DailyPlannedProduction> dailyPlannedProduction = new ArrayList<>();
	
	@OneToMany(mappedBy = "sku", fetch = FetchType.EAGER)
    private List<Fpl> fplList = new ArrayList<>();

	
	public Sku() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Sku(String sku_cd, String sku_name, String unit_of_measurement,
			List<DailyPlannedProduction> dailyPlannedProduction, List<Fpl> fplList) {
		super();
		this.sku_cd = sku_cd;
		this.sku_name = sku_name;
		this.unit_of_measurement = unit_of_measurement;
		this.dailyPlannedProduction = dailyPlannedProduction;
		this.fplList = fplList;
	}

	public String getSku_cd() {
		return sku_cd;
	}

	public void setSku_cd(String sku_cd) {
		this.sku_cd = sku_cd;
	}

	public String getSku_name() {
		return sku_name;
	}

	public void setSku_name(String sku_name) {
		this.sku_name = sku_name;
	}

	public String getUnit_of_measurement() {
		return unit_of_measurement;
	}

	public void setUnit_of_measurement(String unit_of_measurement) {
		this.unit_of_measurement = unit_of_measurement;
	}

	public List<DailyPlannedProduction> getDailyPlannedProduction() {
		return dailyPlannedProduction;
	}

	public void setDailyPlannedProduction(List<DailyPlannedProduction> dailyPlannedProduction) {
		this.dailyPlannedProduction = dailyPlannedProduction;
	}

	public List<Fpl> getFplList() {
		return fplList;
	}

	public void setFplList(List<Fpl> fplList) {
		this.fplList = fplList;
	}

//	@Override
//	public String toString() {
//		return "Sku [sku_cd=" + sku_cd + ", sku_name=" + sku_name + ", unit_of_measurement=" + unit_of_measurement
//				+ ", dailyPlannedProduction=" + dailyPlannedProduction + ", fplList=" + fplList + "]";
//	}
//	
}
