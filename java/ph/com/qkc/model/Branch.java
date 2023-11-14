package ph.com.qkc.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "grp2_branch")
public class Branch {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "branch_id", nullable = false)
	private Integer branchId; //primary
	private String branch_name;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "branch")
	private List<RawMaterialList> rawMaterialList = new ArrayList<>();
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "branch")
	private List<User> user = new ArrayList<>();
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "branch")
	private List<DailyPlannedProduction> dailyPlannedProduction = new ArrayList<>();

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "branch")
	private List<Fpl> fpl = new ArrayList<>();
	public Branch() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Branch(Integer branchId, String branch_name, List<RawMaterialList> rawMaterialList, List<User> user,
			List<DailyPlannedProduction> dailyPlannedProduction, List<Fpl> fpl) {
		super();
		this.branchId = branchId;
		this.branch_name = branch_name;
		this.rawMaterialList = rawMaterialList;
		this.user = user;
		this.dailyPlannedProduction = dailyPlannedProduction;
		this.fpl = fpl;
	}



	public Integer getBranchId() {
		return branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}

	public List<RawMaterialList> getRawMaterialList() {
		return rawMaterialList;
	}

	public void setRawMaterialList(List<RawMaterialList> rawMaterialList) {
		this.rawMaterialList = rawMaterialList;
	}

	public List<User> getUser() {
		return user;
	}

	public void setUser(List<User> user) {
		this.user = user;
	}

	public List<DailyPlannedProduction> getDailyPlannedProduction() {
		return dailyPlannedProduction;
	}

	public void setDailyPlannedProduction(List<DailyPlannedProduction> dailyPlannedProduction) {
		this.dailyPlannedProduction = dailyPlannedProduction;
	}
	

	
	public List<Fpl> getFpl() {
		return fpl;
	}

	public void setFpl(List<Fpl> fpl) {
		this.fpl = fpl;
	}

//	@Override
//	public String toString() {
//		return "Branch [branchId=" + branchId + ", branch_name=" + branch_name + ", rawMaterialList=" + rawMaterialList
//				+ ", user=" + user + ", dailyPlannedProduction=" + dailyPlannedProduction + "]";
//	}


}
