<div class="modal" tabindex="-1" role="dialog" id="addBranchMdl">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Branch</h5>
			</div>
			<div class="modal-body">
				<form id="addFormBranch" >
					<div class="form-group">
						<label for="addBranchName">Branch Name</label> <input type="text"
							class="form-control" id="addBranchName" name="addBranchName" maxlength="50" required
							placeholder="Enter branch name">
					</div>
					<br>
					<div class="form-group">
						<input id="btnBranchSave" type="Submit" class="btn btn-primary" value="Add" />
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>




<div class="modal" tabindex="-1" role="dialog" id="editBranchMdl">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit Branch</h5>
			</div>
			<div class="modal-body">
				<form id="editFormBranch">
					<input type="hidden" id="oldBranchId" name="oldBranchId"/>
					<input type="hidden" id="oldBranchName" name="oldBranchName"/>
					<div class="form-group">
						<label for="newBranchName">Branch Name</label> <input type="text"
							class="form-control" id="newBranchName" name="newBranchName" maxlength="50" required />
					</div>
					<br>
					<div class="form-group">
						<input id="btnBranchSave" type="Submit" class="btn btn-primary" value="Save changes" />
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>




<div class="modal" tabindex="-1" role="dialog" id="deleteBranchMdl">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Delete Branch</h5>
			</div>
			<div class="modal-body">
				<p>Are you sure you want to delete this branch?</p>
				<form id=deleteFormBranch>
					<input type="hidden" id="txtBranchId" name="txtBranchId"/>
					<div class="form-group">
						<button type="button" class="btn btn-secondary" id="close-modal" data-bs-dismiss="modal">No</button>
			   			<button type="Submit" class="btn btn-danger" id="btnBranchDelete">Yes</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


