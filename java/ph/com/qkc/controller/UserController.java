package ph.com.qkc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

import jakarta.servlet.http.HttpSession;
import ph.com.qkc.model.Branch;
import ph.com.qkc.model.CurrentInventoryProducts;
import ph.com.qkc.model.CurrentRawMaterialInventory;
import ph.com.qkc.model.DailyPlannedProduction;
import ph.com.qkc.model.DispatchTracking;
import ph.com.qkc.model.DispatchType;
import ph.com.qkc.model.Fpl;
import ph.com.qkc.model.ProductionMaterial;
import ph.com.qkc.model.RawMaterial;
import ph.com.qkc.model.RawMaterialList;
import ph.com.qkc.model.Sku;
import ph.com.qkc.model.UniqueRawMaterial;
import ph.com.qkc.model.UniqueSku;
import ph.com.qkc.model.User;
import ph.com.qkc.service.DailyPlannedProductionService;
import ph.com.qkc.service.RawMaterialListService;
import ph.com.qkc.service.RawMaterialService;
import ph.com.qkc.service.SkuService;
import ph.com.qkc.service.UserAuthService;
import ph.com.qkc.service.DispatchTrackingService;
import ph.com.qkc.service.DispatchTypeService;
import ph.com.qkc.service.FplService;
import ph.com.qkc.service.MaintenanceService;
import ph.com.qkc.service.ProductionMaterialService;


@Controller
public class UserController {
	
	@Autowired
	private UserAuthService userAuthSvc;
	
	@Autowired
	private RawMaterialService rawMatService;
	
	@Autowired
	private RawMaterialListService rawMatListService;
	
	@Autowired
	private DailyPlannedProductionService dppService;
	
	@Autowired
	private SkuService skuService;
	
	@Autowired
	private ProductionMaterialService prodMatService;
	
	@Autowired
	private DispatchTrackingService dispatchService;
	
	@Autowired
	private DispatchTypeService dispatchTypeService;
	
	@Autowired
	private FplService fplService;
	
	@Autowired
	private MaintenanceService mService;
	
	@GetMapping("/")
	public String loginPage(HttpSession session) {
		if(session.getAttribute("user") != null) {
			return "mainPage";
		}else {
		return "loginPage";
		}
	}
	// For authentication purposes
	@PostMapping("/auth")
	public String authenticate(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
		String returnPg = "loginPage";
		
		User userCred= new User(username, password);	
		User user = userAuthSvc.authenticate(userCred);
		
		if(user!=null) {
			// Store user information in the session.
			session.setAttribute("user", user);
			model.addAttribute("user",user);
			returnPg = "redirect:/main";
			
		} else {
			model.addAttribute("error", "Invalid Credentials");
			return returnPg;			
		}
		return returnPg;
	}
	
	@GetMapping("/main")
	public String mainPage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	return "mainPage";
        }	
	}
	
//	@GetMapping("/maintenance/rawmaterials")
//	public String getRawMaterials(Model model, HttpSession session) {
//		User user = (User) session.getAttribute("user");
//		if (user == null) {
//            // Handle unauthenticated users
//            return "redirect:/"; // Redirect to the login page
//        }else {
//        	List<RawMaterial> rawMaterials = rawMatService.getRawMaterials();
//    		model.addAttribute("rawMaterials", rawMaterials);
//    		return "rawMaterials";
//        }	
//	}

	@GetMapping("/rawmaterials") //RawMaterialListMainPage
	public String goToRawMaterialListPage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
			List<RawMaterial> rawMaterials = rawMatService.getRawMaterials(); //for select tag to choose from
			model.addAttribute("rawMaterials", rawMaterials);
			return "rawMaterialListMain";
        }
	}
	
	@GetMapping("rawmaterials/list") //Processing of RawMaterialListTable
	public String getRawMaterialList(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
			List<RawMaterialList> rawMaterialList = rawMatListService.getRawMaterialListByBranchId(branchID);//from session
			model.addAttribute("rawMaterialList", rawMaterialList);
			model.addAttribute("user",user);
			return "rawMaterialList";
        }
	}
	
	@GetMapping("/finishedProductList") //finishedProductListMainPage
	public String goToFinishedProductListPage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
			return "finishedProductListMain";
        }
	}
	
	@GetMapping("finishedProduct/list") //Processing of finishedProductListTable
	public String getfinishedProductList(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
    		List<Fpl> finishedProductList = fplService.getFplByBranchId(branchID); //from session
			model.addAttribute("finishedProductList", finishedProductList);
			model.addAttribute("user",user);
			return "finishedProductList";
        }
	}
	
	@GetMapping("/daily-planned-production") //DailyPlannedProductionMainPage
	public String goToDailyPlannedProductionListPage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	List<Sku> skuList = skuService.getSkuList(); //for select tag to choose from
        	model.addAttribute("skuList", skuList);
			return "dailyPlannedProductionListMain";
        }
	}
	
	@GetMapping("daily-planned-production/list") //Processing of DailyProductionListTable
	public String getdailyPlannedProductionList(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
			List<DailyPlannedProduction> dppList = dppService.getDppListByBranchId(branchID);//from session
			model.addAttribute("dppList", dppList);
			model.addAttribute("user",user);
			return "dailyPlannedProductionList";
        }
	}
	
	@GetMapping("daily-planned-production/availList") //Processing of AvailRawMaterialsTbl
	public String getAvailRawMaterials(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
    		List<UniqueRawMaterial> rawMaterialList = rawMatListService.getUniqueRawMaterialByBranchId(branchID);
			model.addAttribute("rawMaterialList",rawMaterialList);
			return "availRawMaterialList";
        }
	}
	
	@GetMapping("daily-planned-production/availEditList") //Processing of AvailRawMaterialsTbl
	public String getAvailEditRawMaterials(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
    		List<UniqueRawMaterial> rawMaterialList = rawMatListService.getUniqueRawMaterialByBranchId(branchID);
			model.addAttribute("rawMaterialList",rawMaterialList);
			return "availEditRawMaterialList";
        }
	}
	
	@PostMapping("daily-planned-production/changeStatus") //For dpp changeStatus
	public String updateProductionPlanStatus(@RequestParam String dppId, String status) {
		DailyPlannedProduction dppID = dppService.getDppByDppId(Integer.parseInt(dppId));
		dppID.setStatus(status);
		dppService.updateDppStatus(dppID);
		Sku sku = new Sku();
		sku.setSku_cd(dppID.getSku().getSku_cd());
		Branch branch = new Branch();
		branch.setBranchId(dppID.getBranch().getBranchId());
		Fpl fpl = new Fpl();
		fpl.setSku(sku);
		fpl.setQuantity(dppID.getQuantity());
		fpl.setBranch(branch);
		fpl.setDateFinished(dppID.getProduction_date());
		fplService.addFinishedProduct(fpl);
		return "dailyPlannedProductionListMain";
	}
	
	
	@PostMapping("daily-planned-production/add") //For dpp add Form
	public String addProductionPlan(@RequestParam String sku_cd, @RequestParam(value = "sku_material_cd") String[] sku_material_cd, @RequestParam(value = "skuQuantityUse") String[] skuQuantityUse, Integer skuQuantity, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Branch branch = user.getBranch();
		Integer branchID = (branch != null) ? branch.getBranchId() : null;
		
		//For Dpp
		DailyPlannedProduction dpp = new DailyPlannedProduction();
		Branch branchId = new Branch();
		branchId.setBranchId(branchID);
		Sku skuCd = new Sku();
		skuCd.setSku_cd(sku_cd);
		dpp.setBranch(branchId);
		dpp.setSku(skuCd);
		dpp.setQuantity(skuQuantity);
		dppService.addDppList(dpp);
		
		//For Pm
		DailyPlannedProduction dppId = dppService.getLatestDppId();
		for(int i = 0; i < skuQuantityUse.length; ++i) {
			ProductionMaterial pm = new ProductionMaterial();
			RawMaterial rawMaterial = new RawMaterial();
			rawMaterial.setMaterial_cd(sku_material_cd[i]);
			DailyPlannedProduction maxDppId = new DailyPlannedProduction();
			maxDppId.setDpp_id(dppId.getDpp_id());
			pm.setDailyPlannedProduction(maxDppId);
			pm.setRawMaterial(rawMaterial);
			pm.setQuantity_to_use(Integer.parseInt(skuQuantityUse[i]));
			prodMatService.addProdMatList(pm);	
		}
		return "dailyPlannedProductionListMain";
	}
	
	@PostMapping("daily-planned-production/edit") //For dpp edit Form
	public String editProductionPlan(@RequestParam String editDppId, String edit_sku_cd, @RequestParam(value = "edit_sku_material_cd") String[] edit_sku_material_cd, @RequestParam(value = "editSkuQuantityUse") String[] editSkuQuantityUse, Integer editSkuQuantity, HttpSession session) {
		
		//For Edit Dpp
		DailyPlannedProduction existDppId = dppService.getDppByDppId(Integer.parseInt(editDppId));
		Sku skuCd = new Sku();
		skuCd.setSku_cd(edit_sku_cd);
		existDppId.setSku(skuCd);
		existDppId.setQuantity(editSkuQuantity);
		dppService.updateDppList(existDppId);
		
		prodMatService.delPrevListByDppId(Integer.parseInt(editDppId));
		//For Edit Pm
		for(int i = 0; i < editSkuQuantityUse.length; ++i) {
			ProductionMaterial pm = new ProductionMaterial();
			RawMaterial rawMaterial = new RawMaterial();
			rawMaterial.setMaterial_cd(edit_sku_material_cd[i]);
			DailyPlannedProduction currentDppId = new DailyPlannedProduction();
			currentDppId.setDpp_id(Integer.parseInt(editDppId));
			pm.setDailyPlannedProduction(currentDppId);
			pm.setRawMaterial(rawMaterial);
			pm.setQuantity_to_use(Integer.parseInt(editSkuQuantityUse[i]));
			prodMatService.addProdMatList(pm);	
		}
		return "dailyPlannedProductionListMain";
	}
	
	@PostMapping("daily-planned-production/delete") //For dpp delete confirmation
	public String deleteProductionPlan(@RequestParam String delDppId) {
		dppService.deleteProductionPlanById(Integer.parseInt(delDppId));
		return "dailyPlannedProductionListMain";
	}
	

	@PostMapping(value ="prevSelection", produces="application/json") //For getting previous selection of avail raw materials
	@ResponseBody
	public List<ProductionMaterial> getPrevSelection(String dppId) throws JsonProcessingException{
		List<ProductionMaterial> prevSelection = prodMatService.getPmByDppId(Integer.parseInt(dppId));
		return prevSelection;
	}
	
	@PostMapping("/rawmaterials/add") //For add Form
	public String addRawMaterialList(@RequestParam String material_cd, String quantity,Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Integer userId = user.getUser_id();
		User userID = new User();
		userID.setUser_id(userId);
		
		RawMaterial rawMaterial = new RawMaterial();
		rawMaterial.setMaterial_cd(material_cd);

		RawMaterialList rawMaterialList = new RawMaterialList();
		rawMaterialList.setRawMaterial(rawMaterial);
		rawMaterialList.setQuantity(Integer.parseInt(quantity));
		rawMaterialList.setUser(userID);
		rawMaterialList.setBranch(user.getBranch());
		
		rawMatListService.addRawMaterialList(rawMaterialList);
		List<RawMaterial> rawMaterials = rawMatService.getRawMaterials(); //for select tag to choose from
		model.addAttribute("rawMaterials", rawMaterials);
		return "rawMaterialListMain";
	}
	
	@PostMapping("/rawmaterials/edit") //For edit form
	public String editRawMaterialList(@RequestParam String materialListId, String edit_material_cd, String editQuantity, Model model ) {
		RawMaterialList existRawMatList = rawMatListService.getExistRawMaterialListById(Integer.parseInt(materialListId));
		if(existRawMatList != null) {
			RawMaterial rawMaterial = new RawMaterial();
			rawMaterial.setMaterial_cd(edit_material_cd);
			existRawMatList.setRawMaterial(rawMaterial);
			existRawMatList.setQuantity(Integer.parseInt(editQuantity));
			rawMatListService.updateRawMaterialList(existRawMatList);
		}
		List<RawMaterial> rawMaterials = rawMatService.getRawMaterials(); //for select tag to choose from
		model.addAttribute("rawMaterials", rawMaterials);
		return "rawMaterialListMain";
	}
	
	@PostMapping("/rawmaterials/delete") //For delete confirmation
	public String deleteRawMaterialList(@RequestParam String delmaterialListId, Model model) {
		rawMatListService.deleteRawMaterialList(Integer.parseInt(delmaterialListId));
		List<RawMaterial> rawMaterials = rawMatService.getRawMaterials(); //for select tag to choose from
		model.addAttribute("rawMaterials", rawMaterials);
		return "rawMaterialListMain";
	}
	
	@GetMapping("/dispatch")
	public String goToHomePage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
        	List<UniqueSku> uniSku = dispatchService.findUniqueSku(branchID);
        	model.addAttribute("uniSku",uniSku);
        	List<DispatchType> dtList= dispatchTypeService.getAllDispatchTypes();
        	model.addAttribute("dtList",dtList);
        	
        	return "dispIndex";
        }
	}

	@GetMapping("/dispatch/list")
	public String getDispatch(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
		    List<DispatchTracking> dispatchList = dispatchService.findAllOrderedById(branchID);
		    model.addAttribute("dispList", dispatchList);
		    
		    return "dispList";
        }
	}

	@PostMapping("dispatch/add")
	public String addDispatchTracking(@RequestParam String dispatchTypeCd, String fplId, String quantity,
		String destination, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		DispatchType dispatchType = new DispatchType();
		dispatchType.setDispatchTypeCd(dispatchTypeCd);

		Fpl fplID = new Fpl();
		fplID.setFplId(Integer.parseInt(fplId));
		Branch branch = user.getBranch();

		DispatchTracking dispatch = new DispatchTracking();
		dispatch.setFplId(fplID);
		dispatch.setDispatchType(dispatchType);
		dispatch.setQuantity(Integer.parseInt(quantity));
		dispatch.setBranchId(branch);
		dispatch.setDestination(destination);

		dispatchService.addDispatchTracking(dispatch);

		List<Fpl> fpl = fplService.getFpl();
    	model.addAttribute("fpl",fpl);
    	List<DispatchType> dtList= dispatchTypeService.getAllDispatchTypes();
    	model.addAttribute("dtList",dtList);
    	
		return "redirect:/dispatch";
	}

	@PostMapping("dispatch/edit")
	public String editDispatchTracking(@RequestParam Integer dispatchTrackingId, String dispatchTypeCd, String fplId,
			String quantity, String destination, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		DispatchTracking dispatch = dispatchService.findDispatchById(dispatchTrackingId);

		DispatchType dispatchType = new DispatchType();
		dispatchType.setDispatchTypeCd(dispatchTypeCd);
		Branch branch = user.getBranch();

		Fpl fplID = new Fpl();
		fplID.setFplId(Integer.parseInt(fplId));

		dispatch.setDispatchType(dispatchType);
		dispatch.setFplId(fplID);
		dispatch.setQuantity(Integer.parseInt(quantity));
		dispatch.setBranchId(branch);
		dispatch.setDestination(destination);

		dispatchService.updateDispatchTracking(dispatch);
		

		
    	return "redirect:/dispatch";
	}

	
	@PostMapping("dispatch/delete") // For delete confirmation
	public String deleteDispList(@RequestParam Integer deldispatchTrackingId, Model model, HttpSession session) {
	   
		dispatchService.deleteDispList(deldispatchTrackingId);
	  
		return "redirect:/dispatch";	
		 
	}
	
	@GetMapping("/report-gen-section")
	public String goToMainPage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {   	
        	return "reportMain";
        }
	}
	
	@PostMapping("/report-gen-section/fplReport") 
	public String getFplReport(@RequestParam("fromDate") String fromDate,
            				   @RequestParam("toDate") String toDate, 
            				   Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
		    List<Fpl> fpl = fplService.findByDateFinishedBetween(branchID,fromDate,toDate);
		    model.addAttribute("fpList", fpl);
			return "fplReport";
        }
		
		
	}
	
	@PostMapping("/report-gen-section/cpiReport")
	public String getCurrentProductInventoryReport(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
		    List<CurrentInventoryProducts> cpiReport = fplService.findCurrentInventoryProducts(branchID);
		    model.addAttribute("cpiReport", cpiReport);
			return "currentInventoryProductsReport";
        }
	}
	
	@PostMapping("/report-gen-section/rmlReport") 
	public String getRmlReport(@RequestParam("fromDate") String fromDate,
            				   @RequestParam("toDate") String toDate, 
            				   Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
		    List<RawMaterialList> rml = rawMatListService.getRmlByDateReceivedAndBranchId(branchID,fromDate,toDate);
		    model.addAttribute("rawMaterialList", rml);
			return "rmlReport";
        }
		
		
	}
	
	@PostMapping("/report-gen-section/crmiReport") 
	public String getPrmReport(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
			List<CurrentRawMaterialInventory> crmInventory = rawMatListService.findCurrentRmInventoryByBranchId(branchID);//from session
			model.addAttribute("crmInv", crmInventory);
			model.addAttribute("user",user);
			return "crmiReport";
        }
	}
	
	@PostMapping("/report-gen-section/dppReport") 
	public String getDppReport(@RequestParam("fromDate") String fromDate,
			   					@RequestParam("toDate") String toDate, 
		   						Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	Branch branch = user.getBranch();
    		Integer branchID = (branch != null) ? branch.getBranchId() : null;
			List<DailyPlannedProduction> dppList = dppService.getDppListByProductionDateAndBranchId(branchID, fromDate, toDate);
			model.addAttribute("dppList", dppList);
			model.addAttribute("user",user);
			return "dppReport";
        }
		
	}
	
	
	@GetMapping("/branch")
	public String goToBranchPage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	return "branch";
        }
	}
	
	@GetMapping("/dispatchType")
	public String goToDispatchTypePage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	return "dispatchType";
        }
	}
	
	@GetMapping("/rawMaterial")
	public String goToRawMaterialPage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	return "rawMaterial";
        }
	}

	@GetMapping("/sku")
	public String goToSkuPage(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
            // Handle unauthenticated users
            return "redirect:/"; // Redirect to the login page
        }else {
        	return "sku";
        }
	}
	
	
	
		@GetMapping("branch/list")
		public String getBranches(Model model, HttpSession session) {
			User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	List<Branch> branchList = mService.getBranches();
				model.addAttribute("brnchList", branchList);
				return "brnchList";
	        }
		}
		
		@PostMapping("branch/add")
		public String addBranch(@RequestParam String addBranchName, Model model, HttpSession session) {
			User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	Branch branch = new Branch();
				branch.setBranch_name(addBranchName);
				mService.addBranch(branch);			
				return "branch";
	        }
		}
		
		@PostMapping("branch/edit")
		public String editBranch(@RequestParam String oldBranchId, String newBranchName, Model model, HttpSession session) {		
			User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	Branch existingBranch = mService.getBranchByBranchId(Integer.parseInt(oldBranchId));
				existingBranch.setBranch_name(newBranchName);
				mService.editBranch(existingBranch);
				return "branch";
	        }
		}
		
		@PostMapping("branch/delete")
		public String deleteBranch(@RequestParam String txtBranchId, HttpSession session) {		
			
			 mService.deleteBranchByBranchId(Integer.parseInt(txtBranchId));
			
			return "branch";
		}
	
	
		@GetMapping("dispatchType/list")
		public String getDispatchTypes(Model model, HttpSession session) {
			User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	List<DispatchType> dispatchTypeList = mService.getDispatchTypes();
				model.addAttribute("dispTypList", dispatchTypeList);
				return "dispTypList";
	        }
		}
		
		@PostMapping("dispatchType/add")
		public String addDispatchType(@RequestParam String addDispTypCd, String addDispTypName, Model model, HttpSession session) {
			User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	DispatchType dispTyp = new DispatchType();
				dispTyp.setDispatchTypeCd(addDispTypCd);
				dispTyp.setDispatchTypeName(addDispTypName);
				mService.addDispatchType(dispTyp);			
				return "dispatchType";
	        }
		}
		
		@PostMapping("dispatchType/edit")
		public String editDispatchType(@RequestParam String newDispTypCd, String newDispTypName,  String oldDispTypCd, Model model, HttpSession session) {		
			User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	mService.editDispatchType(newDispTypCd, newDispTypName, oldDispTypCd);
	        	return "dispatchType";
	        }
		}
		
		@PostMapping("dispatchType/delete")
		public String deleteDispatchType(@RequestParam String dispTypCd, HttpSession session) {		
			mService.deleteDispatchTypeByDispTypCd(dispTypCd);
			return "dispatchType";
		}

	
		@GetMapping("rawMaterial/list")
		public String getRawMaterials(Model model, HttpSession session) {
			User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	List<RawMaterial> rawMaterialList = mService.getRawMaterials();
				model.addAttribute("rawMatList", rawMaterialList);
				return "rawMatList";
	        }
		}
		
	   @PostMapping("rawMaterial/add")
		public String addRawMaterial(@RequestParam String addRawMatCd, String addRawMatName, String addRawMatUOM, Model model, HttpSession session) {
		   User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	RawMaterial rawMat = new RawMaterial();
			   rawMat.setMaterial_cd(addRawMatCd);
			   rawMat.setMaterial_name(addRawMatName);
			   rawMat.setUnit_of_measurement(addRawMatUOM);
			   mService.addRawMaterial(rawMat);			
			   return "rawMaterial";
	       }
		}
		
		@PostMapping("rawMaterial/edit")
		public String editRawMaterial(@RequestParam String newRawMatCd, String newRawMatName, String newRawMatUOM,  String oldRawMatCd, Model model, HttpSession session) {		
			User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	mService.editRawMaterial(newRawMatCd, newRawMatName, newRawMatUOM, oldRawMatCd);
			return "rawMaterial";
	        }
		}
		
		@PostMapping("rawMaterial/delete")
		public String deleteRawMaterial(@RequestParam String rawMaterialCd, HttpSession session) {		
			mService.deleteRawMaterialByRawMatCd(rawMaterialCd);
			return "rawMaterial";
		}
	

	
		@GetMapping("sku/list")
		public String getSkus(Model model, HttpSession session) {
			User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	List<Sku> skuList = mService.getSkus();
				model.addAttribute("skuList", skuList);
				return "skuList";
	        }
		}
		
		@PostMapping("sku/add")
		public String addSku(@RequestParam String addSkuCd, String addSkuName, String addSkuUOM, Model model, HttpSession session) {
			User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	Sku sku = new Sku();
				sku.setSku_cd(addSkuCd);
				sku.setSku_name(addSkuName);
				sku.setUnit_of_measurement(addSkuUOM);
				mService.addSku(sku);
				return "sku";
	        }
		}
		
		@PostMapping("sku/edit")
		public String editSku(@RequestParam String newSkuCd, String newSkuName, String newSkuUOM,  String oldSkuCd, Model model, HttpSession session) {		
			User user = (User) session.getAttribute("user");
			if (user == null) {
	            // Handle unauthenticated users
	            return "redirect:/"; // Redirect to the login page
	        }else {
	        	mService.editSku(newSkuCd, newSkuName, newSkuUOM, oldSkuCd);
	        	return "sku";
	        }
		}
		
		@PostMapping("sku/delete")
		public String deleteSku(@RequestParam String skuCode, HttpSession session) {		
			mService.deleteSkuBySkuCd(skuCode);
			return "sku";
		}
	
	
	@PostMapping("/logout") //For logout
    public String logout(HttpSession session) {
        // Invalidate the session on logout
        session.invalidate();
        return "loginPage";
    }
}
