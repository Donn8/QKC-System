<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#dailyPlannedProductionMdl">
 	Add Production Plan
</button>-->
<br>

<h4>Current Products Inventory</h4>
<table id="cpiTbl" class="table table-striped cell-border text-center">
	<thead>
		<tr>
			<th class="text-center">ID</th>
			<th class="text-center">Product Name</th>
			<th class="text-center">Quantity</th>
			<th class="text-center">Unit of Measurement</th>
			<th class="text-center">Branch</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="cpiReport" items="${cpiReport}">
			<tr>
				<td id="fplId"><c:out value="${cpiReport.getFpl_id()}"/></td>
				<td id="fplSkuName"><c:out value="${cpiReport.getSku_name()}"/></td>
				<td id="fplSkuQty"><c:out value="${cpiReport.getTotal_quantity()}"/></td>
				<td id="fplSkuUnit"><c:out value="${cpiReport.getUnit_of_measurement()}"/></td>
				<td id="fplBranch"><c:out value="${cpiReport.getBranch_name()}"/></td>
			</tr>
		</c:forEach>
	</tbody>
</table>