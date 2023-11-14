package ph.com.qkc.model;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "grp2_dispatch_type")
public class DispatchType {
    public DispatchType(String dispatchTypeCd, String dispatchTypeName) {
        super();
        this.dispatchTypeCd = dispatchTypeCd;
        this.dispatchTypeName = dispatchTypeName;
    }

    public DispatchType() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Id
    @Column(name = "DISPATCH_TYPE_CD")
    private String dispatchTypeCd;

    @Column(name = "DISPATCH_TYPE_NAME")
    private String dispatchTypeName;

    @OneToMany(mappedBy = "dispatchType", fetch = FetchType.EAGER)
    private List<DispatchTracking> dispatchTrackings = new ArrayList<>();

    @Override
    public String toString() {
        return "DispatchType [dispatchTypeCd=" + dispatchTypeCd + ", dispatchTypeName=" + dispatchTypeName + "]";
    }

    public String getDispatchTypeCd() {
        return dispatchTypeCd;
    }

    public void setDispatchTypeCd(String dispatchTypeCd) {
        this.dispatchTypeCd = dispatchTypeCd;
    }

    public String getDispatchTypeName() {
        return dispatchTypeName;
    }

    public void setDispatchTypeName(String dispatchTypeName) {
        this.dispatchTypeName = dispatchTypeName;
    }

}
