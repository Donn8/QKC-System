<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<h2>MAINTENANCE RAW MATERIALS</h2>
<table>
	<thead>
		<tr>
			<th>Material Code</th>
			<th>Material Name</th>
			<th>Unit of Measurement</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="rawMaterial" items="${rawMaterials}">
			<tr>
				<td><c:out value="${rawMaterial.material_cd}" /></td>
				<td><c:out value="${rawMaterial.material_name}" /></td>
				<td><c:out value="${rawMaterial.unit_of_measurement}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table> 
