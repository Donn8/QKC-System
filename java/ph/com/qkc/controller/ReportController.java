package ph.com.qkc.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import ph.com.qkc.config.Database;
import ph.com.qkc.model.Branch;
import ph.com.qkc.model.User;

@Controller
@RequestMapping("/report-gen-section")
public class ReportController {

	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping("/generateCpiReport")
	public ResponseEntity<byte[]> generateCpiReport(HttpSession session) {
		User user = (User) session.getAttribute("user");
		Branch branch = user.getBranch();
		Integer branchID = (branch != null) ? branch.getBranchId() : null;
		try {
			String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("MM-dd-yyyy"));
	        String reportFileName = "Report-" + currentDate + ".pdf";
			Resource resource = resourceLoader.getResource("classpath:static/reports/cpiReport.jasper");
			
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(resource.getFile());
			//JRDataSource jrDataSrc = "";
			
			Map<String, Object> reportParams = new HashMap<>();
            reportParams.put("branchId", branchID);
            
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportParams, Database.getConnection());
			
			byte[] reportBytes = JasperExportManager.exportReportToPdf(jasperPrint);
			
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("inline", reportFileName);
            
            return new ResponseEntity<>(reportBytes, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/generateCrmiReport")
	public ResponseEntity<byte[]> generateCrmiReport(HttpSession session) {
		User user = (User) session.getAttribute("user");
		Branch branch = user.getBranch();
		Integer branchID = (branch != null) ? branch.getBranchId() : null;
		try {
			String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("MM-dd-yyyy"));
	        String reportFileName = "Report-" + currentDate + ".pdf";
			Resource resource = resourceLoader.getResource("classpath:static/reports/crmiReport.jasper");
			
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(resource.getFile());
			//JRDataSource jrDataSrc = "";
			
			Map<String, Object> reportParams = new HashMap<>();
            reportParams.put("branchId", branchID);
            
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportParams, Database.getConnection());
			byte[] reportBytes = JasperExportManager.exportReportToPdf(jasperPrint);
			
			// Create a response entity with the report bytes
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("inline", reportFileName);
            
            return new ResponseEntity<>(reportBytes, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/generateFplReport")
	public ResponseEntity<byte[]> generateFplReport(@RequestParam("fromDate") String fromDate,
													   @RequestParam("toDate") String toDate,
													   HttpSession session) {
		User user = (User) session.getAttribute("user");
		Branch branch = user.getBranch();
		Integer branchID = (branch != null) ? branch.getBranchId() : null;
		try {
			String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("MM-dd-yyyy"));
	        String reportFileName = "Report-" + currentDate + ".pdf";
			Resource resource = resourceLoader.getResource("classpath:static/reports/fplReport.jasper");
			
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(resource.getFile());
			//JRDataSource jrDataSrc = "";
			
			Map<String, Object> reportParams = new HashMap<>();
			reportParams.put("fromDate", fromDate);
			reportParams.put("toDate", toDate);
            reportParams.put("branchId", branchID);
            
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportParams, Database.getConnection());
			byte[] reportBytes = JasperExportManager.exportReportToPdf(jasperPrint);
			
			// Create a response entity with the report bytes
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("inline", reportFileName);
            
            return new ResponseEntity<>(reportBytes, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/generateDppReport")
	public ResponseEntity<byte[]> generateDppReport(@RequestParam("fromDate") String fromDate,
													   @RequestParam("toDate") String toDate,
													   HttpSession session) {
		User user = (User) session.getAttribute("user");
		Branch branch = user.getBranch();
		Integer branchID = (branch != null) ? branch.getBranchId() : null;
		try {
			String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("MM-dd-yyyy"));
	        String reportFileName = "Report-" + currentDate + ".pdf";
			Resource resource = resourceLoader.getResource("classpath:static/reports/dppReport.jasper");
			
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(resource.getFile());
			//JRDataSource jrDataSrc = "";
			
			Map<String, Object> reportParams = new HashMap<>();
			reportParams.put("fromDate", fromDate);
			reportParams.put("toDate", toDate);
            reportParams.put("branchId", branchID);
            
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportParams, Database.getConnection());
			byte[] reportBytes = JasperExportManager.exportReportToPdf(jasperPrint);
			
			// Create a response entity with the report bytes
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("inline", reportFileName);
            
            return new ResponseEntity<>(reportBytes, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/generateRmlReport")
	public ResponseEntity<byte[]> generateRmlReport(@RequestParam("fromDate") String fromDate,
													   @RequestParam("toDate") String toDate,
													   HttpSession session) {
		User user = (User) session.getAttribute("user");
		Branch branch = user.getBranch();
		Integer branchID = (branch != null) ? branch.getBranchId() : null;
		try {
			String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("MM-dd-yyyy"));
	        String reportFileName = "Report-" + currentDate + ".pdf";
			Resource resource = resourceLoader.getResource("classpath:static/reports/rmlReport.jasper");
			
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(resource.getFile());
			//JRDataSource jrDataSrc = "";
			
			Map<String, Object> reportParams = new HashMap<>();
			reportParams.put("fromDate", fromDate);
			reportParams.put("toDate", toDate);
            reportParams.put("branchId", branchID);
            
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportParams, Database.getConnection());
			byte[] reportBytes = JasperExportManager.exportReportToPdf(jasperPrint);
			
			// Create a response entity with the report bytes
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDispositionFormData("inline", reportFileName);
            
            return new ResponseEntity<>(reportBytes, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
