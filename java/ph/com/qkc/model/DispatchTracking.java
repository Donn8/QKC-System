package ph.com.qkc.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "grp2_dispatch_tracking")
public class DispatchTracking {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DISPATCH_TRACK_ID")
	private Integer dispatchTrackingId;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "DISPATCH_TYPE_CD", referencedColumnName = "DISPATCH_TYPE_CD")
	private DispatchType dispatchType;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FPL_ID", referencedColumnName = "FPL_ID")
	private Fpl fplId;

	@Column(name = "QUANTITY")
	private Integer quantity;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "BRANCH_ID", referencedColumnName = "BRANCH_ID")
	private Branch branch;

	@Column(name = "DESTINATION")
	private String destination;

	@Column(name = "DISPATCH_DATE")
	private Date dispatchDate;

	public DispatchTracking() {
		this.dispatchDate = new Date();
	}

	public DispatchTracking(Integer dispatchTrackingId, DispatchType dispatchType, Fpl fplId, Integer quantity,
			Branch branch, String destination, Date dispatchDate) {
		this.dispatchTrackingId = dispatchTrackingId;
		this.dispatchType = dispatchType;
		this.fplId = fplId;
		this.quantity = quantity;
		this.branch = branch;
		this.destination = destination;
		this.dispatchDate = new Date();
	}

	@Override
	public String toString() {
		return "DispatchTracking [dispatchTrackingId=" + dispatchTrackingId + ", dispatchType=" + dispatchType
				+ ", fplId=" + fplId + ", quantity=" + quantity + ", branchId=" + branch + ", destination="
				+ destination + ", dispatchDate=" + dispatchDate + "]";
	}

	public Integer getDispatchTrackingId() {
		return dispatchTrackingId;
	}

	public void setDispatchTrackingId(Integer dispatchTrackingId) {
		this.dispatchTrackingId = dispatchTrackingId;
	}

	public DispatchType getDispatchType() {
		return dispatchType;
	}

	public void setDispatchType(DispatchType dispatchType) {
		this.dispatchType = dispatchType;
	}

	public Fpl getFplId() {
		return fplId;
	}

	public void setFplId(Fpl fplId) {
		this.fplId = fplId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Branch getBranchId() {
		return branch;
	}

	public void setBranchId(Branch branch) {
		this.branch = branch;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public Date getDispatchDate() {
		return dispatchDate;
	}

	public void setDispatchDate(Date dispatchDate) {
		this.dispatchDate = dispatchDate;
	}

	public Fpl getFpl() {
		return fplId;
	}

	public void setFpl(Fpl fpl) {
		this.fplId = fpl;
	}

}
