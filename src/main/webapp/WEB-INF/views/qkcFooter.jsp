<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap');

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	min-height: 100vh;
	display: block;
	align-items: center;
	justify-content: center;
	margin-bottom: 0;
}

.site-footer {
	font-size: 15px;
	line-height: 24px;
	color: black;
	background-color: #E0A387;
	margin-bottom: 0;
	padding: 10px;
}

.site-footer hr {
	border-top-color: rgb(255, 0, 0);
	opacity: 0.5;
}

.site-footer hr.small {
	margin: 20px 0;
}

.site-footer h6 {
	color: #fff;
	font-size: 16px;
	text-transform: uppercase;
	margin-top: 5px;
	letter-spacing: 2px;
}

.site-footer a {
	color: rgb(0, 0, 0);
}

.site-footer a:hover {
	color: #fff;
	text-decoration: none;
}

.footer-links {
	padding-left: 0;
	list-style: none;
}

.footer-links li {
	display: block;
}

.footer-links a {
	color: #737373;
}

.footer-links a:active, .footer-links a:focus, .footer-links a:hover {
	color: #fff;
	text-decoration: none;
}

.site-footer .social-icons {
	text-align: right;
}

.site-footer .social-icons a {
	width: 40px;
	height: 40px;
	line-height: 40px;
	margin-right: 0;
	border-radius: 100%;
	background-color: #77A0A9;
}

@media ( max-width : 991px) {
	.site-footer [class^="col-"] {
		margin-bottom: 30px;
	}
}

@media ( max-width : 767px) {
	.site-footer {
		padding-bottom: 0;
	}
	.site-footer .copyright-text, .site-footer .social-icons {
		text-align: center;
	}
}

.social-icons {
	padding-left: 0;
	margin-bottom: 0;
	list-style: none;
}

.social-icons li {
	display: inline-block;
	margin-bottom: 4px;
}

.social-icons a {
	background-color: #eceeef;
	color: #96031A;
	font-size: 16px;
	display: inline-block;
	line-height: 44px;
	width: 44px;
	height: 44px;
	text-align: center;
	margin-right: 8px;
	border-radius: 100%;
	-webkit-transition: all 0.2s linear;
	-o-transition: all 0.2s linear;
	transition: all 0.2s linear;
}

.logo {
	color: #96031A;
	font-weight: bolder;
	text-decoration: none;
}

.social-icons a:active, .social-icons a:focus, .social-icons a:hover {
	color: #fff;
	background-color: #29aafe;
}

.social-icons a.facebook:hover {
	background-color: #3b5998;
}

.social-icons a.twitter:hover {
	background-color: #00aced;
}

.social-icons a.linkedin:hover {
	background-color: #007bb6;
}

.social-icons a.dribbble:hover {
	background-color: #ea4c89;
}

.text p i {
	color: rgb(0, 0, 0);
}

.text h6 {
	color: #96031A;
	font-weight: 600;
}

.sec {
	align-items: center;
	justify-content: center;
	text-align: center
}
</style>

<footer class="site-footer">
	<br> <br> <br> <br>
	<div class="sec">
		<div class="row">
			<div class="text">
				<h6>About</h6>
				<p class="text-justify">
					<i>We at Quisine pride ourselves in providing sumptuous and
						trendy dishes that will tantalise your taste.</i>
				</p>
				<p>
				<h6>Contact</h6>
				<i>quisine.ph@gmail.com</i>
				</p>
			</div>
		</div>
		<hr class="small">
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-6 col-12">
				<p class="copyright-text">
					Copyright © 2023 All Rights Reserved by <a href="#" ><span
						class="logo">QUISINE</span></a>
				</p>
			</div>
			<div class="col-md-4 col-sm-6 col-12">
				<ul class="social-icons">
					<li><a class="facebook" href="#"><i
							class="fab fa-facebook-f"></i></a></li>
					<li><a class="twitter" href="#"><i class="fab fa-twitter"></i></a></li>
					<li><a class="dribbble" href="#"><i
							class="fab fa-dribbble"></i></a></li>
					<li><a class="linkedin" href="#"><i
							class="fab fa-linkedin-in"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
</footer>
