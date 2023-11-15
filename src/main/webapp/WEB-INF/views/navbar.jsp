<style>

@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap');

	
#qkcheader {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px 50px;
	background: #171810;
	box-shadow: 0 5px 15px rgba(128, 128, 128, 0.2);
	z-index: 999;
	position: sticky;
	top: 0;
	left: 0;
}

#qkclogo {
	display: flex;
	align-items: center;
	border-radius: 50%;
}

#qkclogo img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	object-fit: cover;
}

#qkcnavbar {
	display: flex;
	align-items: center;
}

#qkcnavbar li {
	list-style: none;
	padding: 0 20px;
	position: relative;
}

#qkcnavbar li a {
	text-decoration: none;
	font-size: 16px;
	font-weight: 500;
	color: #D6DFE0;
	transition: 0.3s ease;
	font-family: 'Poppins', sans-serif;
}

#qkcnavbar li.active a {
	color: #E09D60;
}

#qkcnavbar li a:hover {
	color: #E09D60;
}

#qkcnavbar li.active a::after, #qkcnavbar li a:hover::after {
	content: "";
	width: 20%;
	height: 2px;
	background: #E09D60;
	position: absolute;
	bottom: -4px;
	left: 20px;
}

#qkcnavbar li a.dropdown-item{
color: black;
}

#btnLogOut {
	background-color: #2c3e50;
	color: white;
	padding: 5px 10px;
	border: none;
	cursor: pointer;
	position: relative;
}

#btnLogOut:hover {
	background-color: #34495e;
}

#qkclogo h5 {
	margin-left: 10px;
	color: #E09D60;
}
</style>

<jsp:include page="logOut.jsp" />
<section id="qkcheader">
	<div id="qkclogo">
		<img src="/img/logo.jpg" alt="Logo">
		<h5>
			<i>Quisine</i>
		</h5>
	</div>
	<div class="nav">
		<ul id="qkcnavbar">
			<li><a href="/main">Home</a></li>
			<li><a href="/rawmaterials">Raw Materials</a></li>
			<li><a href="/daily-planned-production">Daily Planned
					Production</a></li>
			<li><a href="/dispatch">Dispatching</a></li>
			<li><a href="/report-gen-section">Reports</a></li>
			<li><a href="/finishedProductList">Finished Product</a></li>
				<li><div class="dropdown">
				<a class="dropdown-toggle" href="/maintenance"
					role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
					aria-expanded="false"> Maintenance </a>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<li><a class="dropdown-item" href="/branch">Branch</a></li>
					<li><a class="dropdown-item" href="/dispatchType">Dispatch
							Type</a></li>
					<li><a class="dropdown-item" href="/rawMaterial">Raw
							Material</a></li>
					<li><a class="dropdown-item" href="/sku">Sku</a></li>
				</ul>
			</div>
			</li>
			<li>
				<button id="btnLogOut" data-bs-toggle="modal"
					data-bs-target="#logoutModal">Log out</button>
			</li>
		</ul>
	</div>
</section>

<script>
	var path = window.location.pathname;
	$('#qkcnavbar a').each(function() {
		if ($(this).attr('href') === path) {
			$(this).parent().addClass('active');
		}
	});
</script>
