<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
<br>
<h4>Current Raw Material Inventory</h4>
<table id="prmTbl" class="table table-striped cell-border text-center">
	<thead>
		<tr>
			<th class="text-center">ID</th>
			<th class="text-center">Material Name</th>
			<th class="text-center">Quantity</th>
			<th class="text-center">Unit of Measurement</th>
			<th class="text-center">Branch</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="crmInv" items="${crmInv}">
			<tr>
				<td id="prmId"><c:out value="${crmInv.material_cd}"/></td>
				<td id="prmMaterialName"><c:out value="${crmInv.material_name}"/></td>
				<td id="prmQuantity"><c:out value="${crmInv.total_quantity}"/></td>
				<td id="prmUnit"><c:out value="${crmInv.unit_of_measurement}"/></td>
				<td id="prmBranch"><c:out value="${crmInv.branch_name}"/></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
