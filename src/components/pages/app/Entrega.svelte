<script>
    import { onMount } from 'svelte';
    import { navigate } from 'svelte-routing';
  
    let tiposEntrega = []; // Inicializa tiposEntrega como un arreglo vacío
  
    onMount(() => {
      fetchTiposEntrega();
    });
  
    const fetchTiposEntrega = () => {
      fetch(`/entrega/list`)
        .then(response => {
          if (!response.ok) {
            throw new Error('Error en la solicitud: ' + response.status);
          }
          return response.json(); // Convertir la respuesta a JSON
        })
        .then(data => {
          tiposEntrega = data; // Asignar la respuesta a tiposEntrega
        })
        .catch(error => {
          console.error('Error en la solicitud:', error);
        });
    }
  
    const deleteTipoEntrega = (id) => {
      alert(id);
    }
  </script>
  
  <style></style>
  
  <div class="mb-3">
    <h4>Gestión de Tipos de Entrega</h4>
  </div>
  
  <!-- Table Element -->
  <div class="card border-0">
    <div class="card-header">
      <h5 class="card-title">Tipos de Entrega</h5>
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
          {#each tiposEntrega as tipoEntrega}
            <tr>
              <td>{tipoEntrega.id}</td>
              <td>{tipoEntrega.nombre}</td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </div>
  