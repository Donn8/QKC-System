package ph.com.qkc.model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "grp2_raw_material_list")
public class RawMaterialList {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer material_list_id; //primary
	private Integer quantity;
	private Date date_receive = new Date();
//	private Integer material_cd; foreign
//	private Integer user_id; foreign
//	private Integer branch_id; foreign
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "material_cd")
	private RawMaterial rawMaterial;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "branch_id")
	private Branch branch;

	public RawMaterialList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RawMaterialList(Integer material_list_id, Integer quantity, Date date_receive, RawMaterial rawMaterial,
			User user, Branch branch) {
		super();
		this.material_list_id = material_list_id;
		this.quantity = quantity;
		this.date_receive = date_receive;
		this.rawMaterial = rawMaterial;
		this.user = user;
		this.branch = branch;
	}

	public Integer getMaterial_list_id() {
		return material_list_id;
	}

	public void setMaterial_list_id(Integer material_list_id) {
		this.material_list_id = material_list_id;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Date getDate_receive() {
		return date_receive;
	}

	public void setDate_receive(Date date_receive) {
		this.date_receive = date_receive;
	}

	public RawMaterial getRawMaterial() {
		return rawMaterial;
	}

	public void setRawMaterial(RawMaterial rawMaterial) {
		this.rawMaterial = rawMaterial;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Branch getBranch() {
		return branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

	@Override
	public String toString() {
		return "RawMaterialList [material_list_id=" + material_list_id + ", quantity=" + quantity + ", date_receive="
				+ date_receive + ", rawMaterial=" + rawMaterial + ", user=" + user + ", branch=" + branch + "]";
	}

}
