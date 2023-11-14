<!-- Delete form confirmation within a modal -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="modal fade" id="delDailyPlannedProductionMdl" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Production Plan</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="delPlanProdForm" method="post">
			<h5 class="text-center">Are you sure you want to delete this item?</h5>
			<hr>
			<div class="form-group text-center">
				<input id="dppBtnDeleteConfirm" type="Submit" class="btn btn-danger" value="Delete" />
				<input id="dppBtnCancel" type="button" class="btn btn-secondary" value="Cancel" data-bs-dismiss="modal" />
				<input type="hidden" id="delDppId" name="delDppId"/>
			</div>
		</form>
      </div>
    </div>
  </div>
</div>