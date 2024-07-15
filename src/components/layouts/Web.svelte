<script>
	import { onMount } from "svelte";
	import { Router, Route } from "svelte-routing";
	import { navigate } from "svelte-routing";
	import Index from "../pages/web/Index.svelte";
	import Contact from "../pages/web/Contact.svelte";
	import About from "../pages/web/About.svelte";
	import Services from "../pages/web/Services.svelte";
	import Productos from "../pages/web/Productos.svelte";
	export let basepath = "/";

	onMount(() => {});
</script>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a
			class="navbar-brand"
			href="/"
			on:click|preventDefault={() => {
				navigate("/");
			}}><img class="img-fluid w-25" src="/FluyebottleSAC.png" alt="Logo" /></a
		>
		<button
			class="navbar-toggler"
			type="button"
			data-bs-toggle="collapse"
			data-bs-target="#navbarNav"
			aria-controls="navbarNav"
			aria-expanded="false"
			aria-label="Toggle navigation"
		>
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item">
					<a
						class="nav-link active"
						aria-current="page"
						on:click|preventDefault={() => {
							navigate("/");
						}}>Home</a>
				</li>
				<li class="nav-item">
					<a
						class="nav-link"
						href="/about"
						on:click|preventDefault={() => {
							navigate("/about");
						}}>Nosotros</a
					>
				</li>
				<li class="nav-item">
					<a
						class="nav-link"
						href="/services"
						on:click|preventDefault={() => {
							navigate("/services");
						}}>Servicios</a
					>
				</li>
				<li class="nav-item">
					<a
						class="nav-link"
						href="/contact"
						on:click|preventDefault={() => {
							navigate("/contact");
						}}>Contacto</a
					>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/login">Acceder</a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<Router {basepath}>
	<Route path="/" component={Index} />
	<Route path="/about" component={About} />
	<Route path="/contact" component={Contact} />
	<Route path="/services" component={Services} />
	<Route path="/productos" component={Productos} />
</Router>

<footer class="bg-dark text-white pt-4">
	<div class="container">
		<div class="row">
			<!-- About Section -->
			<div class="col-md-4 mb-3">
				<h5>About Us</h5>
				<ul class="list-unstyled">
					<li>
						<i class="bi bi-geo-alt-fill"></i> 
						<span style="margin-left: 5px;">#FluyeAyudando</span>
					</li>
					<li></li>
					<li style="margin-top: 10px;"> <!-- Añadí un margen superior para separar el logo de Instagram -->
						<a target="_blank" rel="noopener noreferrer" title="Instagram" href="https://www.instagram.com/fluyebottle/">
							<img alt="Instagram" loading="lazy" width="46" height="46" decoding="async" data-nimg="1" src="https://fluye-statics.s3.amazonaws.com/social_networks/instagram.png" style="color: transparent;">
						</a>
					</li>
				</ul>
				
			</div>
			<!-- Quick Links Section -->
			<div class="col-md-4 mb-3">
				<h5>Quick Links</h5>
				<ul class="list-unstyled">
					<li>
						<a
							href="/"
							on:click|preventDefault={() => {
								navigate("/");
							}}
							class="text-white">Home</a
						>
					</li>
					<li>
						<a
							href="/about"
							on:click|preventDefault={() => {
								navigate("/about");
							}}
							class="text-white">Nosotros</a
						>
					</li>
					<li>
						<a
							href="/contact"
							on:click|preventDefault={() => {
								navigate("/contact");
							}}
							class="text-white">Contacto</a
						>
					</li>
				</ul>
			</div>
			<!-- Contact Section -->
			<div class="col-md-4 mb-3">
				<h5>Contact Us</h5>
				<ul class="list-unstyled">
					<li>
						<i class="bi bi-geo-alt-fill"></i> Jockey Plaza, 1er Piso, Boulevard,
					</li>
					<li><i class="bi bi-envelope-fill"></i> Santiago de Surco 15054</li>
					<li><i class="bi bi-envelope-fill"></i><a class="MuiBox-root mui-style-1petlm3" target="_blank" href="https://api.whatsapp.com/send?phone=51905451946">
						<i style="font-size: 24px;"> <!-- Ajusta el tamaño del ícono aquí -->
						  <svg width="24" height="24" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
							<g clip-path="url(#clip0_990_36599)">
							  <path d="M2.66699 31.9993C2.66699 10.666 10.667 2.66602 32.0003 2.66602C53.3337 2.66602 61.3337 10.666 61.3337 31.9993C61.3337 53.3327 53.3337 61.3327 32.0003 61.3327C10.667 61.3327 2.66699 53.3327 2.66699 31.9993Z" fill="#00CD4C"></path>
							  <path d="M15.8398 48.4267L17.1198 44.6134C17.5465 43.3867 17.8932 42.1334 18.3732 40.9334C18.5042 40.6775 18.5726 40.3942 18.5726 40.1067C18.5726 39.8192 18.5042 39.5359 18.3732 39.28C16.857 36.4809 16.2383 33.2833 16.6008 30.1207C16.9633 26.9581 18.2896 23.9834 20.3998 21.6C21.9318 19.8537 23.8438 18.4817 25.9887 17.5895C28.1337 16.6973 30.4546 16.3086 32.7732 16.4534C36.2874 16.5693 39.6485 17.9194 42.2665 20.2667C44.7422 22.4215 46.4697 25.3068 47.1998 28.5067C47.8096 31.0943 47.7361 33.796 46.9865 36.3467C46.0701 39.5519 44.1201 42.3644 41.4398 44.3467C39.6653 45.7287 37.6071 46.7012 35.4126 47.1945C33.2182 47.6878 30.9418 47.6897 28.7465 47.2C27.3577 46.9207 26.0185 46.4353 24.7732 45.76C24.6773 45.7149 24.5725 45.6914 24.4665 45.6914C24.3605 45.6914 24.2558 45.7149 24.1598 45.76L17.0132 48L15.8398 48.4267ZM19.8932 44.4H20.1332L24.6132 42.9867C24.7688 42.9339 24.9375 42.9339 25.0932 42.9867C25.7332 43.3067 26.3465 43.7067 27.0132 43.9734C29.67 45.1403 32.652 45.3384 35.4398 44.5334C37.0796 44.0954 38.6154 43.3343 39.9571 42.2948C41.2988 41.2553 42.4194 39.9584 43.2532 38.48C44.9078 35.5999 45.3959 32.1952 44.6172 28.9662C43.8384 25.7372 41.8521 22.9293 39.0665 21.12C36.5444 19.4838 33.5319 18.7753 30.5449 19.1158C27.5579 19.4564 24.7822 20.8248 22.6932 22.9867C20.9831 24.7329 19.816 26.9374 19.3332 29.3334C18.9536 30.9759 18.9116 32.6785 19.2095 34.3378C19.5075 35.9972 20.1392 37.5787 21.0665 38.9867C21.2171 39.2361 21.2966 39.522 21.2966 39.8134C21.2966 40.1047 21.2171 40.3906 21.0665 40.64C20.7198 41.8134 20.3465 43.0934 19.8932 44.4V44.4Z" fill="white"></path>
							  <path d="M39.9998 36.5065C39.9835 37.0742 39.8072 37.6257 39.4911 38.0976C39.1749 38.5694 38.7319 38.9422 38.2131 39.1732C37.6745 39.4675 37.0785 39.6414 36.4661 39.6828C35.8538 39.7243 35.2398 39.6323 34.6664 39.4132C33.5685 39.015 32.4915 38.561 31.4398 38.0532C30.081 37.3334 28.8691 36.3656 27.8664 35.1999C26.7289 33.9487 25.7524 32.5602 24.9598 31.0665C24.3652 30.0314 24.0871 28.8447 24.1598 27.6532C24.2146 27.0379 24.3999 26.4414 24.7034 25.9035C25.0069 25.3655 25.4216 24.8983 25.9198 24.5332C26.1495 24.3777 26.4163 24.2857 26.6931 24.2665C27.0303 24.2393 27.3692 24.2393 27.7064 24.2665C27.8298 24.2821 27.9459 24.3333 28.0406 24.4138C28.1353 24.4943 28.2045 24.6007 28.2398 24.7199C28.5064 25.3332 28.7198 25.9465 28.9598 26.5865C29.1998 27.2265 29.2531 27.4399 29.4398 27.8399C29.6039 28.0603 29.6834 28.3323 29.6638 28.6063C29.6442 28.8804 29.5269 29.1383 29.3331 29.3332C29.0764 29.6685 28.7908 29.9808 28.4798 30.2665C28.366 30.3562 28.2894 30.4848 28.2648 30.6276C28.2402 30.7704 28.2692 30.9172 28.3464 31.0399C29.0684 32.3511 30.0268 33.5174 31.1731 34.4799C31.9948 35.0962 32.8907 35.6068 33.8398 35.9999C33.9381 36.0898 34.0665 36.1397 34.1998 36.1397C34.333 36.1397 34.4615 36.0898 34.5598 35.9999L35.8931 34.4799C36.1864 34.1599 36.3198 34.0799 36.6931 34.2665L39.9731 35.9732C40.0175 36.0543 40.0429 36.1444 40.0475 36.2368C40.0521 36.3292 40.0358 36.4214 39.9998 36.5065V36.5065Z" fill="white"></path>
							</g>
							<defs>
							  <clipPath id="clip0_990_36599">
								<rect width="64" height="64" fill="white"></rect>
							  </clipPath>
							</defs>
						  </svg>
						</i>
					  </a>
					  </li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">
				<a href="#" class="text-white me-3"><i class="bi bi-facebook"></i></a>
				<a href="#" class="text-white me-3"><i class="bi bi-twitter"></i></a>
				<a href="#" class="text-white me-3"><i class="bi bi-instagram"></i></a>
				<a href="#" class="text-white"><i class="bi bi-linkedin"></i></a>
			</div>
		</div>
	</div>
	<div class="bg-light text-dark text-center py-3">
		<p class="mb-0">© 2024 Tu Marca. Todos los derechos reservados.</p>
	</div>
</footer>

<style></style>
