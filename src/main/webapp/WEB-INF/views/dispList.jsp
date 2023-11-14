<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.css">
    <br>
    <br>
    <button type="button" class="btn btn-primary" id="btndispForm" data-bs-toggle="modal" data-bs-target="#dispMdl">
        <i class="fas fa-plus"></i> Add Dispatch Record
    </button>
    <br>
    <br>
    <div class="table-responsive">
        <table class="table" id="dispTbl">
            <thead>
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">Dispatch Type</th>
                    <th class="text-center">Sku</th>
                    <th class="text-center">Quantity</th>
                    <th class="text-center">Branch</th>
                    <th class="text-center">Destination</th>
                    <th class="text-center">Dispatch Date</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="disp" items="${dispList}">
                    <tr>
                        <td class="text-center" id="dispId" data-value="${disp.dispatchTrackingId}"><c:out value="${disp.dispatchTrackingId}" /></td>
                        <td class="text-center" id="disptype"><c:out value="${disp.dispatchType.dispatchTypeName}" /></td>
                        <td class="text-center" id="dispsku"><c:out value="${disp.fplId.sku.sku_name}" /></td>
                        <td class="text-center" id="dispquantity"> <c:out value="${disp.quantity}" /> </td>
                       <td class="text-center"  id="dispbranchId"><c:out value="${disp.getBranchId().getBranch_name()}" /></td>
                        <td class="text-center" id="dispdestination"><c:out value="${disp.destination}" /></td>
                      	<td class="text-center" id="dispdate"><fmt:formatDate value="${disp.dispatchDate}" pattern="MM/dd/yy" /></td>
                        <td class="text-center">
                            <button type="button" class="btn btn-primary btn-sm btn-dispEdit" data-bs-toggle="modal" data-bs-target="#editMdl">
                                <i class="fas fa-pencil-alt"></i>
                            </button>
                            <button type="button" class="btn btn-danger btn-sm btn-dispDelete" data-bs-toggle="modal"  data-bs-target="#delDispatchMdl">
							<i class="fas fa-trash-alt"></i></button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

<script>
    $(document).ready(function() {

        $('#dispTbl').on('click', '.btn-dispEdit', function() {
            var dispId = $(this).closest('tr').find('#dispId').text();
            var disptype = $(this).closest('tr').find('#disptype').text();
            var sku = $(this).closest('tr').find('#dispsku').text();
            var quantity = $(this).closest('tr').find('#dispquantity').text();
            var destination = $(this).closest('tr').find('#dispdestination').text();

            $('#editDispId').val(dispId);
            $('#editDisptype option').filter(function() {
                return $(this).text() === disptype;
            }).prop('selected', true);
            $('#editSku option').each(function() {
                if ($(this).text() === sku) {
                    $(this).prop('selected', true);
                } else {
                    $(this).prop('selected', false);
                }
            });
            // Set the value of #editquantity explicitly
            $('#editquantity').val(quantity.trim());

            $('#editdestination').val(destination);

            $('#editSku').change();
        });

        $('#editSku').change(function() {
            var selectedOption = $('option:selected', this);
            var selectedUnit = selectedOption.attr('data-unit');
            var maxQuantity = selectedOption.attr('maxQuantity');

            $('#editunitOfMeasurementContainer').text(selectedUnit);
            $('#editquantity').attr('max', maxQuantity);
        });

        $('#dispTbl').on('click', '.btn-dispDelete', function() {
            var currentRow = $(this).closest('tr');
            var dispatchTrackingId = currentRow.find('#dispId').data('value');
            $('#deldispatchTrackingId').val(dispatchTrackingId);
            $('#delDispatchMdl').modal('show');
        });

        $('#btnDelete').click(function() {
            $('#delDispatchMdl').modal('hide');
            $('#delDispatchMdl form').submit();
        });


    });
</script>

