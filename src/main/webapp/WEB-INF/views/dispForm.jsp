<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.modal-content {
	background-color: #fff;
	border-radius: 5px;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.modal-header {
	color: black;
	padding: 15px;
	border-radius: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal-title {
	margin: 0;
	font-size: 23px;
	font-weight: 600;
	text-align: center;
}

.form-group {
	margin-bottom: 5px;
}

.form-label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.animated-input {
	width: 100%;
	padding: 12px 10px;
	border: none;
	border-bottom: 1px solid #ced4da;
	border-radius: 0;
	font-size: 16px;
	outline: none;
	transition: border-color 0.2s;
}

.animated-input::placeholder {
	color: #999;
}

.animated-input:focus {
	border-color: #007bff;
}

.input-group {
	margin-bottom: 20px;
}

.input-group-text {
	background-color: #e9ecef;
	border: none;
	color: black;
}

.input-group {
	display: flex;
	align-items: center;
}

#unitOfMeasurementContainer {
	justify-content: center;
	align-items: center;
}

#txtquantity {
	width: 50%;
}

#editquantity {
	width: 50%;
}
</style>
</head>

<body>
	<div class="modal fade" tabindex="-1" role="dialog" id="dispMdl">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Add Dispatch</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<br>
				<div class="modal-body">
					<form action="/dispatch/add" method="post">
						<div class="form-group">
							<label for="txtDisptype" class="form-label">Dispatch Type</label>
							<select class="animated-input" id="txtDisptype"
								name="dispatchTypeCd" required>
								<option value="" selected disabled>--Select Dispatch
									Type--</option>
								<c:forEach var="dType" items="${dtList}">
									<option value="${dType.dispatchTypeCd}"><c:out
											value="${dType.dispatchTypeName}" /></option>
								</c:forEach>
							</select>
						</div>
						<br>
						<div class="form-group">
							<label for="txtSku" class="form-label">SKU</label> <select
								class="animated-input" id="txtSku" name="fplId" required>
								<option value="" selected disabled>--Select SKU--</option>
								<c:forEach var="uniSku" items="${uniSku}">
									<c:set var="maxQuantity" value="${uniSku.totalQty}" />
									<option data-unit="${uniSku.unit_of_measurement}"
										value="${uniSku.fplId}" maxQuantity="${maxQuantity}">
										${uniSku.fplId}.
										<c:out value="${uniSku.skuName}" />
									</option>
								</c:forEach>
							</select>
						</div>

						<br>
						<div class="form-group">
							<div class="input-group">
								<label for="txtquantity" class="form-label">Quantity: </label><br>
								<input type="number" class="animated-input" id="txtquantity"
									name="quantity" required placeholder="Enter quantity" min="0">
								<span class="input-group-text" id="unitOfMeasurementContainer"></span>
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="txtdestination" class="form-label">Destination</label>
							<input type="text" class="animated-input" id="txtdestination"
								name="destination" required placeholder="Enter your destination">
						</div>
						<br> <br>
						<div class="form-group text-center">
							<input id="btndispSave" type="submit" class="btn btn-primary"
								value="Add" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#txtSku').change(function() {
			var selectedOption = $('option:selected', this);
			var selectedUnit = selectedOption.attr('data-unit');
			var maxQuantity = selectedOption.attr('maxQuantity');

			$('#unitOfMeasurementContainer').text(selectedUnit);
			$('#txtquantity').attr('max', maxQuantity);
		});
	</script>