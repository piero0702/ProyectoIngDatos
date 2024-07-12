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
</script>

<style>
  /* Estilos opcionales para personalizar la apariencia */
</style>

<div class="mb-3">
  <h4>Gestión de Productos de Pedidos</h4>
  <a href="/admin/pedidosproductos/new" on:click|preventDefault={() => navigate(`/admin/pedidosproductos/new`)} class="btn btn-success">Agregar Producto de Pedido</a>
</div>

<!-- Table Element -->
<div class="card border-0">
  <div class="card-header">
    <h5 class="card-title">Productos de Pedidos</h5>
  </div>
  <div class="card-body">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Pedido ID</th>
          <th scope="col">Producto ID</th>
          <th scope="col">Tipo de Producto ID</th>
        </tr>
      </thead>
      <tbody>
        {#each PedidosProductos as pedidoProducto}
          <tr>
            <td>{pedidoProducto.id}</td>
            <td>{pedidoProducto.pedido_id}</td>
            <td>{pedidoProducto.producto_id}</td>
            <td>{pedidoProducto.tipoProducto_id}</td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</div>
