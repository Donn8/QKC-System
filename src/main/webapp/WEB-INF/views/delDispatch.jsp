<div class="modal fade" id="delDispatchMdl" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div style="background-color: white; color: black;"
				class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">
					<i class="fas fa-exclamation-triangle"></i> Confirm Deletion
				</h1>
			</div>
			<div class="modal-body">
				<h5 class="text-center">Are you sure you want to delete this
					item?</h5>
				<hr>
				<form action="/dispatch/delete" method="post">
					<div class="form-group text-center">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancel</button>
						<input id="btnDelete" type="submit" class="btn btn-danger"
							value="Delete" /> <input type="hidden"
							id="deldispatchTrackingId" name="deldispatchTrackingId" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>