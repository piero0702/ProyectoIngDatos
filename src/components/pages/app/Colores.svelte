<script>
    import { onMount } from 'svelte';
    import { navigate } from 'svelte-routing';
  
    let colores = [];
  
    onMount(() => {
      fetchColores();
    });
  
    const fetchColores = () => {
      fetch(`/colores/list`)
        .then(response => {
          if (!response.ok) {
            throw new Error('Error en la solicitud: ' + response.status);
          }
          return response.json();
        })
        .then(data => {
          colores = data;
        })
        .catch(error => {
          console.error('Error en la solicitud:', error);
        });
    }
  
    const deleteColor = (id) => {
      alert(id);
    }
  </script>
  
  <style></style>
  
  <div class="mb-3">
    <h4>Gestión de Colores</h4>
  </div>
  
  <div class="card border-0">
    <div class="card-header">
      <h5 class="card-title">Colores</h5>
    </div>
    <div class="card-body">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Nombre</th>
          </tr>
        </thead>
        <tbody>
          {#each colores as color}
            <tr>
              <td>{color.id}</td>
              <td>{color.nombre}</td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </div>
  