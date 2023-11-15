<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REPORT GENERATION MAIN</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link
	href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	var contextPath = '${pageContext.request.contextPath}' + '/';
</script>
<style>
body {
	margin: 0;
	padding: 0;
	font-weight: 600;
	font-family: 'Poppins', Arial, sans-serif;
	background-image: url('/img/wood.jpg');
	background-repeat: no-repeat;
	background-size: 100% 100%;
	min-height:100vh;
}

.container{
    background-color: white; 
    padding: 10px 50px; 
    border-radius: 30px; 
    margin-bottom: 20px; 
    max-width: 600px;
}

#previewButton,
#generatePdfReport {
    background-color: #007bff; 
    color: #ffffff; 
    padding: 10px 20px; 
    border: none; 
    border-radius: 5px;
    cursor: pointer; 
    display: inline-block;
}

#previewButton:hover,
#generatePdfReport:hover {
    background-color: #0056b3; 
}


form {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
}

span {
	display: inline-block;
	width: 48%;
	margin-bottom: 15px;
}

select, input[type="date"] {
	width: 80%;
	padding: 8px;
	margin-bottom: 8px;
	border: 1px solid #3498db;
	border-radius: 3px;
	box-sizing: border-box;
	display: inline-block;
}

button {
	background-color: #3498db;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	display: inline-block;
}

#dateInputsContainer {
	margin-bottom: 8px;
}

#reportMain {
	padding: 20px 75px;
	border-radius: 10px;
	background-color: #f9f9f9;
	margin-left: 150px;
	margin-right: 0;
}

.form-control{

width:50%
}

.row>* {
width:80%
}
#previewButton {
	background-color: green;
}

</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<form id="reportForm" action="generateFplReport" method="GET">
				<div class="form-group">
					<label for="reportType">Type of Report:</label> 
					<select class="form-control" id="reportType" name="reportType">
						<option value="">Select a Report</option>
						<option value="finishedProductList">Finished Product List</option>
						<option value="currentProductInventory">Current Product
							Inventory</option>
						<option value="rawMaterialList">Raw Material List</option>
						<option value="currentRawMaterialsInventory">Current Raw
							Material Inventory</option>
						<option value="dailyPlannedProduction">Daily Planned
							Production</option>
					</select>
				</div>
				<div id="dateInputsContainer" class="form-row">
					<div class="form-group col-md-6">
						<label for="fromDate">From Date:</label> <input type="date"
							class="form-control" id="fromDate" name="fromDate">
					</div>
					<div class="form-group col-md-6">
						<label for="toDate">To Date:</label> <input type="date"
							class="form-control" id="toDate" name="toDate">
					</div>
				</div>
				<button id="previewButton" type="button" class="btn btn-primary">Preview</button>
				<div class="text-center mt-3">
					<button id="generatePdfReport" type="submit"
						class="btn btn-primary">Generate Report</button>
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div id="reportMain"></div>
	</div>
</body>
<script>
	$(document).ready(function() {
		
		$("#reportType").change(function() {
			var selectedReportType = $(this).val();
			toggleDateInputs(selectedReportType);
			console.log(selectedReportType);
			
			updateFormAction(selectedReportType);
		});
	
		toggleDateInputs($("#reportType").val());
	
		$("#previewButton").click(function() {
			var startDate = $("#fromDate").val();
			var endDate = $("#toDate").val();
			var reportType = $("#reportType").val();
			
			if ((reportType === "currentProductInventory" || reportType === "currentRawMaterialsInventory")&& reportType) {
				loadReport(reportType);
			} else if ((reportType == "") && (startDate, endDate)){
				swal("Oops!", "Invalid Report Type.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			}else if ((reportType === "finishedProductList" || reportType === "rawMaterialList" || reportType === "dailyPlannedProduction") &&
			        (startDate === "" || endDate === "") || (startDate > endDate)){
				swal("Oops!", "Invalid Date Range.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			} else if ((startDate && endDate) && reportType) {
				loadReport(reportType, startDate, endDate);
			} else {
				swal("Oops!", "Invalid Report Type and Date Range.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			}
		});
		
		$("#generatePdfReport").on("click", function () {
			var form = $("#reportForm");
			var startDate = $("#fromDate").val();
			var endDate = $("#toDate").val();
			var reportType = $("#reportType").val();
			
			if (reportType == "" && startDate == "" && endDate == ""){
				swal("Oops!", "Invalid Report Type and Date Range.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
				event.preventDefault();
			}else if ((reportType == "") && (startDate, endDate)){
				swal("Oops!", "Invalid Report Type.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
				event.preventDefault();
			}else if ((reportType === "finishedProductList" || reportType === "rawMaterialList" || reportType === "dailyPlannedProduction") &&
			        (startDate === "" || endDate === "") || (startDate > endDate)) {
				swal("Oops!", "Invalid Date Range.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
                event.preventDefault();
			} else {
                form.submit();
            }
        });
	
		function loadReport(reportType, startDate, endDate) {
			var tableId;
			var reportURL;
			switch (reportType) {
			case "finishedProductList":
				tableId = "fplTbl";
				reportURL = "fplReport";
				break;
			case "currentProductInventory":
				tableId = "cpiTbl";
				reportURL = "cpiReport";
				startDate = endDate = null;
				break;
			case "rawMaterialList":
				tableId = "rmlTbl";
				reportURL = "rmlReport";
				break;
			case "currentRawMaterialsInventory":
				tableId = "crmiReport"; // Repl	ace with the actual DataTable ID for Planned Raw Materials
				reportURL = "crmiReport";
				startDate = endDate = null;
				break;
			case "dailyPlannedProduction":
				tableId = "dppTbl"; // Replace with the actual DataTable ID for Daily Planned Production
				reportURL = "dppReport";
				break;
	
			default:
				// Handle the default case or display an error message
				break;
			}
	
			if (tableId) {
				// Make an AJAX request to the server, passing reportURL, startDate, and endDate.
				$.ajax({
					url : contextPath + "report-gen-section/"
							+ reportURL,
					method : "POST",
					data : {
						fromDate : startDate,
						toDate : endDate
					},
					success : function(result) {
						$("#reportMain").html(result);
						$("#" + tableId).dataTable();
					}
				});
			} else {
				swal("Oops!", "Invalid Date Range.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			}
		}
		
		function toggleDateInputs(reportType) {
			var dateInputsContainer = $("#dateInputsContainer");
	
			if (reportType === "currentProductInventory" || reportType === "currentRawMaterialsInventory") {
				dateInputsContainer.hide();
			} else {
				dateInputsContainer.show();
			}
		}
	
		function updateFormAction(reportType) {
			var form = $("#reportForm");
			var currentAction = form.attr("action");
	
			// Define a mapping of report types to their corresponding actions
			var actionMapping = {
				"finishedProductList" : "report-gen-section/"
						+ "generateFplReport",
				"currentProductInventory" : "report-gen-section/"
						+ "generateCpiReport",
				"rawMaterialList" : "report-gen-section/"
						+ "generateRmlReport",
				"currentRawMaterialsInventory" : "report-gen-section/"
						+ "generateCrmiReport",
				"dailyPlannedProduction" : "report-gen-section/"
						+ "generateDppReport"
			};
	
			// Update the form action based on the selected report type
			form.attr("action", actionMapping[reportType]
					|| currentAction);
		}
	});
</script>
</html>
