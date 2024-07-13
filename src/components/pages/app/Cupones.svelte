<script>
  import { onMount } from 'svelte';
  import { navigate } from 'svelte-routing';

  let cupones = [];

  onMount(() => {
    fetchCupones();
  });

  const fetchCupones = () => {
    fetch(`/cupones/list`)
      .then(response => {
        if (!response.ok) {
          throw new Error('Error en la solicitud: ' + response.status);
        }
        return response.json();
      })
      .then(data => {
        cupones = data;
      })
      .catch(error => {
        console.error('Error en la solicitud:', error);
      });
  };

  const deleteCupon = (id) => {
    if (confirm("¿Estás seguro de que quieres eliminar este cupón?")) {
      fetch("/cupon/eliminar", {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ id })
      })
      .then(response => {
        if (!response.ok) {
          return response.json().then(data => { throw new Error(data.error || "Error al eliminar el cupón"); });
        }
        return response.json();
      })
      .then(data => {
        // Actualizar la lista de cupones después de eliminar
        cupones = cupones.filter(cupon => cupon.id !== id);
        console.log(data.mensaje);
      })
      .catch(error => {
        console.error("Error al eliminar el cupón:", error);
        alert(error.message || "Error al eliminar el cupón. Por favor, inténtelo de nuevo.");
      });
    }
  };

  // Función para agregar un nuevo cupón
  const agregarCupon = async (datosCupon) => {
    try {
      const opciones = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(datosCupon)
      };

      const response = await fetch("/cupon/grabar", opciones);
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error("Error en la solicitud: " + errorData.error);
      }

      // Actualizar la lista de cupones después de agregar uno nuevo
      fetchCupones();

      // Mostrar mensaje de éxito o hacer cualquier otra acción necesaria
      console.log("Cupón agregado correctamente");

    } catch (error) {
      console.error("Error al agregar el cupón:", error);
      alert("Error al intentar agregar cupón. Por favor, inténtelo de nuevo.");
    }
  };

</script>

<style></style>

<div class="mb-3">
  <h4>Gestión de Cupones</h4>
  <a href="/admin/cupon/nuevo" on:click|preventDefault={() => navigate(`/admin/cupon/nuevo`)} class="btn btn-success">Agregar Cupón</a>
</div>

<div class="card border-0">
  <div class="card-header">
    <h5 class="card-title">Cupones</h5>
  </div>
  <div class="card-body">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Código</th>
          <th scope="col">% Descuento</th>
          <th scope="col">Acciones</th>
        </tr>
      </thead>
      <tbody>
        {#each cupones as cupon}
          <tr>
            <td>{cupon.id}</td>
            <td>{cupon.codigo}</td>
            <td>{cupon.porcentajeDsct}%</td>
            <td>
              <a href="/admin/cupones/edit/{cupon.id}" on:click|preventDefault={() => navigate(`/admin/cupones/edit/${cupon.id}`)} class="btn btn-danger">Editar</a>
              <button on:click|preventDefault={() => deleteCupon(cupon.id)} class="btn btn-secondary">Eliminar</button>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</div>
