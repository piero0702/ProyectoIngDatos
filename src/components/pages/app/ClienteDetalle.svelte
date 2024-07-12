<script>
    import { navigate } from "svelte-routing";
    let nombres = "";
    let apellidos = "";
    let telefono = "";
    let nroDocumento = "";
    let email = "";
    let contrasenia = "";
    let tipoDocumentoId = "";  // Cambio a tipoDocumentoId en lugar de tipoDocumento
    let direccionId = "";  // Cambio a direccionId en lugar de direccionEntrega
    let mensajeExito = "";

    async function grabar() {
        try {
            if (nombres.trim() === "" || apellidos.trim() === "" || telefono.trim() === "" || nroDocumento.trim() === "" || email.trim() === "" || contrasenia.trim() === "" || tipoDocumentoId.trim() === "" || direccionId.trim() === "") {
                throw new Error('Por favor complete todos los campos');
            }

            const datos = { nombres, apellidos, telefono, nroDocumento, email, contrasenia, tipoDocumento_id: tipoDocumentoId, direccion_id: direccionId };
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

            // Mostrar mensaje de éxito
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
        <h4>Nuevo Cliente</h4>
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
                    <label for="tipoDocumentoId">Tipo de Documento ID</label>
                    <input type="text" class="form-control" id="tipoDocumentoId" placeholder="ID del Tipo de Documento" bind:value={tipoDocumentoId}>
                </div>
                <div class="form-group">
                    <label for="direccionId">Dirección ID</label>
                    <input type="text" class="form-control" id="direccionId" placeholder="ID de la Dirección" bind:value={direccionId}>
                </div>
                <button type="submit" class="btn btn-primary">Agregar Cliente</button>
            </form>
        </div>
    </div>

    <!-- Botón para regresar a la lista de clientes -->
    <div class="mt-3">
        <a href="/admin/clientes" on:click|preventDefault={() => navigate("/admin/clientes")} class="btn btn-secondary">Volver a la lista de clientes</a>
    </div>
</div>
