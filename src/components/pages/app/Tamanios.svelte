<script>
    import { onMount } from 'svelte';
    import { navigate } from 'svelte-routing';
  
    let tamanios = [];
  
    onMount(() => {
      fetchTamanios();
    });
  
    const fetchTamanios = () => {
      fetch(`/tamanios/list`)
        .then(response => {
          if (!response.ok) {
            throw new Error('Error en la solicitud: ' + response.status);
          }
          return response.json();
        })
        .then(data => {
          tamanios = data;
        })
        .catch(error => {
          console.error('Error en la solicitud:', error);
        });
    }
  
    const deleteTamano = (id) => {
      alert(id);
    }
  </script>
  
  <style></style>
  
  <div class="mb-3">
    <h4>Gestión de Tamaños</h4>
  </div>
  
  <div class="card border-0">
    <div class="card-header">
      <h5 class="card-title">Tamaños</h5>
    </div>
    <div class="card-body">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Número mL</th>
          </tr>
        </thead>
        <tbody>
          {#each tamanios as tamano}
            <tr>
              <td>{tamano.id}</td>
              <td>{tamano.numeroMl}</td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </div>
  