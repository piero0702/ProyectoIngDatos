<script>
    import { navigate } from "svelte-routing";
    import { onMount } from "svelte";
    export let pedidoProductosId = 'E';
    let pedidoID = "";
    let productoID = "";
    let tipoProductoID = "";
    let mensajeExito = "";
    let pedidoProductos = [];
    let pedido = [];
    let productos = [];
    let tipoProducto = [];

    onMount(async () => {
        await obtenerPedido();
        await obtenerProductos();
        await obtenerTipoProductos();
        await obtenerPedidosProductosPorId();
    });

    async function obtenerPedido() {
        try {
            const respuesta = await fetch(`/pedidos/list`);
            if (!respuesta.ok) {
                throw new Error("Error en la solicitud: " + respuesta.status);
            }
            pedido = await respuesta.json();
            console.log(pedido);
        } catch (error) {
            console.error("Error en la solicitud:", error);
        }
    }

    async function obtenerProductos() {
        try {
            const respuesta = await fetch(`/productos/list`);
            if (!respuesta.ok) {
                throw new Error("Error en la solicitud: " + respuesta.status);
            }
            productos = await respuesta.json();
            console.log(productos);
        } catch (error) {
            console.error("Error en la solicitud:", error);
        }
    }

    async function obtenerPedidosProductosPorId() {
        try {
            const respuesta = await fetch(`/pedidos_productos/fetch_one?id=${pedidoProductosId}`);
            if (!respuesta.ok) {
                throw new Error("Error en la solicitud: " + respuesta.status);
            }
            pedidoProductos = await respuesta.json();
            pedidoID = pedidoProductos.pedido_id;
            productoID = pedidoProductos.producto_id;
            tipoProductoID = pedidoProductos.tipoProducto_id;
            console.log(pedidoProductos);
        } catch (error) {
            console.error("Error en la solicitud:", error);
        }
    }

    async function obtenerTipoProductos() {
        try {
            const respuesta = await fetch(`/tiposProductos/list`);
            if (!respuesta.ok) {
                throw new Error("Error en la solicitud: " + respuesta.status);
            }
            tipoProducto = await respuesta.json();
            console.log(tipoProducto);
        } catch (error) {
            console.error("Error en la solicitud:", error);
        }
    }

    async function grabar() {
  try {
    // Ensure these values are strings before trimming
    if (String(pedidoID).trim() === "" || String(productoID).trim() === "" || String(tipoProductoID).trim() === "") {
      throw new Error('Por favor complete todos los campos');
    }

    const datos = { 
      pedido_id: pedidoID, 
      producto_id: productoID, 
      tipoProducto_id: tipoProductoID,
      pedidoProductoId: pedidoProductosId // Ensure this is included for updating
    };
    
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
      <h4>{#if pedidoProductosId == 'E'} Crear {:else} Editar {/if} Pedido Producto</h4>
    </div>
  
    <div class="card border-0">
      <div class="card-header">
        <h5 class="card-title">Lista de pedidos de productos </h5>
        <h6 class="card-subtitle text-muted">Información adicional sobre pedidos de productos</h6>
      </div>
      <div class="card-body">
        {#if mensajeExito}
          <div class="alert alert-success" role="alert">
            {mensajeExito}
          </div>
        {/if}
  
        <form on:submit|preventDefault={grabar}>
          <div class="form-group">
            <label for="pedidoID">Pedido</label>
            <select id="pedidoID" class="form-control" bind:value={pedidoID}>
              <option value="">Seleccione un Pedido</option>
              {#each pedido as pedido}
                  <option value={pedido.id}>{pedido.id}</option>
              {/each}
          </select>
          </div>
          <div class="form-group">
            <label for="productoID">Producto</label>
            <select id="productoID" class="form-control" bind:value={productoID}>
              <option value="">Seleccione un Producto</option>
              {#each productos as producto}
                  <option value={producto.id}>{producto.descripcion}</option>
              {/each}
          </select>
          </div>
          <div class="form-group">
            <label for="tipoProductoID">Tipos de producto</label>
            <select id="tipoProductoID" class="form-control" bind:value={tipoProductoID}>
              <option value="">Seleccione un tipos de producto</option>
              {#each tipoProducto as tiposProducto}
                  <option value={tiposProducto.id}>{tiposProducto.nombre}</option>
              {/each}
          </select>
          </div>
          <button type="submit" class="btn btn-primary">Agregar Pedido de Producto</button>
        </form>
      </div>
    </div>
  
    <!-- Botón para regresar a la lista de clientes -->
    <div class="mt-3">
      <a href="/admin/pedidosProductos" on:click|preventDefault={() => navigate("/admin/pedidosProductos")} class="btn btn-secondary">Volver a la lista de pedidos Productos</a>
    </div>
  </div>
  