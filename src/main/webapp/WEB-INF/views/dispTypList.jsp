<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <br>
    <br>
	<div>
		<button type="button" class="btn btn-primary" id="btnAddDispatchType"  data-bs-toggle="modal" data-bs-target="#addDispTypMdl">Add Dispatch Type</button>
	</div>
	<div>
		<table class="table" id="dispatchTypeTbl">
			<thead>
				<tr>
					<th class="text-center">Code</th>
					<th class="text-center">Name</th>
					<th class="text-center">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dispatchTyp" items="${dispTypList}">
					<tr>
						<td class="text-center" id=dispatchTypCd><c:out value="${dispatchTyp.dispatchTypeCd}"/></td>
						<td class="text-center" id=dispatchTypName><c:out value="${dispatchTyp.dispatchTypeName}"/></td>
						<td  class="text-center"id=actionBtns>
						<button type="button" class="btn btn-secondary btn-sm btn-dispTypEdit"  data-bs-toggle="modal" data-bs-target="#editDispTypMdl">Edit</button>
						<button type="button" class="btn btn-danger btn-sm btn-dispTypDelete" data-bs-toggle="modal" data-bs-target="#deleteDispTypMdl">Delete</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<script>
	$(document).ready(function(){

		$('#dispatchTypeTbl').on('click', '.btn-dispTypEdit', function(){
			
			var dispatchTypCd = $(this).closest('tr').find('#dispatchTypCd').text();
			var dispatchTypName = $(this).closest('tr').find('#dispatchTypName').text();
			
			$('#oldDispTypCd').val(dispatchTypCd);
			$('#newDispTypCd').val(dispatchTypCd);
			$('#oldDispTypName').val(dispatchTypName);
			$('#newDispTypName').val(dispatchTypName);
			
		});
		
		$('#dispatchTypeTbl').on('click', '.btn-dispTypDelete', function(){
			
			var dispatchtypcd = $(this).closest('tr').find('#dispatchTypCd').text();
			$('#deleteFormDispTyp').submit(function(e){
				e.preventDefault();
				deleteDispatchType(dispatchtypcd);
			});
			
			function deleteDispatchType(dispatchtypcd){

			    $.ajax({
			        url: contextPath + "dispatchType/delete",
			        method: "POST",
			        data: {
			            "dispTypCd": dispatchtypcd,
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
		
		$('#addFormDispTyp').submit(function(e){
			e.preventDefault();
			var dispatchtypcd = $('#addDispTypCd').val();
			var dispatchtypname = $('#addDispTypName').val();
			var unique = true;
			var uniqueName = true;
				$('#dispatchTypeTbl tbody tr').each(function(){
					var checkCd = $(this).find('#dispatchTypCd').text();
					var checkName = $(this).find('#dispatchTypName').text();
					if(dispatchtypcd == checkCd){
						unique = false;
					}
					if(dispatchtypname == checkName){
						uniqueName = false;
					}
				});
				if(unique&&uniqueName){
					addDispatchType(dispatchtypcd, dispatchtypname);
				}
				else if(!unique&&uniqueName){
					swal("Oops!", "The dispatch type code already exists.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
				}
				else if(unique&&!uniqueName){
					swal("Oops!", "The dispatch type name already exists.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
				}
				else {
					swal("Oops!", "The dispatch type code and name already exist.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
				}
		});
		
		
		function addDispatchType(dispatchtypcd, dispatchtypname){

		    $.ajax({
		        url: contextPath + "dispatchType/add",
		        method: "POST",
		        data: {
		            "addDispTypCd": dispatchtypcd,
		            "addDispTypName": dispatchtypname,
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
		
		$('#editFormDispTyp').submit(function(e){
			e.preventDefault();
			var dispatchtypcd = $('#newDispTypCd').val();
			var dispatchtypname = $('#newDispTypName').val();
			var existcode = $('#oldDispTypCd').val();
			var existname = $('#oldDispTypName').val();
			var unique = true;
			var uniqueName = true;
				$('#dispatchTypeTbl tbody tr').each(function(){
					var checkCd = $(this).find('#dispatchTypCd').text();
					var checkName = $(this).find('#dispatchTypName').text();
					if(dispatchtypcd === checkCd){
						unique = false;
						if(existcode === checkCd){
							unique = true;
						}
					}
					if(dispatchtypname === checkName){
						uniqueName = false;
						if(existname === checkName){
							uniqueName = true;
						}
					}
				});
				if(dispatchtypcd === existcode){
					unique = true;
				}
				if(dispatchtypname === existname){
					uniqueName = true;
				}
				if(unique&&uniqueName){
					editDispatchType(existcode, dispatchtypcd, dispatchtypname);
				}
				else if(!unique&&uniqueName){
					swal("Oops!", "The dispatch type code already exists.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
				}
				else if(unique&&!uniqueName) {
					swal("Oops!", "The dispatch type name already exists.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
				}
				else {
					swal("Oops!", "The dispatch type code and name already exist.", "warning", {
						  button: "OK",
						  closeOnClickOutside: true,
						});
				}
		});
		
		
		function editDispatchType(existcode, dispatchtypcd, dispatchtypname){

		    $.ajax({
		        url: contextPath + "dispatchType/edit",
		        method: "POST",
		        data: {
		        	"newDispTypCd": dispatchtypcd,
		            "newDispTypName": dispatchtypname,
		            "oldDispTypCd": existcode
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
