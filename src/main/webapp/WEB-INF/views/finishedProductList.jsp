<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<br>
<table id="finishedProductListTbl" class="table table-striped cell-border text-center">
	<thead>
		<tr>
			<th class="text-center">ID</th>
			<th class="text-center">SKU Code</th>
			<th class="text-center">SKU Name</th>
			<th class="text-center">Quantity</th>
			<th class="text-center">Unit of Measurement</th>
			<th class="text-center">Branch</th>
			<th class="text-center">Date Finished</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="fplItem" items="${finishedProductList}">
			<tr>
				<td id="fplId"><c:out value="${fplItem.fplId}"/></td>
				<td id="fplSkuCd"><c:out value="${fplItem.getSku().getSku_cd()}"/></td>
				<td id="fplSkuName"><c:out value="${fplItem.getSku().getSku_name()}"/></td>
				<td id="fplQty"><c:out value="${fplItem.quantity}"/></td>
				<td id="fplUnit"><c:out value="${fplItem.getSku().getUnit_of_measurement()}"/></td>
				<td id="fplBranch"><c:out value="${fplItem.getBranch().getBranch_name()}"/></td>
				<td><fmt:formatDate pattern = "MM/dd/yyyy" value = "${fplItem.dateFinished}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table> 