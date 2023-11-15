<!-- Form within a modal -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="modal fade" id="addRawMaterialListMdl" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Raw Material</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="rawMaterialListAdd" action="/rawmaterials/add" method="post">
			<div class="form-group">
				<label for="material_cd" class="mb-2 fw-bold">Raw Material:</label>
				<select id="rawMaterialSelection" name="material_cd" class="form-select" aria-label="Default select example" onfocus="this.size=4" onblur="this.size=1;" onchange="this.size=1; this.blur();" required >
				  	<option id="rawMaterial" disabled>--Select Raw Material--</option>
				  	<c:forEach var="rawMaterial" items="${rawMaterials}">
						<option id="rawMaterial" data-unit="${rawMaterial.unit_of_measurement}" value="${rawMaterial.material_cd}"><c:out value="${rawMaterial.material_name}"/></option>
					</c:forEach>
				</select>
			</div>
			<br>
			<div class="form-group">
				<label for="quantity" class="mb-2 fw-bold">Quantity:</label>
				<small class="text-muted">(Range: [1 - 1000] Only)</small>
				<div class="input-group w-50">
					<input type="number" class="form-control" min="1" max="1000" id="quantity" name="quantity" placeholder="Quantity" required>
					<span class="input-group-text" id="unitOfMeasurement"></span>
				</div>
			</div>
			<br>
			<div class="form-group text-center">
				<input id="btnAdd" type="Submit" class="btn btn-primary" value="Add" />
			</div>
		</form>
      </div>
    </div>
  </div>
</div>
<script>
$(document).ready(function(){
	
	var initialSelect = $('#rawMaterialSelection option:selected').attr('data-unit');
	$('#unitOfMeasurement').text(initialSelect);
	
	$('#rawMaterialSelection').change(function(){
		var selectedUnit = $(this).find('option:selected').attr('data-unit');
		$('#unitOfMeasurement').text(selectedUnit);
	});
	
	$('#addRawMaterialListMdl').blur(function(){
		var defaultUnit = $('#rawMaterialSelection option:eq(1)').attr('data-unit');
		$('#unitOfMeasurement').text(defaultUnit);
		$('#rawMaterialSelection').val($('#rawMaterialSelection option:eq(1)').val());
		$('#quantity').val(null);
	});
	
});
</script>
