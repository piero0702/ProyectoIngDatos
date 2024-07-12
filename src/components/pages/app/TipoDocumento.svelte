<script>
    import { onMount } from 'svelte';
    import { navigate } from 'svelte-routing';
  
    let Documentos = []; // Inicializa Documentos como un arreglo vacío
  
    onMount(() => {
      fetchDocumento();
    });
  
    const fetchDocumento = () => {
      fetch(`/documento/list`)
        .then(response => {
          if (!response.ok) {
            throw new Error('Error en la solicitud: ' + response.status);
          }
          return response.json(); // Convertir la respuesta a JSON
        })
        .then(data => {
          Documentos = data; // Asignar la respuesta a Documentos
        })
        .catch(error => {
          console.error('Error en la solicitud:', error);
        });
    }
  
    const deleteDocumento = (id) => {
      alert(id);
    }
  </script>
  
  <style></style>
  
  <div class="mb-3">
    <h4>Gestión de Documentos</h4>
  </div>
  
  <!-- Table Element -->
  <div class="card border-0">
    <div class="card-header">
      <h5 class="card-title">Documentos</h5>
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
          {#each Documentos as Documento}
            <tr>
              <td>{Documento.id}</td>
              <td>{Documento.nombre}</td>

            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </div>
  