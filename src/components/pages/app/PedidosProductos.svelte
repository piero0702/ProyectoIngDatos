<script>
  import { onMount } from 'svelte';
  import { navigate } from 'svelte-routing';

  let PedidosProductos = [];

  onMount(() => {
    fetchPedidosProductos();
  });

  const fetchPedidosProductos = () => {
    fetch('/pedidos_productos/list')
      .then(response => {
        if (!response.ok) {
          throw new Error('Error en la solicitud: ' + response.status);
        }
        return response.json(); // Convertir la respuesta a JSON
      })
      .then(data => {
        PedidosProductos = data; // Asignar la respuesta a la variable PedidosProductos
      })
      .catch(error => {
        console.error('Error en la solicitud:', error);
      });
  }

  const deletepedidoProducto = (id) => {
    if (confirm("¿Estás seguro de que quieres eliminar este pedidoProducto?")) {
      fetch("/pedidoProducto/eliminar", {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ id })
      })
      .then(response => {
        if (!response.ok) {
          return response.json().then(data => { throw new Error(data.error || "Error al eliminar el pedidoProducto"); });
        }
        return response.json();
      })
      .then(data => {
        // Actualizar pedidoProductos después de eliminar el pedidoProducto
        PedidosProductos = PedidosProductos.filter(pedidoProducto => pedidoProducto.id !== id);
        console.log(data.mensaje);
      })
      .catch(error => {
        console.error("Error al eliminar el pedidoProducto:", error);
        alert(error.message || "Error al eliminar el pedidoProducto. Por favor, inténtelo de nuevo.");
      });
    }
  }

  const agregarpedidoProducto = async (datospedidoProducto) => {
    try {
      const opciones = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(datospedidoProducto)
      };

      const response = await fetch("/pedidoProducto/grabar", opciones);
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error("Error en la solicitud: " + errorData.error);
      }

      // Actualizar la lista de pedidoProductos después de agregar uno nuevos
      fetchPedidosProductos();

      console.log("pedidoProducto agregado correctamente");

    } catch (error) {
      console.error("Error al agregar el pedidoProducto:", error);
      alert("Error al intentar agregar pedidoProducto. Por favor, inténtelo de nuevo.");
    }
  }
</script>

<div class="mb-3">
  <h4>Gestión de Pedidos de Productos</h4>
  <a href="/admin/pedidosproductos/nuevo" on:click|preventDefault={() => navigate(`/admin/pedidosproductos/nuevo`)} class="btn btn-success">Agregar Producto de Pedido</a>
</div>

<div class="card border-0">
  <div class="card-header">
    <h5 class="card-title">Pedidos de Productos</h5>
  </div>
  <div class="card-body">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Pedido ID</th>
          <th scope="col">Producto</th>
          <th scope="col">Tipo de Producto</th>
          <th scope="col">Acciones</th>
        </tr>
      </thead>
      <tbody>
        {#each PedidosProductos as pedidoProducto}
          <tr>
            <td>{pedidoProducto.id}</td>
            <td>{pedidoProducto.pedido_id}</td>
            <td>{pedidoProducto.producto_id}</td>
            <td>{pedidoProducto.tipoProducto_id}</td>
            <td>
              <a href="/admin/pedidosProductos/editar/{pedidoProducto.id}" on:click|preventDefault={() => navigate(`/admin/pedidosProductos/editar/${pedidoProducto.id}`)} class="btn btn-danger">Editar</a>
              <button on:click|preventDefault={() => deletepedidoProducto(pedidoProducto.id)} class="btn btn-secondary">Eliminar</button>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</div>
