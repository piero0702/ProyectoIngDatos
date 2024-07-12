<script>
    import { onMount } from 'svelte';
    import { navigate } from 'svelte-routing';
  
    let distritos = [];
  
    onMount(() => {
      fetchDistritos();
    });
  
    const fetchDistritos = () => {
      fetch(`/distritos/list`)
        .then(response => {
          if (!response.ok) {
            throw new Error('Error en la solicitud: ' + response.status);
          }
          return response.json();
        })
        .then(data => {
          distritos = data;
        })
        .catch(error => {
          console.error('Error en la solicitud:', error);
        });
    }
  
    const deleteDistrito = (id) => {
      alert(id);
    }
  </script>
  
  <style></style>
  
  <div class="mb-3">
    <h4>Gestión de Distritos</h4>
  </div>
  
  <div class="card border-0">
    <div class="card-header">
      <h5 class="card-title">Distritos</h5>
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
          {#each distritos as distrito}
            <tr>
              <td>{distrito.id}</td>
              <td>{distrito.nombre}</td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </div>
  