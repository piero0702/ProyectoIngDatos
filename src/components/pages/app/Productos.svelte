<script>
  import { onMount } from 'svelte';
  import { navigate } from 'svelte-routing';
  
  let productos = [];
  
  onMount(() => {
    fetchProductos();
  });
  
  const fetchProductos = () => {
    fetch('/productos/list')
      .then(response => {
        if (!response.ok) {
          throw new Error('Error en la solicitud: ' + response.status);
        }
        return response.json();
      })
      .then(data => {
        productos = data;
      })
      .catch(error => {
        console.error('Error en la solicitud:', error);
      });
  };
  
  const deleteProducto = (id) => {
    alert(id);
  };
</script>

<style>
  /* Agrega tu estilo aquí */
</style>

<div class="mb-3">
  <h4>Gestión de Productos</h4>
  <a href="/admin/body-part/new" on:click|preventDefault={() => navigate(`/admin/body-part/new`)} class="btn btn-success">Agregar Registro</a>
</div>

<div class="card border-0">
  <div class="card-header">
    <h5 class="card-title">Productos</h5>
  </div>
  <div class="card-body">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Descripción</th>
          <th scope="col">Cuidados</th>
          <th scope="col">Propiedades</th>
          <th scope="col">Stock</th>
          <th scope="col">Tipo de botella ID</th>
          <th scope="col">Color ID</th>
          <th scope="col">Tamaño ID</th>
          <th scope="col">Imagen</th>
          <th scope="col">Precio</th>
          <th scope="col">Acciones</th>
        </tr>
      </thead>
      <tbody>
        {#each productos as producto}
          <tr>
            <td>{producto.id}</td>
            <td>{producto.descripcion}</td>
            <td>{producto.cuidados}</td>
            <td>{producto.propiedades}</td>
            <td>{producto.stock}</td>
            <td>{producto.tipo_id}</td>
            <td>{producto.color_id}</td>
            <td>{producto.tamano_id}</td>
            <td>
              <img src="{producto.imagen}" alt="Imagen de producto" width="40" height="65">
            </td>
            <td>{producto.precio}</td>
            <td>
              <a href="/admin/body-part/edit/{producto.id}" on:click|preventDefault={() => navigate(`/admin/body-part/edit/${producto.id}`)} class="btn btn-danger">Editar</a>
              <button on:click|preventDefault={() => deleteProducto(producto.id)} class="btn btn-secondary">Eliminar</button>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</div>
