<script>

    import { onMount } from 'svelte';
      import { navigate } from 'svelte-routing';
      let Productos = [];
      
      onMount(() => {
        fetchProductos();
      });
    
      const fetchProductos = (map) => {
        fetch(`/productos/list`)
          .then(response => {
            if (!response.ok) {
              throw new Error('Error en la solicitud: ' + response.status);
            }
            return response.json(); // Convertir la respuesta a JSON
          })
          .then(data => {
            Productos = data; // Asignar la respuesta a la variable levels
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
      <h4>Gestión de Productos</h4>
      <a href="/admin/body-part/new" on:click|preventDefault={() => navigate(`/admin/body-part/new`)} class="btn btn-success">Agregar Registro</a>
    </div>
    <!-- Table Element -->
    <div class="card border-0">
      <div class="card-header">
        <h5 class="card-title">
          Productos
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
              <th scope="col">Imagen</th>
              <th scope="col">Acciones</th>
            </tr>
          </thead>
          <tbody>
            {#each Productos as producto}
              <tr>
                <td>{producto.id}</td>
                <td>{producto.nombre}</td>
                <td>
                  <img src="{producto.imagen}" alt="" width="40" height="65">
              </td>
                <td>
                  <a href="/admin/body-part/edit/{producto.id}" on:click|preventDefault={navigate(`/admin/body-part/edit/${producto.id}`)} class="btn btn-danger">Editar</a>
                  <button on:click|preventDefault={deleteBodyPart(producto.id)} class="btn btn-secondary">Eliminar</button>
                </td>
              </tr>
            {/each}
          </tbody>
        </table>
      </div>
    </div>