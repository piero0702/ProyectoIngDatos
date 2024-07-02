<script>

  import { onMount } from 'svelte';
    import { navigate } from 'svelte-routing';
    let countries = [];
    
    onMount(() => {
      fetchCountries();
    });
  
    const fetchCountries = (map) => {
      fetch(`/country/list`)
        .then(response => {
          if (!response.ok) {
            throw new Error('Error en la solicitud: ' + response.status);
          }
          return response.json(); // Convertir la respuesta a JSON
        })
        .then(data => {
          countries = data; // Asignar la respuesta a la variable levels
        })
        .catch(error => {
          console.error('Error en la solicitud:', error);
        });
    }
  
    const deleteCountry = (id) => {
      alert(id);
    }
  </script>
  
  <style></style>
  
  <div class="mb-3">
    <h4>Gestión de Paises</h4>
    <a href="/admin/country/new" on:click|preventDefault={() => navigate(`/admin/country/new`)} class="btn btn-success">Agregar Registro</a>
  </div>
  <!-- Table Element -->
  <div class="card border-0">
    <div class="card-header">
      <h5 class="card-title">
          Paises de los Paises
      </h5>
      <h6 class="card-subtitle text-muted">
      </h6>
    </div>
    <div class="card-body">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">id</th>
            <th scope="col">Eombre</th>
            <th scope="col">Gentilicio</th>
            <th scope="col">Bandera</th>
            <th scope="col">Acciones</th>
          </tr>
        </thead>
        <tbody>
          {#each countries as country}
            <tr>
              <td>{country.id}</td>
              <td>{country.nombre}</td>
              <td>{country.gentilicio}</td>
              <td>
                <img src="/{country.bandera}" alt="{country.nombre} {country.gentilicio}" width="40" height="30">
              </td>
              <td>
                <a href="/admin/country/edit/{country.id}" on:click|preventDefault={navigate(`/admin/country/edit/${country.id}`)} class="btn btn-danger">Editar</a>
                <button on:click|preventDefault={deleteCountry(country.id)} class="btn btn-secondary">Eliminar</button>
              </td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </div>