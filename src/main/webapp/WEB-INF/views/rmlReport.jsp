<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
<br>

<h4>Raw Material List</h4>
<table id="rmlTbl" class="table table-striped cell-border text-center">
	<thead>
		<tr>
			<th class="text-center">ID</th>
			<th class="text-center">Material Name</th>
			<th class="text-center">Quantity</th>
			<th class="text-center">User</th>
			<th class="text-center">Branch</th>
			<th class="text-center">Date Received</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="listItem" items="${rawMaterialList}">
			<tr>
				<td id="rawMatListId"><c:out value="${listItem.material_list_id}"/></td>
				<td id="rawMatName"><c:out value="${listItem.getRawMaterial().getMaterial_name()}"/></td>
				<td id="rawMatQty"><c:out value="${listItem.quantity}"/></td>
				<td id="rawMatUser"><c:out value="${listItem.getUser().getName()}"/></td>
				<td id="rawMatBranch"><c:out value="${listItem.getBranch().getBranch_name()}"/></td>
				<td><fmt:formatDate pattern = "MM/dd/yyyy" value = "${listItem.date_receive}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table> 