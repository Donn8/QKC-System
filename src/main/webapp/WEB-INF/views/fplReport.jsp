<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
<br>

<h4>Finished Product List</h4>
<table id="fplTbl" class="table table-striped cell-border text-center">
	<thead>
		<tr>
			<th class="text-center">ID</th>
			<th class="text-center">Product Name</th>
			<th class="text-center">Quantity</th>
			<th class="text-center">Unit of Measurement</th>
			<th class="text-center">Branch</th>
			<th class="text-center">Date Finished</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="fpList" items="${fpList}">
			<tr>
				<td id="fplId"><c:out value="${fpList.fplId}"/></td>
				<td id="fplSkuName"><c:out value="${fpList.sku.sku_name}"/></td>
				<td id="fplSkuQty"><c:out value="${fpList.quantity}"/></td>
				<td id="fplSkuUnit"><c:out value="${fpList.sku.unit_of_measurement}"/></td>
				<td id="fplBranch"><c:out value="${fpList.branch.branch_name}"/></td>
				<td><fmt:formatDate pattern = "MM/dd/yyyy" value = "${fpList.dateFinished}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table> 