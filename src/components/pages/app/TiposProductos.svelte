<script>
    import { onMount } from 'svelte';
    import { navigate } from 'svelte-routing';
  
    let tiposProductos = []; // Inicializa tiposProductos como un arreglo vacío
  
    onMount(() => {
      fetchTiposProductos();
    });
  
    const fetchTiposProductos = () => {
      fetch(`/tiposProductos/list`)
        .then(response => {
          if (!response.ok) {
            throw new Error('Error en la solicitud: ' + response.status);
          }
          return response.json(); // Convertir la respuesta a JSON
        })
        .then(data => {
          tiposProductos = data; // Asignar la respuesta a tiposProductos
        })
        .catch(error => {
          console.error('Error en la solicitud:', error);
        });
    }
  
    const deleteTipoProducto = (id) => {
      alert(id);
    }
  </script>
  
  <style></style>
  
  <div class="mb-3">
    <h4>Gestión de Añadidos</h4>
  </div>
  
  <!-- Table Element -->
  <div class="card border-0">
    <div class="card-header">
      <h5 class="card-title">Tipos de Añadidos</h5>
    </div>
    <div class="card-body">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">id</th>
            <th scope="col">Nombre</th>
          </tr>
        </thead>
        <tbody>
          {#each tiposProductos as tipoProducto}
            <tr>
              <td>{tipoProducto.id}</td>
              <td>{tipoProducto.nombre}</td>

            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </div>
  