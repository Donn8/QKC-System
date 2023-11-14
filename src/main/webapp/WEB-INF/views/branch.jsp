<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.4/css/dataTables.bootstrap5.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap5.min.js"></script>
<script>
	var contextPath = '${pageContext.request.contextPath}' + '/';
</script>
<title>Branch Maintenance</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<br>
	<h4 class="text-center">Logged in As: ${user.name}</h4>
	<h4 class="text-center">Branch: ${user.branch.branch_name}</h4>
	<div class="container">
		<div class="row">
			<div id="branchDiv"></div>
		</div>
		<br>
	</div>
	<jsp:include page="branchForm.jsp" />
	<%@ include file="qkcFooter.jsp"%>
</body>
<script>
	$(document).ready(function() {

		loadBranches();

		function loadBranches() {
			$.ajax({
				url : contextPath + "branch/list",
				method : "GET",
				success : function(result) {
					$("#branchDiv").html(result);
					$("#branchTbl").dataTable();
				}
			});
		}

	});
</script>
</html>