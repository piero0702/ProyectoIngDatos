<script>

  import { onMount } from 'svelte';
    import { navigate } from 'svelte-routing';
    let members = [];
    
    onMount(() => {
      fetchMembers();
    });
  
    const fetchMembers = (map) => {
      fetch(`/member/list`)
        .then(response => {
          if (!response.ok) {
            throw new Error('Error en la solicitud: ' + response.status);
          }
          return response.json(); // Convertir la respuesta a JSON
        })
        .then(data => {
          members = data; // Asignar la respuesta a la variable levels
        })
        .catch(error => {
          console.error('Error en la solicitud:', error);
        });
    }
  
    const deleteMember = (id) => {
      alert(id);
    }
  </script>
  
  <style></style>
  
  <div class="mb-3">
    <h4>Gestión de Miembros</h4>
    <a href="/admin/member/new" on:click|preventDefault={() => navigate(`/admin/member/new`)} class="btn btn-success">Agregar Registro</a>
  </div>
  <!-- Table Element -->
  <div class="card border-0">
    <div class="card-header">
      <h5 class="card-title">
          Miembros de los Miembros
      </h5>
      <h6 class="card-subtitle text-muted">
      </h6>
    </div>
    <div class="card-body">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">Código</th>
            <th scope="col">Nombres</th>
            <th scope="col">Apellidos</th>
            <th scope="col">Imagen</th>
            <th scope="col">Acciones</th>
          </tr>
        </thead>
        <tbody>
          {#each members as member}
            <tr>
              <td>{member.code}</td>
              <td>{member.names}</td>
              <td>{member.last_names}</td>
              <td>
                <img src="/{member.image_url}" alt="{member.last_names} {member.names}" width="50" height="50">
              </td>
              <td>
                <a href="/admin/member/edit/{member.id}" on:click|preventDefault={navigate(`/admin/member/edit/${member.id}`)} class="btn btn-danger">Editar</a>
                <button on:click|preventDefault={deleteMember(member.id)} class="btn btn-secondary">Eliminar</button>
              </td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </div>