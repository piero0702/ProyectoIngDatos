<script>
	import { onMount } from "svelte";
	import { Router, Route } from "svelte-routing";
	import Sidebar from "../widgets/Sidebar.svelte";
	import Navbar from "../widgets/Navbar.svelte";
	import ThemeToggle from "../widgets/ThemeToggle.svelte";
	import Footer from "../widgets/Footer.svelte";
	import Home from "../pages/app/Home.svelte";
	import Level from "../pages/app/Level.svelte";
	import BodyPart from "../pages/app/BodyPart.svelte";
	import Member from "../pages/app/Member.svelte";
	import Country from "../pages/app/Country.svelte";
	import Tipos from "../pages/app/Tipos.svelte";
	import Productos from "../pages/app/Productos.svelte";
	import Clientes from "../pages/app/Clientes.svelte";
	import Pedidos from "../pages/app/Pedidos.svelte";
	import ClienteDetalle from "../pages/app/ClienteDetalle.svelte";
	import TipoDocumento from "../pages/app/TipoDocumento.svelte";
	import Entrega from "../pages/app/Entrega.svelte";
	import TiposProductos from "../pages/app/TiposProductos.svelte";
	import Cupones from "../pages/app/Cupones.svelte";
	import Distritos from "../pages/app/Distritos.svelte";
	import Colores from "../pages/app/Colores.svelte";
	import Tamanios from "../pages/app/Tamanios.svelte";
	import Direcciones from "../pages/app/Direcciones.svelte";
	import PedidosProductos from "../pages/app/PedidosProductos.svelte";
	import PedidosDetalle from "../pages/app/PedidosDetalle.svelte";
	import CuponDetalle from "../pages/app/CuponDetalle.svelte";
	import PedidosProductoDetalle from "../pages/app/PedidosProductoDetalle.svelte";
	import MostrarPedidoProducto from "../pages/app/MostrarPedidoProducto.svelte";
	export let basepath = "/admin";

	const toggleRootClass = () => {
		const current = document.documentElement.getAttribute("data-bs-theme");
		const inverted = current === "dark" ? "light" : "dark";
		document.documentElement.setAttribute("data-bs-theme", inverted);
	};

	const toggleLocalStorage = () => {
		if (isLight()) {
			localStorage.removeItem("light");
		} else {
			localStorage.setItem("light", "set");
		}
	};

	const isLight = () => {
		return localStorage.getItem("light");
	};

	onMount(() => {
		const sidebarToggle = document.querySelector("#sidebar-toggle");
		if (sidebarToggle) {
			sidebarToggle.addEventListener("click", () => {
				document.querySelector("#sidebar").classList.toggle("collapsed");
			});
		}

		const themeToggle = document.querySelector(".theme-toggle"); //lagos
		if (themeToggle) {
			themeToggle.addEventListener("click", () => {
				toggleLocalStorage();
				toggleRootClass();
			});
		}

		if (isLight()) {
			toggleRootClass();
		}
	});
</script>

<div class="wrapper">
	<Sidebar />
	<div class="main">
		<Navbar />
		<main class="content px-3 py-2">
			<div class="container-fluid">
				<Router {basepath}>
					<Route path="/" component={Home} />
					<Route path="/level" component={Level} />
					<Route path="/body-part" component={BodyPart} />
					<Route path="/member" component={Member} />
					<Route path="/country" component={Country} />
					<Route path="/tipos" component={Tipos} />
					<Route path="/productos" component={Productos} />
					<Route path="/documento" component={TipoDocumento} />
					<Route path="/tiposProductos" component={TiposProductos} />
					<Route path="/entrega" component={Entrega} />
					<Route path="/colores" component={Colores} />
					<Route path="/tamanios" component={Tamanios} />
					<Route path="/distritos" component={Distritos} />
					<Route path="/direcciones" component={Direcciones} />

					<Route path="/pedidosProductos" component={PedidosProductos} />
					<Route
						path="/pedidosproductos/nuevo"
						component={PedidosProductoDetalle}
					/>
					<Route
						path="/mostrarPedidoProducto"
						component={MostrarPedidoProducto}
					/>

					<Route path="/clientes" component={Clientes} />
					<Route path="/cliente/nuevo" component={ClienteDetalle} />
					<Route path="/cliente/editar/:id" let:params>
						<ClienteDetalle clienteId={params.id} />
					</Route>

					<Route path="/pedidos" component={Pedidos} />
					<Route path="/pedido/nuevo" component={PedidosDetalle} />

					<Route path="/cupones" component={Cupones} />
					<Route path="/cupon/nuevo" component={CuponDetalle} />
					<Route path="/cupones/edit/:id" let:params>
						<CuponDetalle cuponId={params.id} />
					</Route>
				</Router>
			</div>
		</main>
		<ThemeToggle />
		<Footer />
	</div>
</div>

<style></style>
