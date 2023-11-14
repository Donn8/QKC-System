<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/dataTables.css">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<br>
<br>
<div>
	<button type="button" class="btn btn-primary" id="btnAddSku"
		data-bs-toggle="modal" data-bs-target="#addSkuMdl">Add SKU</button>
</div>

<div class="table-responsive">
	<table class="table text-center" id="skuTbl">
		<thead>
			<tr>
				<th class="text-center">Code</th>
				<th class="text-center">Name</th>
				<th class="text-center">Unit</th>
				<th class="text-center">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="sku" items="${skuList}">
				<tr>
					<td class="text-center" id="skuCd"><c:out value="${sku.sku_cd}" /></td>
					<td  class="text-center" id="skuName"><c:out value="${sku.sku_name}" /></td>
					<td  class="text-center" id="skuUOM"><c:out value="${sku.unit_of_measurement}" /></td>
					<td  class="text-center" id="actionBtns">
						<button type="button" class="btn btn-secondary btn-sm btn-skuEdit"
							data-bs-toggle="modal" data-bs-target="#editSkuMdl">Edit</button>
						<button type="button" class="btn btn-danger btn-sm btn-skuDelete"
							data-bs-toggle="modal" data-bs-target="#deleteSkuMdl">Delete</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
	$(document).ready(function() {

		$('#skuTbl').on('click', '.btn-skuEdit', function() {

			var skuCd = $(this).closest('tr').find('#skuCd').text();
			var skuName = $(this).closest('tr').find('#skuName').text();
			var skuUOM = $(this).closest('tr').find('#skuUOM').text();

			$('#oldSkuCd').val(skuCd);
			$('#newSkuCd').val(skuCd);
			$('#newSkuName').val(skuName);
			$('#newSkuUOM').val(skuUOM);

		});

$('#skuTbl').on('click', '.btn-skuDelete', function(){
			
			var skucode = $(this).closest('tr').find('#skuCd').text();
			$('#deleteFormSku').submit(function(e){
				e.preventDefault();
				deleteSKU(skucode);
			});
			
			function deleteSKU(skucode){

			    $.ajax({
			        url: contextPath + "sku/delete",
			        method: "POST",
			        data: {
			            "skuCode": skucode,
			        },
			        success: function(result){
			            location.reload();
			            alert("Deleted Successfully!");
			        },
			        error: function(){
			            alert("Failed to Delete!");
			        }
			  	});
			 }
		});
		
		$('#addFormSku').submit(function(e){
			e.preventDefault();
			var skucode = $('#addSkuCd').val();
			var skuname = $('#addSkuName').val();
			var uom = $('#addSkuUOM').val();
			var unique = true;
				$('#skuTbl tbody tr').each(function(){
					var checkCd = $(this).find('#skuCd').text();
					if(skucode == checkCd){
						unique = false;
					}
				});
				if(unique){
					addSku(skucode, skuname, uom);
				}
				else {
					alert("SKU Code already exists!");
				}
		});
		
		
		function addSku(skucode, skuname, uom){

		    $.ajax({
		        url: contextPath + "sku/add",
		        method: "POST",
		        data: {
		            "addSkuCd": skucode,
		            "addSkuName": skuname,
		            "addSkuUOM": uom
		        },
		        success: function(result){
		            location.reload();
		            alert("Added Successfully!");
		        },
		        error: function(){
		            alert("Failed to Add!");
		        }
		  	});
		 }
		//EDIT-------------------------------
		$('#editFormSku').submit(function(e){
			e.preventDefault();
			var skucode = $('#newSkuCd').val();
			var skuname = $('#newSkuName').val();
			var uom = $('#newSkuUOM').val();
			var existsku = $('#oldSkuCd').val();
			var unique = true;
				$('#skuTbl tbody tr').each(function(){
					var checkCd = $(this).find('#skuCd').text();
					if(skucode == checkCd){
						unique = false;
					}
				});
				if(skucode == existsku){
					unique = true;
				}
				if(unique){
					editSku(existsku, skucode, skuname, uom);
				}
				else {
					alert("SKU Code already exists!");
				}
		});
		
		
		function editSku(existsku, skucode, skuname, uom){

		    $.ajax({
		        url: contextPath + "sku/edit",
		        method: "POST",
		        data: {
		        	"newSkuCd": skucode,
		            "newSkuName": skuname,
		            "newSkuUOM": uom,
		            "oldSkuCd": existsku
		        },
		        success: function(result){
		            location.reload();
		            alert("Edited Successfully!");
		        },
		        error: function(){
		            alert("Failed to Edit!");
		        }
		  	});
		 }
		
	});
</script>