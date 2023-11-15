<!-- Edit Form within a modal -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="modal fade" id="editRawMaterialListMdl" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Raw Material</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="rawMaterialListEdit" action="/rawmaterials/edit" method="post">
			<div class="form-group">
				<label for="edit_material_cd" class="mb-2 fw-bold">Raw Material:</label>
				<select id="editRawMaterialSelection" name="edit_material_cd" class="form-select" aria-label="Default select example" onfocus="this.size=4" onblur="this.size=1;" onchange="this.size=1; this.blur();" required >
				  	<option id="rawMaterial" disabled>--Select Raw Material--</option>
				  	<c:forEach var="rawMaterial" items="${rawMaterials}">
						<option id="rawMaterial" data-editUnit="${rawMaterial.unit_of_measurement}" value="${rawMaterial.material_cd}"><c:out value="${rawMaterial.material_name}"/></option>
					</c:forEach>
				</select>
			</div>
			<br>
			<div class="form-group">
				<label for="editQuantity" class="mb-2 fw-bold">Quantity:</label>
				<small class="text-muted">(Range: [1 - 1000] Only)</small>
				<div class="input-group w-50">
					<input type="number" class="form-control w-25" min="1" max="1000" id="editQuantity" name="editQuantity" placeholder="Quantity" required>
					<span class="input-group-text" id="editUnitOfMeasurement"></span>
				</div>
			</div>
			<br>
			<div class="form-group text-center">
				<input id="btnSave" type="Submit" class="btn btn-primary" value="Save Changes" />
				<input type="hidden" id="materialListId" name="materialListId"/>
			</div>
		</form>
      </div>
    </div>
  </div>
</div>
