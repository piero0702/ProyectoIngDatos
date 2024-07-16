<script>
    import { onMount } from "svelte";
    import { navigate } from "svelte-routing";
    export let clienteId = 'E';
    let nombres = "";
    let apellidos = "";
    let telefono = "";
    let nroDocumento = "";
    let email = "";
    let contrasenia = "";
    let tipoDocumento_id = "";
    let direccion_id = "";
    let mensajeExito = "";
    let cliente = [];
    let tiposDeDocumento = [];
    let direcciones = []

    onMount(async () => {
        await obtenerClientePorId();
        await obtenerDocumentos();
        await obtenerDirecciones();
    });

    async function obtenerDirecciones() {
        try {
            const respuesta = await fetch(`/direcciones/list`);
            if (!respuesta.ok) {
                throw new Error("Error en la solicitud: " + respuesta.status);
            }
            direcciones = await respuesta.json();
            console.log(direcciones);
        } catch (error) {
            console.error("Error en la solicitud:", error);
        }
    }

    async function obtenerDocumentos() {
        try {
            const respuesta = await fetch(`/tiposDocumento/list`);
            if (!respuesta.ok) {
                throw new Error("Error en la solicitud: " + respuesta.status);
            }
            tiposDeDocumento = await respuesta.json();
            console.log(tiposDeDocumento);
        } catch (error) {
            console.error("Error en la solicitud:", error);
        }
    }

    async function obtenerClientePorId() {
        try {
            const respuesta = await fetch(`/cliente/fetch-one?id=${clienteId}`);
            if (!respuesta.ok) {
                throw new Error("Error en la solicitud: " + respuesta.status);
            }
            cliente = await respuesta.json();
            nombres = cliente.nombres;
            apellidos = cliente.apellidos;
            telefono = cliente.telefono;
            nroDocumento = cliente.nroDocumento;
            email = cliente.email;
            contrasenia = cliente.contrasenia;
            tipoDocumento_id = cliente.tipoDocumento_id;
            direccion_id = cliente.direccion_id;
            console.log(cliente);
        } catch (error) {
            console.error("Error en la solicitud:", error);
        }
    }

    async function grabar() {
        try {
            if (nombres.trim() === "" || apellidos.trim() === "" || telefono.trim() === "" || nroDocumento.trim() === "" || email.trim() === "" || contrasenia.trim() === "") {
                throw new Error('Por favor complete todos los campos');
            }

            const datos = { clienteId, nombres, apellidos, telefono, nroDocumento, email, contrasenia, tipoDocumento_id, direccion_id };
            const opciones = {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(datos)
            };

            const response = await fetch("/cliente/grabar", opciones);
            if (!response.ok) {
                const errorData = await response.json();
                throw new Error("Error en la solicitud: " + errorData.error);
            }

            const data = await response.json();
            console.log("Respuesta del servidor:", data);

            mostrarMensajeExito();

        } catch (error) {
            console.error("Error en la solicitud:", error);
            alert("Error al intentar agregar cliente. Por favor, inténtelo de nuevo.");
        }
    }

    function mostrarMensajeExito() {
        mensajeExito = "Cliente agregado correctamente";
    }
</script>

<div class="container">
    <div class="mb-3">
        <h4>{#if clienteId == 'E'} Crear {:else} Editar {/if} Cliente</h4>
    </div>

    <div class="card border-0">
        <div class="card-header">
            <h5 class="card-title">Lista de Clientes</h5>
            <h6 class="card-subtitle text-muted">Información adicional sobre clientes</h6>
        </div>
        <div class="card-body">
            {#if mensajeExito}
                <div class="alert alert-success" role="alert">
                    {mensajeExito}
                </div>
            {/if}

            <form on:submit|preventDefault={grabar}>
                <div class="form-group">
                    <label for="nombres">Nombres</label>
                    <input type="text" class="form-control" id="nombres" placeholder="Nombres del cliente" bind:value={nombres}>
                </div>
                <div class="form-group">
                    <label for="apellidos">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos" placeholder="Apellidos del cliente" bind:value={apellidos}>
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono</label>
                    <input type="text" class="form-control" id="telefono" placeholder="Teléfono del cliente" bind:value={telefono}>
                </div>
                <div class="form-group">
                    <label for="nroDocumento">Número de Documento</label>
                    <input type="text" class="form-control" id="nroDocumento" placeholder="Número de Documento del cliente" bind:value={nroDocumento}>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Email del cliente" bind:value={email}>
                </div>
                <div class="form-group">
                    <label for="contrasenia">Contraseña</label>
                    <input type="password" class="form-control" id="contrasenia" placeholder="Contraseña del cliente" bind:value={contrasenia}>
                </div>
                <div class="form-group">
                    <label for="tipoDocumento_id">Tipo de Documento</label>
                    <select id="tipoDocumento_id" class="form-control" bind:value={tipoDocumento_id}>
                        <option value="">Seleccione un tipo de documento</option>
                        {#each tiposDeDocumento as tipo}
                            <option value={tipo.id}>{tipo.nombre}</option>
                        {/each}
                    </select>
                </div>
                <div class="form-group">
                    <label for="direccion_id">Direccion</label>
                    <select id="direccion_id" class="form-control" bind:value={direccion_id}>
                        <option value="">Seleccione una dirección</option>
                        {#each direcciones as tipo}
                            <option value={tipo.id}>{tipo.direccionEntrega}</option>
                        {/each}
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">{#if clienteId == 'E'} Crear {:else} Editar {/if} Cliente</button>
            </form>
        </div>
    </div>

    <div class="mt-3">
        <a href="/admin/clientes" on:click|preventDefault={() => navigate("/admin/clientes")} class="btn btn-secondary">Volver a la lista de clientes</a>
    </div>
</div>
