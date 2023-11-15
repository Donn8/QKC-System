<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
<br>
<button type="button" id="addRawMaterialButton" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addRawMaterialListMdl">
 <i class="fas fa-plus"></i> Add Raw Material
</button>
<br>
<br>
<table id="rawMaterialListTbl" class="table table-striped cell-border text-center">
	<thead>
		<tr>
			<th class="text-center">ID</th>
			<th class="text-center">Material Code</th>
			<th class="text-center">Material Name</th>
			<th class="text-center">Quantity</th>
			<th class="text-center">User</th>
			<th class="text-center">Branch</th>
			<th class="text-center">Date Received</th>
			<th class="text-center">Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="listItem" items="${rawMaterialList}">
			<tr>
				<td class="text-center" id="rawMatListId"><c:out value="${listItem.material_list_id}"/></td>
				<td class="text-center" id="rawMatCd"><c:out value="${listItem.getRawMaterial().getMaterial_cd()}"/></td>
				<td class="text-center" id="rawMatName"><c:out value="${listItem.getRawMaterial().getMaterial_name()}"/></td>
				<td class="text-center" id="rawMatQty"><c:out value="${listItem.quantity}"/></td>
				<td class="text-center" id="rawMatUser"><c:out value="${listItem.getUser().getName()}"/></td>
				<td class="text-center" id="rawMatBranch"><c:out value="${listItem.getBranch().getBranch_name()}"/></td>
				<td><fmt:formatDate pattern = "MM/dd/yyyy" value = "${listItem.date_receive}" /></td>
				<td>
					<button class="btn btn-primary btnEdit" type="button" data-bs-toggle="modal" data-bs-target="#editRawMaterialListMdl"> <i class="fas fa-pencil-alt"></i></button>
					<button class="btn btn-danger btnDelete" type="button" data-bs-toggle="modal" data-bs-target="#delRawMaterialListMdl"><i class="fas fa-trash-alt"></i></button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table> 
<script>
$(document).ready(function(){
	
	$('#rawMaterialListTbl').on('click', '.btnEdit', function(){
		
		var rawMatListId = $(this).closest('tr').find('#rawMatListId').text();
		var rawMatQty = $(this).closest('tr').find('#rawMatQty').text();
		var rawMatName = $(this).closest('tr').find('#rawMatName').text();
		var rawMatCd = $(this).closest('tr').find('#rawMatCd').text();
		
		$('#editQuantity').val(rawMatQty);
		$('#editRawMaterialSelection').val(rawMatCd);
		$('#materialListId').val(rawMatListId);

		var initialSelect = $('#editRawMaterialSelection option:selected').attr('data-editUnit');
		$('#editUnitOfMeasurement').text(initialSelect);
		
		$('#editRawMaterialSelection').change(function(){
			var selectedUnit = $(this).find('option:selected').attr('data-editUnit');
			$('#editUnitOfMeasurement').text(selectedUnit);
		});
	});
	
	$('#rawMaterialListTbl').on('click', '.btnDelete', function(){
		
		var rawMatListId = $(this).closest('tr').find('#rawMatListId').text();
		$('#delmaterialListId').val(rawMatListId);
		
	});

	//Change
	$('#rawMaterialListAdd').submit(function(){
		$('#addRawMaterialListMdl').modal('hide');
		$('#addRawMaterialButton').attr('disabled','disabled');
		$('.btnEdit').attr('disabled','disabled');
		$('.btnDelete').attr('disabled','disabled');
		swal("Nice!","Added Successfully","success",{
				timer: 1500,
				buttons: false
			})
	});
	
	//Change
	$('#rawMaterialListEdit').submit(function(){
		$('#editRawMaterialListMdl').modal('hide');
		$('#addRawMaterialButton').attr('disabled','disabled');
		$('.btnEdit').attr('disabled','disabled');
		$('.btnDelete').attr('disabled','disabled');
		swal("Nice!","Updated Successfully","success",{
				timer: 1500,
				buttons: false
			})
	});
	
	//Change
	$('#rawMaterialListDelete').submit(function(){
		$('#delRawMaterialListMdl').modal('hide');
		$('#addRawMaterialButton').attr('disabled','disabled');
		$('.btnEdit').attr('disabled','disabled');
		$('.btnDelete').attr('disabled','disabled');
		swal("Nice!","Deleted Successfully","success",{
				timer: 1500,
				buttons: false
			})
	});
	
});
</script>
