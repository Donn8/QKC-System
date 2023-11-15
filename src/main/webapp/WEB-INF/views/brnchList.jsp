<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/dataTables.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<br>
<br>
<div>
	<button type="button" class="btn btn-primary" id="btnAddBranch"
		data-bs-toggle="modal" data-bs-target="#addBranchMdl">Add
		Branch</button>
</div>
<div>
	<table class="table" id="branchTbl">
		<thead>
			<tr>
				<th class="text-center">ID</th>
				<th class="text-center">Name</th>
				<th class="text-center">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="branch" items="${brnchList}">
				<tr>
					<td class="text-center" id=branchId><c:out
							value="${branch.branchId}" /></td>
					<td class="text-center" id=branchName><c:out
							value="${branch.branch_name}" /></td>
					<td class="text-center" id=actionBtns><button type="button"
							class="btn btn-secondary btn-sm btn-branchEdit"
							data-bs-toggle="modal" data-bs-target="#editBranchMdl">Edit</button>
						<button type="button"
							class="btn btn-danger btn-sm btn-branchDelete"
							data-bs-toggle="modal" data-bs-target="#deleteBranchMdl">Delete</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
	$(document).ready(function() {

		$('#branchTbl').on('click', '.btn-branchEdit', function() {

			var branchId = $(this).closest('tr').find('#branchId').text();
			var branchName = $(this).closest('tr').find('#branchName').text();

			$('#oldBranchId').val(branchId);
			$('#newBranchName').val(branchName);
			$('#oldBranchName').val(branchName);

		});

		$('#branchTbl').on('click', '.btn-branchDelete', function() {

			var branchId = $(this).closest('tr').find('#branchId').text();
			$('#deleteFormBranch').submit(function(e) {
				e.preventDefault();
				deleteBranch(branchId);
			});

			function deleteBranch(branchId) {

				$.ajax({
					url : contextPath + "branch/delete",
					method : "POST",
					data : {
						"txtBranchId" : branchId,
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
					error : function() {
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

		$('#addFormBranch').submit(function(e) {
			e.preventDefault();
			var branchname = $('#addBranchName').val();
			var unique = true;
			$('#branchTbl tbody tr').each(function() {
				var checkName = $(this).find('#branchName').text();
				if (branchname == checkName) {
					unique = false;
				}
			});
			if (unique) {
				addBranch(branchname);
			} else {
				swal("Oops!", "The branch name already exists.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			}
		});

		function addBranch(branchname) {

			$.ajax({
				url : contextPath + "branch/add",
				method : "POST",
				data : {
					"addBranchName" : branchname,
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
				error : function() {
					swal("Sorry!", "Failed to add.", "error", {
						  button: "OK",
						  closeOnClickOutside: true,
						}).then(function() {
							location.reload();
						});
				}
			});
		}
		
		$('#editFormBranch').submit(function(e) {
			e.preventDefault();
			var branchname = $('#newBranchName').val();
			var existid = $('#oldBranchId').val();
			var existname = $('#oldBranchName').val();
			var unique = true;
			$('#branchTbl tbody tr').each(function() {
				var checkName = $(this).find('#branchName').text();
				if (branchname == checkName) {
					unique = false;
				}
			});
			if (branchname == existname) {
				unique = true;
			}
			if (unique) {
				editBranch(existid, branchname);
			} else {
				swal("Oops!", "The branch name already exists.", "warning", {
					  button: "OK",
					  closeOnClickOutside: true,
					});
			}
		});

		function editBranch(existid, branchname) {

			$.ajax({
				url : contextPath + "branch/edit",
				method : "POST",
				data : {
					"oldBranchId" : existid,
					"newBranchName" : branchname,
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
