<script>
    import { navigate } from "svelte-routing";
    import { onMount } from 'svelte';

    let codigo = "";
    let porcentajeDsct = "";
    let mensajeExito = "";

    async function grabar() {
        try {
            if (codigo.trim() === "" || porcentajeDsct.trim() === "") {
                throw new Error('Por favor complete todos los campos');
            }

            const datos = { codigo, porcentajeDsct };
            const opciones = {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(datos)
            };

            const response = await fetch("/cupon/grabar", opciones);
            if (!response.ok) {
                const errorData = await response.json();
                throw new Error("Error en la solicitud: " + errorData.error);
            }

            const data = await response.json();
            console.log("Respuesta del servidor:", data);

            // Mostrar mensaje de éxito
            mostrarMensajeExito();

        } catch (error) {
            console.error("Error en la solicitud:", error);
            alert("Error al intentar agregar cupón. Por favor, inténtelo de nuevo.");
        }
    }

    function mostrarMensajeExito() {
        mensajeExito = "Cupón agregado correctamente";
    }

    onMount(() => {
    });
</script>

<div class="container">
    <div class="mb-3">
        <h4>Nuevo cupón</h4>
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
                    <input type="text" class="form-control" id="codigo" placeholder="Código del cupón" bind:value={codigo}>
                </div>
                <div class="form-group">
                    <label for="porcentajeDsct">Porcentaje de descuento</label>
                    <input type="text" class="form-control" id="porcentajeDsct" placeholder="Porcentaje de descuento" bind:value={porcentajeDsct}>
                </div>
                <button type="submit" class="btn btn-primary">Agregar Cupón</button>
            </form>
        </div>
    </div>

    <!-- Botón para regresar a la lista de cupones -->
    <div class="mt-3">
        <a href="/admin/cupones" on:click|preventDefault={() => navigate("/admin/cupones")} class="btn btn-secondary">Volver a la lista de cupones</a>
    </div>
</div>
