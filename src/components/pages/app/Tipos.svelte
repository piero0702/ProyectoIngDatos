<script>

    import { onMount } from 'svelte';
      import { navigate } from 'svelte-routing';
      let bodyParts = [];
      
      onMount(() => {
        fetchBodyParts();
      });
    
      const fetchBodyParts = (map) => {
        fetch(`/tipos/list`)
          .then(response => {
            if (!response.ok) {
              throw new Error('Error en la solicitud: ' + response.status);
            }
            return response.json(); // Convertir la respuesta a JSON
          })
          .then(data => {
            bodyParts = data; // Asignar la respuesta a la variable levels
          })
          .catch(error => {
            console.error('Error en la solicitud:', error);
          });
      }
    
      const deleteBodyPart = (id) => {
        alert(id);
      }
    </script>
    
    <style></style>
    
    <div class="mb-3">
      <h4>Gestión de Tipos de Producto</h4>
    </div>
    <!-- Table Element -->
    <div class="card border-0">
      <div class="card-header">
        <h5 class="card-title">
            Tipos de Productos
        </h5>
        <h6 class="card-subtitle text-muted">
        </h6>
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
            {#each bodyParts as bpart}
              <tr>
                <td>{bpart.id}</td>
                <td>{bpart.nombres}</td>

              </tr>
            {/each}
          </tbody>
        </table>
      </div>
    </div>