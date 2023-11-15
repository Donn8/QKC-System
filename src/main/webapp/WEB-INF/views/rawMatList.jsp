<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/dataTables.css">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<br>
<br>
<div>
	<button type="button" class="btn btn-primary" id="btnAddRawMaterial"
		data-bs-toggle="modal" data-bs-target="#addRawMatMdl">Add Raw
		Material</button>
</div>
<div class="table-responsive">
	<table class="table" id="rawMaterialTbl">
		<thead>
			<tr>
				<th class="text-center">Code</th>
				<th class="text-center">Name</th>
				<th class="text-center">Unit</th>
				<th class="text-center">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="rawMat" items="${rawMatList}">
				<tr>
					<td class="text-center" id=rawMatCd><c:out
							value="${rawMat.material_cd}" /></td>
					<td class="text-center" id=rawMatName><c:out
							value="${rawMat.material_name}" /></td>
					<td class="text-center" id=rawMatUOM><c:out
							value="${rawMat.unit_of_measurement}" /></td>
					<td class="text-center" id=actionBtns>
						<button type="button"
							class="btn btn-secondary btn-sm btn-rawMatEdit"
							data-bs-toggle="modal" data-bs-target="#editRawMatMdl">Edit</button>
						<button type="button"
							class="btn btn-danger btn-sm btn-rawMatDelete"
							data-bs-toggle="modal" data-bs-target="#deleteRawMatMdl">Delete</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
	$(document).ready(function() {

		$('#rawMaterialTbl').on('click', '.btn-rawMatEdit', function() {

			var rawMatCd = $(this).closest('tr').find('#rawMatCd').text();
			var rawMatName = $(this).closest('tr').find('#rawMatName').text();
			var rawMatUOM = $(this).closest('tr').find('#rawMatUOM').text();

			$('#oldRawMatCd').val(rawMatCd);
			$('#newRawMatCd').val(rawMatCd);
			$('#oldRawMatName').val(rawMatName);
			$('#newRawMatName').val(rawMatName);
			$('#newRawMatUOM').val(rawMatUOM);

		});
		$('#rawMaterialTbl').on('click', '.btn-rawMatDelete', function() {

			var rawmatcode = $(this).closest('tr').find('#rawMatCd').text();
			$('#deleteFormRaw').submit(function(e) {
				e.preventDefault();
				deleteRawMaterial(rawmatcode);
			});

			function deleteRawMaterial(rawmatcode) {

				$.ajax({
					url : contextPath + "rawMaterial/delete",
					method : "POST",
					data : {
						"rawMaterialCd" : rawmatcode,
					},
					success : function(result) {
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

		$('#addFormRaw').submit(function(e) {
			e.preventDefault();
			var rawmatcode = $('#addRawMatCd').val();
			var rawmatname = $('#addRawMatName').val();
			var uom = $('#addRawMatUOM').val();
			var unique = true;
			var uniqueName = true;
			$('#rawMaterialTbl tbody tr').each(function() {
				var checkCd = $(this).find('#rawMatCd').text();
				var checkName = $(this).find('#rawMatName').text();
				if (rawmatcode == checkCd) {
					unique = false;
				}
				if(rawmatname == checkName){
					uniqueName = false;
				}
			});
			if(unique&&uniqueName){
				addRawMaterial(rawmatcode, rawmatname, uom);
			}
			else if(!unique&&uniqueName){
				swal("Oops!", "The raw material code already exists.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			}
			else if(unique&&!uniqueName){
				swal("Oops!", "The raw material name already exists.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			}
			else {
				swal("Oops!", "The raw material code and name already exist.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			}
		});

		function addRawMaterial(rawmatcode, rawmatname, uom) {

			$.ajax({
				url : contextPath + "rawMaterial/add",
				method : "POST",
				data : {
					"addRawMatCd" : rawmatcode,
					"addRawMatName" : rawmatname,
					"addRawMatUOM" : uom
				},
				success : function(result) {
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
		
		$('#editFormRaw').submit(function(e) {
			e.preventDefault();
			var rawmatcode = $('#newRawMatCd').val();
			var rawmatname = $('#newRawMatName').val();
			var uom = $('#newRawMatUOM').val();
			var existcode = $('#oldRawMatCd').val();
			var existname = $('#oldRawMatName').val();
			var unique = true;
			var uniqueName = true;
			$('#rawMaterialTbl tbody tr').each(function() {
				var checkCd = $(this).find('#rawMatCd').text();
				var checkName = $(this).find('#rawMatName').text();
				if (rawmatcode === checkCd) {
					unique = false;
					if(existcode === checkCd){
						unique = true;
					}
				}
				if (rawmatname === checkName) {
					uniqueName = false;
					if(existname === checkName){
						uniqueName = true;
					}
				}
			});
			if (rawmatcode === existcode) {
				unique = true;
			}
			if (rawmatname === existname) {
				uniqueName = true;
			}
			if(unique&&uniqueName) {
				editRawMaterial(existcode, rawmatcode, rawmatname, uom);
			}
			else if(!unique&&uniqueName){
				swal("Oops!", "The raw material code already exists.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			}
			else if(unique&&!uniqueName) {
				swal("Oops!", "The raw material name already exists.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			}
			else {
				swal("Oops!", "The raw material code and name already exist.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			}
		});

		function editRawMaterial(existcode, rawmatcode, rawmatname, uom) {

			$.ajax({
				url : contextPath + "rawMaterial/edit",
				method : "POST",
				data : {
					"newRawMatCd" : rawmatcode,
					"newRawMatName" : rawmatname,
					"newRawMatUOM" : uom,
					"oldRawMatCd" : existcode
				},
				success : function(result) {
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
