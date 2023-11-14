<div class="modal" tabindex="-1" role="dialog" id="addRawMatMdl">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Raw Material</h5>
			</div>
			<div class="modal-body">
				<form id="addFormRaw">
					<div class="form-group">
						<label for="addRawMatCd">Raw Material Code</label> <input type="text"
							class="form-control" id="addRawMatCd" name="addRawMatCd" pattern="^(?:XYZ)\d\d\d$" required
							placeholder="XYZ###" title="Format: XYZ###">
					</div>
					<br>
					<div class="form-group">
						<label for="addRawMatName">Raw Material Name</label> <input type="text"
							class="form-control" id="addRawMatName" name="addRawMatName" required
							placeholder="Enter raw material name">
					</div>
					<br>
					<div class="form-group">
						<label for="addRawMatUOM">Unit of Measurement</label> <!--  <input type=""
							class="form-control" id="addRawMatUOM" name="addRawMatUOM" required
							placeholder="Unit of Measurement">-->
							<select class="form-select form-select-sm unit_of_measurement" aria-label=".unit_of_measurement options" id = "addRawMatUOM" name = "addRawMatUOM" required>
							  <option disabled selected>Choose unit of measurement</option>
							  <option value="mg">milligram</option>
							  <option value="g">gram</option>
							  <option value="kg">kilogram</option>
							  <option value="mL">milliliter</option>
							  <option value="L">liter</option>
							  <option value="oz">ounce</option>
							  <option value="lbs">pound</option>
							  <option value="gallon">gallon</option>
							  <option value="pcs">pieces</option>
							</select>
					</div>
					<br>
					<div class="form-group">
						<input id="btnRawMatSave" type="Submit" class="btn btn-primary" value="Add" />
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>




<div class="modal" tabindex="-1" role="dialog" id="editRawMatMdl">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit Raw Material</h5>
			</div>
			<div class="modal-body">
				<form id="editFormRaw">
					<input type="hidden" id="oldRawMatCd" name="oldRawMatCd"/>
					<div class="form-group">
						<label for="newRawMatCd">Raw Material Code</label> <input type="text"
							class="form-control" id="newRawMatCd"  title="Format: XYZ###" name="newRawMatCd" pattern="^(?:XYZ)\d\d\d$" required />
					</div>
					<br>
					<div class="form-group">
						<label for="newRawMatName">Raw Material Name</label> <input type="text"
							class="form-control" id="newRawMatName" name="newRawMatName" required />
					</div>
					<br>
					<div class="form-group">
						<label for="newRawMatUOM">Unit of Measurement</label> <!--  <input type=""
							class="form-control" id="addRawMatUOM" name="addRawMatUOM" required
							placeholder="Unit of Measurement">-->
							<select class="form-select form-select-sm unit_of_measurement" aria-label=".unit_of_measurement options" id = "newRawMatUOM" name = "newRawMatUOM" required>
							  <option value="mg">milligram</option>
							  <option value="g">gram</option>
							  <option value="kg">kilogram</option>
							  <option value="mL">milliliter</option>
							  <option value="L">liter</option>
							  <option value="oz">ounce</option>
							  <option value="lbs">pound</option>
							  <option value="gallon">gallon</option>
							  <option value="pcs">pieces</option>
							</select>
					</div>
					<br>
					<div class="form-group">
						<input id="btnRawMatSave" type="Submit" class="btn btn-primary" value="Save changes" />
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>




<div class="modal" tabindex="-1" role="dialog" id="deleteRawMatMdl">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Delete Raw Material</h5>
			</div>
			<div class="modal-body">
				<p>Are you sure to delete this raw material?</p>
				<form id="deleteFormRaw">
					<input type="hidden" id="rawMaterialCd" name="rawMaterialCd"/>
					<div class="form-group">
						<button type="button" class="btn btn-secondary" id="close-modal" data-bs-dismiss="modal">No</button>
			   			<button type="Submit" class="btn btn-danger" id="btnRawMatDelete">Yes</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

