<!-- Delete form confirmation within a modal -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="modal fade" id="delRawMaterialListMdl" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Raw Material</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="rawMaterialListDelete" action="/rawmaterials/delete" method="post">
			<h5 class="text-center">Are you sure you want to delete this item?</h5>
			<hr>
			<div class="form-group text-center">
				<input id="btnDelete" type="Submit" class="btn btn-danger" value="Delete" />
				<input id="btnCancel" type="button" class="btn btn-secondary" value="Cancel" data-bs-dismiss="modal" />
				<input type="hidden" id="delmaterialListId" name="delmaterialListId"/>
			</div>
		</form>
      </div>
    </div>
  </div>
</div>
