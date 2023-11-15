<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<title>Dispatch Section</title>
<script>
	var contextPath = '${pageContext.request.contextPath}' + '/';
</script>

<style>
body {
	display: flex;
	flex-direction: column;
	min-height: 100vh; . container { flex : 1;
	padding-bottom: 50px;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<br>
	<h4 class="text-center">Logged in As: ${user.name}</h4>
	<h4 class="text-center">Branch: ${user.branch.branch_name}</h4>
	<div class="container">
		<div class="row">
			<div id="dispDiv"></div>
		</div>
		<br>
	</div>
	<jsp:include page="dispForm.jsp" />
	<jsp:include page="editDispatch.jsp" />
	<jsp:include page="delDispatch.jsp" />
</body>
<script>
	$(document).ready(function() {

		loadDispatch();

		function loadDispatch() {
			$.ajax({
				url : contextPath + "dispatch/list",
				method : "GET",
				success : function(result) {

					$("#dispDiv").html(result);
					$("#dispTbl").dataTable();
				}
			});
		}
	});
</script>
</html>
