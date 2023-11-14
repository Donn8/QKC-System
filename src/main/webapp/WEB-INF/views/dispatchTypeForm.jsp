<div class="modal" tabindex="-1" role="dialog" id="addDispTypMdl">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Dispatch Type</h5>
			</div>
			<div class="modal-body">
				<form id="addFormDispTyp">
					<div class="form-group">
						<label for="addDispTypCd">Dispatch Type Code</label> <input type="text"
							class="form-control" id="addDispTypCd" name="addDispTypCd" pattern="^(?:DISP)\d\d\d$" required
							placeholder= "DISP###" title="Format: DISP###">
					</div>
					<br>
					<div class="form-group">
						<label for="addDispTypName">Dispatch Type Name</label> <input type="text"
							class="form-control" id="addDispTypName" name="addDispTypName" required
							placeholder="Enter dispatch type name">
					</div>
					<br>
					<div class="form-group">
						<input id="btnDispTypSave" type="Submit" class="btn btn-primary" value="Add" />
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>




<div class="modal" tabindex="-1" role="dialog" id="editDispTypMdl">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit Dispatch Type</h5>
			</div>
			<div class="modal-body">
				<form id="editFormDispTyp">
					<input type="hidden" id="oldDispTypCd" name="oldDispTypCd"/>
					<div class="form-group">
						<label for="newDispTypCd">Dispatch Type Code</label> <input type="text"
							class="form-control" id="newDispTypCd" name="newDispTypCd"  title="Format: DISP###" pattern="^(?:DISP)\d\d\d$" required />
					</div>
					<br>
					<div class="form-group">
						<label for="newDispTypName">Dispatch Type Name</label> <input type="text"
							class="form-control" id="newDispTypName" name="newDispTypName" required />
					</div>
					<br>
					<div class="form-group">
						<input id="btnDispTypSave" type="Submit" class="btn btn-primary" value="Save changes" />
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>




<div class="modal" tabindex="-1" role="dialog" id="deleteDispTypMdl">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Delete Dispatch Type</h5>
			</div>
			<div class="modal-body">
				<p>Are you sure to delete this dispatch type?</p>
				<form id="deleteFormDispTyp">
					<input type="hidden" id="dispTypCd" name="dispTypCd"/>
					<div class="form-group">
						<button type="button" class="btn btn-secondary" id="close-modal" data-bs-dismiss="modal">No</button>
			   			<button type="Submit" class="btn btn-danger" id="btnDispTypDelete">Yes</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

