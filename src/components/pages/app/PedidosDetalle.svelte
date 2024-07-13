<script>
    import { navigate } from "svelte-routing";
    let tipoEntregaId = "";
    let cuponId = "";
    let clienteId = "";
    let mensajeExito = "";


    async function grabar() {
        try {
            if (tipoEntregaId.trim() === "" || cuponId.trim() === "" || clienteId.trim() === "") {
                throw new Error('Por favor complete todos los campos');
            }

            const datos = { tipoEntrega_id: tipoEntregaId, cupon_id: cuponId, cliente_id: clienteId};
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

            // Mostrar mensaje de éxitos
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
                    <label for="tipoEntregaId">Tipo de Entrega ID</label>
                    <input type="text" class="form-control" id="tipoEntregaId" placeholder="ID del tipo de entrega" bind:value={tipoEntregaId}>
                </div>
                <div class="form-group">
                    <label for="cuponId">Cupon ID</label>
                    <input type="text" class="form-control" id="cuponId" placeholder="ID del cupon" bind:value={cuponId}>
                </div>
                <div class="form-group">
                    <label for="clienteId">Cliente ID</label>
                    <input type="text" class="form-control" id="clienteId" placeholder="ID del cliente" bind:value={clienteId}>
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
