<script>
  import { onMount } from 'svelte';
  
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
    if (confirm("¿Estás seguro de que quieres eliminar este producto?")) {
      fetch("/producto/eliminar", {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ id })
      })
      .then(response => {
        if (!response.ok) {
          return response.json().then(data => { throw new Error(data.error || "Error al eliminar el producto"); });
        }
        return response.json();
      })
      .then(data => {
        // Actualizar productos después de eliminar el producto
        productos = productos.filter(producto => producto.id !== id);
        console.log(data.mensaje);
      })
      .catch(error => {
        console.error("Error al eliminar el producto:", error);
        alert(error.message || "Error al eliminar el producto. Por favor, inténtelo de nuevo.");
      });
    }
  }
</script>

<style>
  /* Agrega tu estilo aquí */
</style>

<div class="mb-3">
  <h4>Gestión de Productos</h4>
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
          <th scope="col">Tipo de botella</th>
          <th scope="col">Color</th>
          <th scope="col">Tamaño</th>
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
              <button on:click|preventDefault={() => deleteProducto(producto.id)} class="btn btn-secondary">Eliminar</button>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</div>
