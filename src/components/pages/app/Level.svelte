<script>

import { onMount } from 'svelte';
  import { navigate } from 'svelte-routing';
  let levels = [];
  
  onMount(() => {
    fetchLevels();
  });

  const fetchLevels = (map) => {
    fetch(`/level/list`)
      .then(response => {
        if (!response.ok) {
          throw new Error('Error en la solicitud: ' + response.status);
        }
        return response.json(); // Convertir la respuesta a JSON
      })
      .then(data => {
        levels = data; // Asignar la respuesta a la variable levels
      })
      .catch(error => {
        console.error('Error en la solicitud:', error);
      });
  }

  const deleteLevel = (id) => {
    alert(id);
  }
</script>

<style></style>

<div class="mb-3">
  <h4>Gestión de Niveles</h4>
  <a href="/admin/level/new" on:click|preventDefault={() => navigate(`/admin/level/new`)} class="btn btn-success">Agregar Registro</a>
</div>
<!-- Table Element -->
<div class="card border-0">
  <div class="card-header">
    <h5 class="card-title">
        Niveles de las rutinas
    </h5>
    <h6 class="card-subtitle text-muted">
    </h6>
  </div>
  <div class="card-body">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Nombre</th>
          <th scope="col">Apellidos</th>
          <th scope="col">Usuario</th>
          <th scope="col">Contraseña</th>
          <th scope="col">Imagen</th>
          <th scope="col">Acciones</th>
        </tr>
      </thead>
      <tbody>
        {#each levels as level}
          <tr>
            <td>{level.nombres}</td>
            <td>{level.apellidos}</td>
            <td>{level.usuario}</td>
            <td>{level.contrasenia}</td>
            <img src="/{level.imagen_url}" alt="">
            <td>
              <a href="/admin/level/edit/{level.id}" on:click|preventDefault={navigate(`/admin/level/edit/${level.id}`)} class="btn btn-danger">Editar</a>
              <button on:click|preventDefault={deleteLevel(level.id)} class="btn btn-secondary">Eliminar</button>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</div>