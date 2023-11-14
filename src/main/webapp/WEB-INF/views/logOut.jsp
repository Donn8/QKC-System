<div class="modal fade" id="logoutModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-body">
        <h5 class="text-center"> Are you sure you want to Log out?</h5>
        <hr>
        <form action="/logout" method="post">
          <div class="form-group text-center">
           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            <input id="btnDelete" type="submit" class="btn btn-danger" value="Log out"  />
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
