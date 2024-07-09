<script>
  import { onMount } from 'svelte';
  import { navigate } from 'svelte-routing';

  let Pedidos = [];

  onMount(() => {
    fetchPedidos();
  });

  const fetchPedidos = () => {
    fetch(`/pedidos/list`)
      .then(response => {
        if (!response.ok) {
          throw new Error('Error en la solicitud: ' + response.status);
        }
        return response.json(); 
      })
      .then(data => {
        Pedidos = data;
      })
      .catch(error => {
        console.error('Error en la solicitud:', error);
      });
  }

  const deletePedido = (pedido_id) => {
    alert(`Eliminar pedido con ID: ${pedido_id}`);
  }
</script>

<style>
</style>

<div class="mb-3">
  <h4>Gestión de Pedidos</h4>

  <a href="/admin/pedido/nuevo" on:click|preventDefault={() => navigate(`/admin/pedido/nuevo`)} class="btn btn-success">Agregar Pedido</a>
</div>


<div class="card border-0">
  <div class="card-header">
    <h5 class="card-title">Pedidos</h5>
  </div>
  <div class="card-body">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID Pedido</th>
          <th scope="col">Cliente</th>
          <th scope="col">Pedido</th>
          <th scope="col">Importe Total</th>
          <th scope="col">Observaciones</th>
          <th scope="col">Acciones</th>
        </tr>
      </thead>
      <tbody>
        {#each Pedidos as pedido}
          <tr>
            <td>{pedido.pedido_id}</td>
            <td>{pedido.cliente}</td>
            <td>{pedido.pedido}</td>
            <td>{pedido.importeTotal}</td>
            <td>{pedido.observaciones}</td>
            <td>

              <a href="/admin/pedido/editar/{pedido.pedido_id}" on:click|preventDefault={() => navigate(`/admin/pedido/editar/${pedido.pedido_id}`)} class="btn btn-danger">Editar</a>
              <button on:click|preventDefault={() => deletePedido(pedido.pedido_id)} class="btn btn-secondary">Eliminar</button>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</div>
