<script>
    import { navigate } from "svelte-routing";
    let tipoEntrega_id = "";
    let cupon_id = "";
    let cliente_id = "";
    let mensajeExito = "";


    async function grabar() {
        try {
            if (tipoEntrega_id.trim() === "" || cupon_id.trim() === "" || cliente_id.trim() === "") {
                throw new Error('Por favor complete todos los campos');
            }

            const datos = { tipoEntrega_id, cupon_id, cliente_id};
            const opciones = {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(datos)
            };

            const response = await fetch("/pedido/grabar", opciones);
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
            alert("Error al intentar agregar Pedido. Por favor, inténtelo de nuevo.");
        }
    }

    function mostrarMensajeExito() {
        mensajeExito = "Pedido agregado correctamente";
    }
</script>

<div class="container">
    <div class="mb-3">
        <h4>Nuevo Pedido</h4>
    </div>

    <div class="card border-0">
        <div class="card-header">
            <h5 class="card-title">Lista de Pedidos</h5>
            <h6 class="card-subtitle text-muted">Información adicional sobre Pedidos</h6>
        </div>
        <div class="card-body">
            {#if mensajeExito}
                <div class="alert alert-success" role="alert">
                    {mensajeExito}
                </div>
            {/if}

            <form on:submit|preventDefault={grabar}>
                <div class="form-group">
                    <label for="tipoEntrega_id">Tipo de Entrega ID</label>
                    <input type="text" class="form-control" id="tipoEntrega_id" placeholder="ID del tipo de entrega" bind:value={tipoEntrega_id}>
                </div>
                <div class="form-group">
                    <label for="cupon_id">Cupon ID</label>
                    <input type="text" class="form-control" id="cupon_id" placeholder="ID del cupon" bind:value={cupon_id}>
                </div>
                <div class="form-group">
                    <label for="cliente_id">Cliente ID</label>
                    <input type="text" class="form-control" id="cliente_id" placeholder="ID del cliente" bind:value={cliente_id}>
                </div>


                <button type="submit" class="btn btn-primary">Agregar Pedido</button>
            </form>
        </div>
    </div>

    <!-- Botón para regresar a la lista de clientes -->
    <div class="mt-3">
        <a href="/admin/pedidos" on:click|preventDefault={() => navigate("/admin/pedidos")} class="btn btn-secondary">Volver a la lista de pedidos</a>
    </div>
</div>
