<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>QKC Main Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link
	href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<style>
h4 {
	text-align: center;
	font-weight: 700;
}

.join {
	display: inline-block;
	text-decoration: none;
	border: 1px solid white;
	border-radius: 30px;
	padding: 15px 40px;
	font-size: 16px;
	color: white;
}

.join.anim {
	animation-delay: 1s;
}

.content {
	margin-top: 10%;
	max-width: 600px;
}

.content h1 {
	font-size: 50px;
	color:#fac564;

}
.content h2 {
	font-size: 40pxpx;
	color:#fac564;

}

.content p {
	margin: 10px 0 30px;
	color: white;
	animation-delay: 0.5s;
	text-shadow: 1px 2px 2px black;
}

.feature-img {
	width:73%;
	position: absolute;
	bottom: 0;
	right: 0;
	left:33%;
}

.feature-img.anim {
	animation-delay: 1.5s;
}

.main {
	width: 100%;
	min-height: 100vh;
	background-image: url('/img/wood.jpg');
	background-position: center;
	background-size: cover;
	padding: 10px 10%;
	overflow: hidden;
	position: relative;
}

.anim {
	opacity: 0;
	transform: translateY(30px);
	animation: moveup 0.5s linear forwards;
}

@keyframes moveup { 
100%{
	opacity: 1;
	transform: translateY(0px);
	}
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<section class="main">
		<div class="content">
			<h1 class="anim">
				<em>Welcome ${user.name}!</em>
			</h1>
			<h2 class="anim">Branch: ${user.branch.branch_name}</h2>
			<p class="anim">Savor the crunch of excellence with QUISINE
				Kamote Chips, where every bite is a journey into the world of
				exquisite flavors.</p>
			<a href="#" class="join anim">Quisine Kamote Chips!</a>
		</div>
		<img src="/img/model.png" class="feature-img anim">
	</section>

	<%@ include file="qkcFooter.jsp"%>
</body>
</html>
