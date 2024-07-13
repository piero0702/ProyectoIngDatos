<script>
    import { navigate } from "svelte-routing";
    let pedidoID = "";
    let productoID = "";
    let tipoProductoID = "";
    let mensajeExito = "";
  
    async function grabar() {
      try {
        if (pedidoID.trim() === "" || productoID.trim() === "" || tipoProductoID.trim() === "" ) {
          throw new Error('Por favor complete todos los campos');
        }
  
        const datos = { pedido_id: pedidoID, producto_id: productoID , tipoProducto_id: tipoProductoID };
        const opciones = {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(datos)
        };
  
        const response = await fetch("/pedidoProducto/grabar", opciones);
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
        alert("Error al intentar agregar pedidoProducto. Por favor, inténtelo de nuevo.");
      }
    }
  
    function mostrarMensajeExito() {
      mensajeExito = "pedidoProducto agregado correctamente";
    }
  </script>
  
  <div class="container">
    <div class="mb-3">
      <h4>Nuevo pedido Producto</h4>
    </div>
  
    <div class="card border-0">
      <div class="card-header">
        <h5 class="card-title">Lista de pedido Productos</h5>
        <h6 class="card-subtitle text-muted">Información adicional sobre pedido Productos</h6>
      </div>
      <div class="card-body">
        {#if mensajeExito}
          <div class="alert alert-success" role="alert">
            {mensajeExito}
          </div>
        {/if}
  
        <form on:submit|preventDefault={grabar}>
          <div class="form-group">
            <label for="pedidoID">pedidoID</label>
            <input type="text" class="form-control" id="pedidoID" placeholder="pedidoID" bind:value={pedidoID}>
          </div>
          <div class="form-group">
            <label for="productoID">productoID</label>
            <input type="text" class="form-control" id="productoID" placeholder="productoID" bind:value={productoID}>
          </div>
          <div class="form-group">
            <label for="tipoProductoID">tipoProductoID</label>
            <input type="text" class="form-control" id="tipoProductoID" placeholder="tipoProductoID" bind:value={tipoProductoID}>
          </div>
          <button type="submit" class="btn btn-primary">Agregar Producto Pedido</button>
        </form>
      </div>
    </div>
  
    <!-- Botón para regresar a la lista de clientes -->
    <div class="mt-3">
      <a href="/admin/pedidosProductos" on:click|preventDefault={() => navigate("/admin/pedidosProductos")} class="btn btn-secondary">Volver a la lista de pedidos Productos</a>
    </div>
  </div>
  