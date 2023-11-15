<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/dataTables.bootstrap5.min.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap5.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>	<!-- ADDED swal -->
<style>
	.swal-button {
	  background-color: #0d6efd;
	}
</style>
<script>
var contextPath = '${pageContext.request.contextPath}' + '/';
</script>
<title>SKU Maintenance</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<br>
	<h4 class="text-center">Logged in As: ${user.name}</h4>
	<h4 class="text-center">Branch: ${user.branch.branch_name}</h4>
	<div class="container">
		<div class="row">
			<div id="skuDiv"></div>
		</div>
		<br>
	</div>
	<jsp:include page="skuForm.jsp"/>
	<%@ include file="qkcFooter.jsp"%>
</body>
<script>
	$(document).ready(function(){
		
		loadDispatchTypes();
		
		function loadDispatchTypes(){
			$.ajax({
				url: contextPath + "sku/list",
				method: "GET",
				success: function(result){
					$("#skuDiv").html(result);
					$("#skuTbl").dataTable();
				}
			});
		}
		
	});
</script>
</html>
