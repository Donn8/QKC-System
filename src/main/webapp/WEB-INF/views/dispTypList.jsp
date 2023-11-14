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
			            location.reload();
			            alert("Deleted Successfully!");
			        },
			        error: function(){
			            alert("Failed to Delete!");
			        }
			  	});
			 }
		});
		
		$('#addFormDispTyp').submit(function(e){
			e.preventDefault();
			var dispatchtypcd = $('#addDispTypCd').val();
			var dispatchtypname = $('#addDispTypName').val();
			var unique = true;
				$('#dispatchTypeTbl tbody tr').each(function(){
					var checkCd = $(this).find('#dispatchTypCd').text();
					if(dispatchtypcd == checkCd){
						unique = false;
					}
				});
				if(unique){
					addDispatchType(dispatchtypcd, dispatchtypname);
				}
				else {
					alert("Dispatch Type Code already exists!");
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
		            location.reload();
		            alert("Added Successfully!");
		        },
		        error: function(){
		            alert("Failed to Add!");
		        }
		  	});
		 }
		//EDIT-------------------------------
		$('#editFormDispTyp').submit(function(e){
			e.preventDefault();
			var dispatchtypcd = $('#newDispTypCd').val();
			var dispatchtypname = $('#newDispTypName').val();
			var existcode = $('#oldDispTypCd').val();
			var unique = true;
				$('#dispatchTypeTbl tbody tr').each(function(){
					var checkCd = $(this).find('#dispatchTypCd').text();
					if(dispatchtypcd == checkCd){
						unique = false;
					}
				});
				if(dispatchtypcd == existcode){
					unique = true;
				}
				if(unique){
					editDispatchType(existcode, dispatchtypcd, dispatchtypname);
				}
				else {
					alert("Dispatch Type Code already exists!");
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