<script>
    import { onMount } from 'svelte';
    import { navigate } from 'svelte-routing';
  
    let Direcciones = [];
  
    onMount(() => {
      fetchDirecciones();
    });
  
    const fetchDirecciones = () => {
      fetch('/direcciones/list')
        .then(response => {
          if (!response.ok) {
            throw new Error('Error en la solicitud: ' + response.status);
          }
          return response.json(); // Convertir la respuesta a JSON
        })
        .then(data => {
          Direcciones = data; // Asignar la respuesta a la variable Direcciones
        })
        .catch(error => {
          console.error('Error en la solicitud:', error);
        });
    }
  
    const deleteDireccion = (id) => {
      if (confirm(`¿Estás seguro de eliminar la dirección con ID ${id}?`)) {
        fetch(`/direccion/delete/${id}`, {
          method: 'DELETE'
        })
        .then(response => {
          if (!response.ok) {
            throw new Error('Error en la eliminación: ' + response.status);
          }
          alert('Dirección eliminada correctamente.');
          // Actualizar la lista de direcciones después de la eliminación
          fetchDirecciones();
        })
        .catch(error => {
          console.error('Error al eliminar la dirección:', error);
          alert('Hubo un error al eliminar la dirección.');
        });
      }
    }
  </script>
  
  <style>
    /* Estilos opcionales para personalizar la apariencia */
  </style>
  
  <div class="mb-3">
    <h4>Gestión de Direcciones</h4>
    <a href="/admin/direccion/new" on:click|preventDefault={() => navigate(`/admin/direccion/new`)} class="btn btn-success">Agregar Dirección</a>
  </div>
  
  <!-- Table Element -->
  <div class="card border-0">
    <div class="card-header">
      <h5 class="card-title">Direcciones</h5>
    </div>
    <div class="card-body">
      <table class="table">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Dirección</th>
            <th scope="col">Código Postal</th>
            <th scope="col">Distrito</th>
          </tr>
        </thead>
        <tbody>
          {#each Direcciones as direccion}
            <tr>
              <td>{direccion.id}</td>
              <td>{direccion.direccionEntrega}</td>
              <td>{direccion.codigoPostal}</td>
              <td>{direccion.distrito_id}</td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </div>
  