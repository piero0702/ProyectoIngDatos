<script>
    import { onMount } from "svelte";
    import { navigate } from "svelte-routing";
    export let pedidoId = 'E';
    let tipoEntregaId = "";
    let cuponId = "";
    let clienteId = "";
    let mensajeExito = "";
    let pedido = [];
    let tiposEntrega = [];
    let cupones = [];
    let clientes = [];

    onMount(async () => {
        await obtenertipoEntrega();
        await obtenerCupones();
        await obtenerClientes();
        await obtenerPedidoPorId();
    });

    async function obtenertipoEntrega() {
        try {
            const respuesta = await fetch(`/entrega/list`);
            if (!respuesta.ok) {
                throw new Error("Error en la solicitud: " + respuesta.status);
            }
            tiposEntrega = await respuesta.json();
            console.log(tiposEntrega);
        } catch (error) {
            console.error("Error en la solicitud:", error);
        }
    }

    async function obtenerCupones() {
        try {
            const respuesta = await fetch(`/cupones/list`);
            if (!respuesta.ok) {
                throw new Error("Error en la solicitud: " + respuesta.status);
            }
            cupones = await respuesta.json();
            console.log(cupones);
        } catch (error) {
            console.error("Error en la solicitud:", error);
        }
    }

    async function obtenerClientes() {
        try {
            const respuesta = await fetch(`/clientes/list`);
            if (!respuesta.ok) {
                throw new Error("Error en la solicitud: " + respuesta.status);
            }
            clientes = await respuesta.json();
            console.log(clientes);
        } catch (error) {
            console.error("Error en la solicitud:", error);
        }
    }

    async function obtenerPedidoPorId() {
    try {
        const respuesta = await fetch(`/pedido/fetch-one?id=${pedidoId}`);
        if (!respuesta.ok) {
            throw new Error("Error en la solicitud: " + respuesta.status);
        }
        pedido = await respuesta.json();
        tipoEntregaId = pedido.tipoEntrega_id;
        cuponId = pedido.cupon_id;
        clienteId = pedido.cliente_id;
        console.log(pedido);
    } catch (error) {
        console.error("Error en la solicitud:", error);
    }
}


async function grabar() {
    try {
        if (String(tipoEntregaId).trim() === "" || String(clienteId).trim() === "") {
            throw new Error('Por favor complete todos los campos');
        }

        const datos = {
            tipoEntrega_id: tipoEntregaId,
            cupon_id: cuponId,
            cliente_id: clienteId,
            pedidoId: pedidoId  // Asegúrate de enviar pedidoId
        };
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
        <h4>{#if pedidoId == 'E'} Agregar {:else} Editar {/if} Pedido</h4>
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
                    <label for="tipoEntregaId">Tipo de Entrega</label>
                    <select name="tipoEntrega_id" class="form-control" bind:value={tipoEntregaId}>
                        <option value="">Seleccione un tipo de entrega</option>
                        {#each tiposEntrega as tipo}
                            <option value={tipo.id}>{tipo.nombre}</option>
                        {/each}
                    </select>
                </div>
                <div class="form-group">
                    <label for="cuponId">Cupon</label>
                    <select name="cupon_Id" class="form-control" bind:value={cuponId}>
                        <option value="">Seleccione un cupon</option>
                        {#each cupones as cupon}
                            <option value={cupon.id}>{cupon.codigo}</option>
                        {/each}
                    </select>
                </div>
                <div class="form-group">
                    <label for="clienteId">Cliente</label>
                    <select name="cliente_Id" class="form-control" bind:value={clienteId}>
                        <option value="">Seleccione un cliente</option>
                        {#each clientes as cliente}
                            <option value={cliente.id}>{cliente.nombre}</option>
                        {/each}
                    </select>
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
