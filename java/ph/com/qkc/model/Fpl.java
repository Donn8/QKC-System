package ph.com.qkc.model;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "grp2_finished_product_list")
public class Fpl {

    public Fpl(Integer fplId, Sku sku, Integer quantity, Branch branch, Date dateFinished) {
		super();
		this.fplId = fplId;
		this.sku = sku;
		this.quantity = quantity;
		this.branch = branch;
		this.dateFinished = dateFinished;
	}

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "FPL_ID")
    private Integer fplId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "SKU_CD", referencedColumnName = "SKU_CD")
    private Sku sku;

    @Column(name = "QUANTITY")
    private Integer quantity;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "BRANCH_ID", referencedColumnName = "BRANCH_ID")
    private Branch branch;

    @Column(name = "DATE_FINISHED")
    @Temporal(TemporalType.DATE)
    private Date dateFinished;


    public Fpl() {
    	
    }

	@Override
	public String toString() {
		return "Fpl [fplId=" + fplId + ", sku=" + sku + ", quantity=" + quantity + ", branch=" + branch
				+ ", dateFinished=" + dateFinished + "]";
	}

	public Integer getFplId() {
		return fplId;
	}



	public void setFplId(Integer fplId) {
		this.fplId = fplId;
	}



	public Sku getSku() {
		return sku;
	}



	public void setSku(Sku sku) {
		this.sku = sku;
	}



	public Integer getQuantity() {
		return quantity;
	}



	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}



	public Branch getBranch() {
		return branch;
	}



	public void setBranch(Branch branch) {
		this.branch = branch;
	}



	public Date getDateFinished() {
		return dateFinished;
	}



	public void setDateFinished(Date dateFinished) {
		this.dateFinished = dateFinished;
	}


   
}
