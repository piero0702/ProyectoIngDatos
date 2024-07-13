<script>
    import { onMount } from 'svelte';
    import { navigate } from 'svelte-routing';
  
    let PedidosProductos = [];
  
    onMount(() => {
      fetchMostrarPedidosProductos();
    });
  
    const fetchMostrarPedidosProductos = () => {
      fetch('/mostrar_pedidos_productos/list')
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
  
  <div class="mb-3">
    <h4>Mostrar Lista de Productos de Pedidos</h4>

  </div>
  
  <div class="card border-0">
    <div class="card-header">
      <h5 class="card-title">Productos de Pedidos</h5>
    </div>
    <div class="card-body">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Nombre Cliente - Cupon</th>
            <th scope="col">Producto </th>
            <th scope="col">Tipo de Entrega</th>
          </tr>
        </thead>
        <tbody>
          {#each PedidosProductos as pedidoProducto}
            <tr>
              <td>{pedidoProducto.id}</td>
              <td>{pedidoProducto.pedido_id}</td>
              <td>{pedidoProducto.producto_id}</td>
              <td>{pedidoProducto.tipoProducto_id}</td>
          {/each}
        </tbody>
      </table>
    </div>
  </div>
  