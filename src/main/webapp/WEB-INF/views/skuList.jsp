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
			$('#oldSkuName').val(skuName);
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
			        	swal("Nice!", "Deleted successfully.", "success", {
			        		timer: 2500,
							  buttons: false,
							  closeOnClickOutside: true,
							}).then(function() {
								location.reload();
							});
			        },
			        error: function(){
			        	swal("Sorry!", "Failed to delete.", "error", {
							  button: "OK",
							  closeOnClickOutside: true,
							}).then(function() {
								location.reload();
							});
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
			var uniqueName = true;
				$('#skuTbl tbody tr').each(function(){
					var checkCd = $(this).find('#skuCd').text();
					var checkName = $(this).find('#skuName').text();
					if(skucode == checkCd){
						unique = false;
					}
					if(skuname == checkName){
						uniqueName = false;
					}
				});
				if(unique&&uniqueName){
					addSku(skucode, skuname, uom);
				}
				else if(!unique&&uniqueName){
					swal("Oops!", "The SKU code already exists.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
				}
				else if(unique&&!uniqueName){
					swal("Oops!", "The SKU name already exists.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
				}
				else {
					swal("Oops!", "The SKU code and name already exist.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
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
		        	swal("Nice!", "Added successfully!", "success", {
		        		timer: 2500,
		        		 buttons: false,
						  closeOnClickOutside: true,
						}).then(function() {
							location.reload();
						});
		        },
		        error: function(){
		        	swal("Sorry!", "Failed to add.", "error", {
						  button: "OK",
						  closeOnClickOutside: true,
						}).then(function() {
							location.reload();
						});;
		        }
		  	});
		 }
		
		$('#editFormSku').submit(function(e){
			e.preventDefault();
			var skucode = $('#newSkuCd').val();
			var skuname = $('#newSkuName').val();
			var uom = $('#newSkuUOM').val();
			var existcode = $('#oldSkuCd').val();
			var existname = $('#oldSkuName').val();
			var unique = true;
			var uniqueName = true;
				$('#skuTbl tbody tr').each(function(){
					var checkCd = $(this).find('#skuCd').text();
					var checkName = $(this).find('#skuName').text();
					if(skucode == checkCd){
						unique = false;
						if(existcode === checkCd){
							unique = true;
						}
					}
					if(skuname === checkName){
						uniqueName = false;
						if(existname === checkName){
							uniqueName = true;
						}
					}
				});
				if(skucode === existcode){
					unique = true;
				}
				if(skuname === existname){
					uniqueName = true;
				}
				if(unique&&uniqueName){
					editSku(existcode, skucode, skuname, uom);
				}
				else if(!unique&&uniqueName){
					swal("Oops!", "The SKU code already exists.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
				}
				else if(unique&&!uniqueName) {
					swal("Oops!", "The SKU name already exists.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
				}
				else {
					swal("Oops!", "The SKU code and name already exist.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
				}
		});
		
		
		function editSku(existcode, skucode, skuname, uom){

		    $.ajax({
		        url: contextPath + "sku/edit",
		        method: "POST",
		        data: {
		        	"newSkuCd": skucode,
		            "newSkuName": skuname,
		            "newSkuUOM": uom,
		            "oldSkuCd": existcode
		        },
		        success: function(result){
		        	swal("Nice!", "Edited successfully!", "success", {
		        		timer: 2500,
		        		 buttons: false,
						  closeOnClickOutside: true,
						}).then(function() {
							location.reload();
						});
				},
				error : function() {
					swal("Sorry!", "Failed to edit.", "error", {
						  button: "OK",
						  closeOnClickOutside: true,
						}).then(function() {
							location.reload();
						});
		        }
		  	});
		 }
		
	});
</script>
