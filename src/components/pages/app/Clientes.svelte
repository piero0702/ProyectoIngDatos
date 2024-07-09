<script>
  import { onMount } from 'svelte';
  import { navigate } from 'svelte-routing';

  let Clientes = [];

  onMount(() => {
    fetchClientes();
  });

  const fetchClientes = () => {
    fetch(`/clientes/list`)
      .then(response => {
        if (!response.ok) {
          throw new Error('Error en la solicitud: ' + response.status);
        }
        return response.json(); 
      })
      .then(data => {
        Clientes = data; 
      })
      .catch(error => {
        console.error('Error en la solicitud:', error);
      });
  }

  const deleteCliente = (id) => {
    alert(`Eliminar cliente con ID: ${id}`);

  }
</script>

<style>

</style>

<div class="mb-3">
  <h4>Gestión de Clientes</h4>
  <a href="/admin/cliente/nuevo" on:click|preventDefault={() => navigate(`/admin/cliente/nuevo`)} class="btn btn-success">Agregar Cliente</a>
</div>


<div class="card border-0">
  <div class="card-header">
    <h5 class="card-title">Clientes</h5>
  </div>
  <div class="card-body">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Nombre</th>
          <th scope="col">Apellido</th>
          <th scope="col">Email</th>
          <th scope="col">Telefono</th>
          <th scope="col">Nº de Documento</th>
          <th scope="col">Acciones</th>
        </tr>
      </thead>
      <tbody>
        {#each Clientes as cliente}
          <tr>
            <td>{cliente.id}</td>
            <td>{cliente.nombre}</td>
            <td>{cliente.apellido}</td>

            <td>{cliente.nroDocumento}</td>
            <td>{cliente.telefono}</td>
            <td>{cliente.email}</td>
            
            <td>
              <a href="/admin/cliente/editar/{cliente.id}" on:click|preventDefault={() => navigate(`/admin/cliente/editar/${cliente.id}`)} class="btn btn-danger">Editar</a>
              <button on:click|preventDefault={() => deleteCliente(cliente.id)} class="btn btn-secondary">Eliminar</button>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</div>


