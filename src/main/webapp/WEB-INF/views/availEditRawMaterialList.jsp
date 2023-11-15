<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<table id="availEditRawMaterialListTbl" class="table table-striped cell-border text-center">
	<thead>
		<tr>
			<th class="text-center"></th>
			<th class="text-center">Material Code</th>
			<th class="text-center">Material Name</th>
			<th class="text-center">Total Quantity</th>
			<th class="text-center">Quantity to Use</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach var="listItem" items="${rawMaterialList}">
			<tr>
				<td class="text-center" id="dppEditChk"><input type="checkbox" class="chkEditMaterial" name="chkEditMaterial"></td>
				<td class="text-center" id="dppEditRawMatCd"><c:out value="${listItem.getMaterial_cd()}"/></td>
				<td class="text-center" id="dppEditRawMatName"><c:out value="${listItem.getMaterial_name()}"/></td>
				<td class="text-center" id="dppEditTotalQty"><c:out value="${listItem.getTotal_quantity()}"/></td> 
				<td class="text-center" id="dppEditQtyUse"><input id="skuEditQuantityUse" class="skuEditQuantityUse" type="number" min="1" max="${listItem.getTotal_quantity()}" disabled="disabled" required></td> 
			</tr>
		</c:forEach>
	</tbody> 
</table> 
<script>
$(document).ready(function(){
	
	$('#availEditRawMaterialListTbl').on('click', '.chkEditMaterial', function(){
		var selected = $(this).closest('tr').find('#skuEditQuantityUse');
		var isChecked = $(this).is(':checked');

		if(isChecked){
			selected.removeAttr('disabled');
			selected.prop('required',true);
		} else {
			selected.attr('disabled', 'disabled');
			selected.prop('required',false);
			selected.val(null);
		}
	});

	$('#editPlanProdForm').submit(function(e){
		
		var editSelectedMaterials = $('.chkEditMaterial:checkbox:checked');
		var editDppId = $('#editDppId').val();
		var editMaterialCdList = [];
		var editQuantityUseList = [];
		
		if(editSelectedMaterials.length == 0){
			e.preventDefault();
			//Change
			swal("Oops!", "Please select at least one raw material","warning",{
				button: "OK",
				closeOnClickOutside: true,
			});
		}else{
			var editSkuCd = $('#editSkuSelection').val();
			var editSkuQty = $('#editSkuQuantity').val();
			editSelectedMaterials.each(function(){
				e.preventDefault();
				var editMaterialCd = $(this).closest('tr').find('#dppEditRawMatCd').text();
				var editQuantityUse = $(this).closest('tr').find('#skuEditQuantityUse').val();
				
				editMaterialCdList.push(editMaterialCd);
				editQuantityUseList.push(editQuantityUse);
			});	
			//Change
			$('#editDailyPlannedProductionMdl').modal('hide');
			$('#addProdPlanBtn').attr('disabled','disabled');
			$('.dppBtnEdit').attr('disabled','disabled');
			$('.dppBtnDelete').attr('disabled','disabled');
			$('.skuStatus').attr('disabled','disabled');
			editProductionMaterial(editDppId, editSkuCd, editMaterialCdList, editQuantityUseList, editSkuQty);
		}
		
	});
	
	function editProductionMaterial(editDppId, editSkuCd, editMaterialCdList, editQuantityUseList, editSkuQty){
		
		$.ajax({
			url: contextPath + "daily-planned-production/edit",
			method: "POST",
			data: {
				"editDppId": editDppId,
				"edit_sku_cd": editSkuCd,
				"edit_sku_material_cd": editMaterialCdList.toString(),
				"editSkuQuantityUse": editQuantityUseList.toString(),
				"editSkuQuantity": editSkuQty
			},
			success: function(result){
				//Change
				swal("Nice!","Updated Successfully","success",{
						timer: 1500,
						buttons: false
					}).then(function(){
						location.reload();
					});
			},
			error: function(){
				//Change
				swal("Sorry!", "Failed to Update","error",{
					button: "OK",
					closeOnClickOutside: true,
				}).then(function(){
					location.reload();
				});
			}
		});
	}
	
	
});
</script>
