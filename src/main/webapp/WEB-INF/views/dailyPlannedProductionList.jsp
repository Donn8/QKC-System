<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#dailyPlannedProductionMdl">
 	<i class="fas fa-plus"></i> Add Production Plan
</button>
<br>
<table id="dailyPlannedProductionListTbl" class="table table-striped cell-border text-center">
	<thead>
		<tr>
			<th class="text-center">ID</th>
			<th class="text-center">SKU Code</th>
			<th class="text-center">SKU Name</th>
			<th class="text-center">Quantity</th>
			<th class="text-center">Unit of Measurement</th>
			<th class="text-center">Status</th>
			<th class="text-center">Branch</th>
			<th class="text-center">Production Date</th>
			<th class="text-center">Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dppList" items="${dppList}">
			<tr>
				<td id="dppId"><c:out value="${dppList.dpp_id}"/></td>
				<td id="dppSkuCd"><c:out value="${dppList.getSku().getSku_cd()}"/></td>
				<td id="dppSkuName"><c:out value="${dppList.getSku().getSku_name()}"/></td>
				<td id="dppSkuQty"><c:out value="${dppList.quantity}"/></td>
				<td id="dppSkuUnit"><c:out value="${dppList.getSku().getUnit_of_measurement()}"/></td>
				<td id="dppSkuStatus">
					<select id="skuStatusSelection" class="skuStatus" name="sku_status" class="form-select" aria-label="Default select example" required >
					  	<option value="${dppList.status}" selected>${dppList.status}</option>
					  	<option value="Finished" >Finished</option>
					</select>
				</td>
				<td id="dppBranch"><c:out value="${dppList.getBranch().getBranch_name()}"/></td>
				<td><fmt:formatDate pattern = "MM/dd/yyyy" value = "${dppList.production_date}" /></td>
				<td>
					<button class="btn btn-primary dppBtnEdit" type="button" data-bs-toggle="modal" data-bs-target="#editDailyPlannedProductionMdl">Edit</button>
					<button class="btn btn-danger dppBtnDelete" type="button" data-bs-toggle="modal" data-bs-target="#delDailyPlannedProductionMdl">Delete</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script>

$('#dailyPlannedProductionListTbl').find('.skuStatus option:selected').each(function(){
	if($(this).val() == 'Finished'){
		var editBtn = $(this).closest('tr').find('.dppBtnEdit');
		var delBtn = $(this).closest('tr').find('.dppBtnDelete');
		$(this).closest('select').css('background-color', 'green');
		$(this).closest('select').prop('disabled',true);
		editBtn.prop('disabled',true);
		delBtn.prop('disabled',true);
	}
});

$(document).ready(function(){
	//Change
	$('#dailyPlannedProductionMdl').on('hidden.bs.modal', function(){
		$(this).find('#addPlanProdForm')[0].reset();
		$(this).find('.skuQuantityUse').attr('disabled','disabled');
	});

	//EDIT DPP
	$('#dailyPlannedProductionListTbl').on('click', '.dppBtnEdit', function(){
		
		var dppSkuQty = $(this).closest('tr').find('#dppSkuQty').text();
		var dppSkuCd = $(this).closest('tr').find('#dppSkuCd').text();
		var dppId = $(this).closest('tr').find('#dppId').text();
		
		$('#editSkuQuantity').val(dppSkuQty);
		$('#editSkuSelection').val(dppSkuCd);
		$('#editDppId').val(dppId);
		
		var prevSelection = getPrevSelection(dppId);
		$('#availEditRawMaterialListTbl tbody tr').each(function(){
			for(var i = 0; i < prevSelection.length; i++ ){
				if(prevSelection[i].rawMaterial.material_cd == $(this).find('#dppEditRawMatCd').text()){
					var qtyUse = prevSelection[i].quantity_to_use;
					$(this).find('input[name="chkEditMaterial"]').prop('checked',true);
					$(this).find('#skuEditQuantityUse').val(qtyUse);
					$(this).find('#skuEditQuantityUse').removeAttr('disabled');
				}
			}
		});
		
		$('#editDailyPlannedProductionMdl').on('hidden.bs.modal', function(){
			$('#availEditRawMaterialListTbl tbody tr').each(function(){
				$(this).closest('tr').find('input[name="chkEditMaterial"]').prop('checked', false);
	            $(this).closest('tr').find('#skuEditQuantityUse').val(null);
	            $(this).find('#skuEditQuantityUse').prop('disabled','disabled');
			});
		});

		function getPrevSelection(dppId){
			var response = null;
			$.ajax({
				url: contextPath + "prevSelection",
				async: false,
				method: "POST",
				data: {
					dppId: dppId
				},
				success: function(result){
					response = result;
				},
				error: function(error){
					
				}
			});
			return response;
		}
		//Change
		var editSelectedMaterials = $('.chkEditMaterial:checkbox');
		editSelectedMaterials.each(function(){
			var editMaterialCd = $(this).closest('tr').find('#dppEditRawMatCd').text();
			var editQuantityUse = parseInt($(this).closest('tr').find('#skuEditQuantityUse').val(),10);
		
			var currentTotalQty = parseInt($(this).closest('tr').find('#dppEditTotalQty').text(),10);
			var editQuantityUseInput = $(this).closest('tr').find('#skuEditQuantityUse');
			var currentMax = editQuantityUse + currentTotalQty;
			
			if($(this).prop('checked')){
				editQuantityUseInput.removeAttr('max');
				editQuantityUseInput.attr('max',currentMax);
			}else{
				editQuantityUseInput.removeAttr('max');
				editQuantityUseInput.attr('max',currentTotalQty);
			}
			
		});
	});
	
	
	$('#dailyPlannedProductionListTbl').on('change', '.skuStatus', function(){
		
		var editBtn = $(this).closest('tr').find('.dppBtnEdit');
		var delBtn = $(this).closest('tr').find('.dppBtnDelete');
		var dppId = $(this).closest('tr').find('#dppId').text();
		var status = $(this).val();
		$(this).css('background-color', 'green');
		$(this).prop('disabled',true);
		editBtn.prop('disabled',true);
		delBtn.prop('disabled',true);

		changeStatus(dppId, status);
		
	});
	
	function changeStatus(dppId, status){
		$.ajax({
			url: contextPath + "daily-planned-production/changeStatus",
			method: "POST",
			data: {
				"dppId": dppId,
				"status": status
			},
			success: function(result){
				//Change
				swal("Nice!","Status Updated Successfully","success",{
						timer: 1500,
						buttons: false
					})
			},
			error: function(){
				//Change
				swal("Sorry!", "Status Update Failed!","error",{
					button: "OK",
					closeOnClickOutside: true,
				}).then(function(){
					location.reload();
				});
			}
		});
	}
	
	//DELETE DPP
	$('#dailyPlannedProductionListTbl').on('click', '.dppBtnDelete', function(){
		var dppId = $(this).closest('tr').find('#dppId').text();
		$('#delDppId').val(dppId);
	});
	
	$('#delPlanProdForm').submit(function(e){
		e.preventDefault()
		var dppId = $(this).find('#delDppId').val();
		//Change
		$('#delDailyPlannedProductionMdl').modal('hide');
		$('#addProdPlanBtn').attr('disabled','disabled');
		$('.dppBtnEdit').attr('disabled','disabled');
		$('.dppBtnDelete').attr('disabled','disabled');
		$('.skuStatus').attr('disabled','disabled');
		delProductionPlan(dppId);
	});
	
	function delProductionPlan(dppId){
		
		$.ajax({
			url: contextPath + "daily-planned-production/delete",
			method: "POST",
			data: {
				"delDppId": dppId
			},
			success: function(result){
				//Change
				swal("Nice!","Deleted Successfully","success",{
						timer: 1500,
						buttons: false
					}).then(function(){
						location.reload();
					});
			},
			error: function(){
				//Change
				swal("Sorry!", "Failed to Delete","error",{
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
