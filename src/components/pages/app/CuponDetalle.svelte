<script>
    // Importación de funciones y componentes necesarios desde Svelte
	import { navigate } from "svelte-routing";
	import { onMount } from "svelte/internal";

    // Declaración de variables reactivas
	export let cuponId = 'E'; // Propiedad para recibir el ID del cupón como prop (valor inicial 'E')
	let codigo = ""; // Variable para almacenar el código del cupón (inicialmente vacía)
	let porcentajeDsct = ""; // Variable para almacenar el porcentaje de descuento del cupón (inicialmente vacía)
	let mensajeExito = ""; // Variable para mostrar el mensaje de éxito después de guardar el cupón
    let cupon = []; // Variable para almacenar los datos del cupón obtenidos del servidor (inicialmente un array vacío)

    // Función ejecutada al montar el componente
    onMount(async () => {
        await fetchCupon(); // Llama a la función fetchCupon() para obtener los datos del cupón
    })

    // Función asincrónica para obtener los datos del cupón desde el servidor
    const fetchCupon = async () => {
		try {
			const response = await fetch(`/cupones/fetch-one?id=${cuponId}`);
			if (!response.ok) {
				throw new Error("Error en la solicitud: " + response.status);
			}
			cupon = await response.json(); // Almacena los datos del cupón obtenidos del servidor
            //console.log(cupon);
            codigo = cupon.codigo; // Asigna el valor del código del cupón a la variable 'codigo'
            porcentajeDsct = cupon.porcentajeDsct; // Asigna el valor del porcentaje de descuento a la variable 'porcentajeDsct'
		} catch (error) {
			console.error("Error en la solicitud:", error); // Registra un error si la solicitud falla
		}
	};

    // Función asincrónica para guardar los cambios del cupón
	async function grabar() {
		try {
			// Validación de campos de entrada
			if (!codigo.trim() || !porcentajeDsct.trim()) {
				throw new Error("Por favor complete todos los campos");
			}

			// Preparación de datos para enviar
			const datos = { cuponId, codigo, porcentajeDsct };
			const opciones = {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify(datos),
			};

			// Envío de la solicitud para guardar el cupón
			const response = await fetch("/cupon/grabar", opciones);
			if (!response.ok) {
				const errorData = await response.json();
				throw new Error("Error en la solicitud: " + errorData.error);
			}

			// Manejo de respuesta exitosa
			const data = await response.json();
			console.log("Respuesta del servidor:", data);

			// Mostrar mensaje de éxito
			mostrarMensajeExito();
		} catch (error) {
			console.error("Error en la solicitud:", error);
			alert(
				error.message ||
					"Error al intentar agregar cupón. Por favor, inténtelo de nuevo.",
			);
		}
	}

    // Función para mostrar el mensaje de éxito después de guardar el cupón
	function mostrarMensajeExito() {
		mensajeExito = "Cupón agregado correctamente";
	}
</script>

<div class="container">
	<div class="mb-3">
		<h4>{#if cuponId == 'E'} Crear {:else} Editar {/if} Cupon</h4>
	</div>

	<div class="card border-0">
		<div class="card-header">
			<h5 class="card-title">Formulario de cupón</h5>
		</div>
		<div class="card-body">
			{#if mensajeExito}
				<div class="alert alert-success" role="alert">
					{mensajeExito}
				</div>
			{/if}

			<form on:submit|preventDefault={grabar}>
				<div class="form-group">
					<label for="codigo">Código</label>
					<input
						type="text"
						class="form-control"
						id="codigo"
						placeholder="Código del cupón"
						bind:value={codigo}
					/>
				</div>
				<div class="form-group">
					<label for="porcentajeDsct">Porcentaje de descuento</label>
					<input
						type="text"
						class="form-control"
						id="porcentajeDsct"
						placeholder="Porcentaje de descuento"
						bind:value={porcentajeDsct}
					/>
				</div>
				<button type="submit" class="btn btn-primary">Guardar Cambios</button>
			</form>
		</div>
	</div>

	<!-- Botón para regresar a la lista de cupones -->
	<div class="mt-3">
		<a
			href="/admin/cupones"
			on:click|preventDefault={() => navigate("/admin/cupones")}
			class="btn btn-secondary"
		>
			Volver a la lista de cupones
		</a>
	</div>
</div>
