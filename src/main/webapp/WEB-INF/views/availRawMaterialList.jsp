<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<table id="availRawMaterialListTbl" class="table table-striped cell-border text-center">
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
				<td id="dppChk"><input type="checkbox" class="chkMaterial" name="chkMaterial"></td>
				<td id="dppRawMatCd"><c:out value="${listItem.getMaterial_cd()}"/></td>
				<td id="dppRawMatName"><c:out value="${listItem.getMaterial_name()}"/></td>
				<td id="dppTotalQty"><c:out value="${listItem.getTotal_quantity()}"/></td> 
				<td id="dppQtyUse"><input id="skuQuantityUse" class="skuQuantityUse" type="number" min="1" max="${listItem.getTotal_quantity()}" disabled="disabled"></td> 
			</tr>
		</c:forEach>
	</tbody> 
</table> 
<script>
$(document).ready(function(){
	
	$('#availRawMaterialListTbl').on('click', '.chkMaterial', function(){
		var selected = $(this).closest('tr').find('#skuQuantityUse');
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

	$('#addPlanProdForm').submit(function(e){
		
		var selectedMaterials = $('.chkMaterial:checkbox:checked');
		var materialCdList = [];
		var quantityUseList = [];
		
		if(selectedMaterials.length == 0){
			e.preventDefault();
			//Change
			swal("Oops!", "Please select at least one raw material","warning",{
				button: "OK",
				closeOnClickOutside: true,
			});
		}else{
			var skuCd = $('#skuSelection').val();
			var skuQty = $('#skuQuantity').val();
			selectedMaterials.each(function(){
				e.preventDefault();
				var materialCd = $(this).closest('tr').find('#dppRawMatCd').text();
				var quantityUse = $(this).closest('tr').find('#skuQuantityUse').val();
				
				materialCdList.push(materialCd);
				quantityUseList.push(quantityUse);
			});
			//Change
			$('#dailyPlannedProductionMdl').modal('hide');
			$('#addProdPlanBtn').attr('disabled','disabled');
			$('.dppBtnEdit').attr('disabled','disabled');
			$('.dppBtnDelete').attr('disabled','disabled');
			$('.skuStatus').attr('disabled','disabled');
			addProductionMaterial(skuCd, materialCdList, quantityUseList, skuQty);
		}
		
	});
	
	function addProductionMaterial(skuCd, materialCdList, quantityUseList, skuQty){
		
		$.ajax({
			url: contextPath + "daily-planned-production/add",
			method: "POST",
			data: {
				"sku_cd": skuCd,
				"sku_material_cd": materialCdList.toString(),
				"skuQuantityUse": quantityUseList.toString(),
				"skuQuantity": skuQty
			},
			success: function(result){
				//Change
				swal("Nice!","Added Successfully","success",{
						timer: 1500,
						buttons: false
					}).then(function(){
						location.reload();
					});
			},
			error: function(){
				//Change
				swal("Sorry!", "Failed to Add","error",{
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
