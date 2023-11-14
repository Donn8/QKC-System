package ph.com.qkc.model;

import java.util.ArrayList;
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
@Table(name = "grp2_user")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer user_id; //primary
	private String username;
	private String password;
//	private Integer branch_id; foreign
	private String name;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
	private List<RawMaterialList> rawMaterialList = new ArrayList<>();
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "branch_id")
	private Branch branch;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(Integer user_id, String username, String password, String name, List<RawMaterialList> rawMaterialList,
			Branch branch) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.rawMaterialList = rawMaterialList;
		this.branch = branch;
	}
	
	public User(Integer user_id, String username, String name, Branch branch) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.name = name;
		this.branch = branch;
	}

	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<RawMaterialList> getRawMaterialList() {
		return rawMaterialList;
	}

	public void setRawMaterialList(List<RawMaterialList> rawMaterialList) {
		this.rawMaterialList = rawMaterialList;
	}

	public Branch getBranch() {
		return branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", username=" + username + ", password=" + password + ", name=" + name
				+ ", branch=" + branch + "]";
	}
	

}
