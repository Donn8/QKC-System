<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
<br>
<h4>Daily Planned Production Report</h4>
<table id="dppTbl" class="table table-striped cell-border text-center">
	<thead>
		<tr>
			<th class="text-center">ID</th>
			<th class="text-center">Product Name</th>
			<th class="text-center">Quantity</th>
			<th class="text-center">Unit of Measurement</th>
			<th class="text-center">Status</th>
			<th class="text-center">Branch</th>
			<th class="text-center">Production Date</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dppList" items="${dppList}">
			<tr>
				<td id="dppId"><c:out value="${dppList.dpp_id}"/></td>
				<td id="dppSkuName"><c:out value="${dppList.sku.sku_name}"/></td>
				<td id="dppSkuQty"><c:out value="${dppList.quantity}"/></td>
				<td id="dppSkuUnit"><c:out value="${dppList.sku.unit_of_measurement}"/></td>
				<td id="dppSkuStatus"><c:out value="${dppList.status}"/></td>
				<td id="dppBranch"><c:out value="${dppList.branch.branch_name}"/></td>
				<td><fmt:formatDate pattern = "MM/dd/yyyy" value = "${dppList.production_date}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
