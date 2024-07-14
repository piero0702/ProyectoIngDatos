<script>
  // Importación de funciones necesarias desde Svelte y svelte-routing
import { onMount } from "svelte";
import { navigate } from "svelte-routing";

  // Declaración de una variable reactiva para almacenar la lista de cupones
let cupones = [];

// Función ejecutada al montar el componente
// Obtiene la lista de cupones al montar el componente
onMount(async () => {
  await fetchCupones();
});

// Función asincrónica para obtener la lista de cupones desde el servidor
const fetchCupones = async () => {
  try {
    const response = await fetch(`/cupones/list`);
    if (!response.ok) {
      throw new Error("Error en la solicitud: " + response.status);
    }
    cupones = await response.json(); // Asigna los datos de los cupones obtenidos del servidor a la variable 'cupones'
  } catch (error) {
    console.error("Error en la solicitud:", error); // Registra un error si la solicitud falla
  }
};

// Función asincrónica para eliminar un cupón
const deleteCupon = async (id) => {
  // Confirmación del usuario antes de eliminar el cupón
  if (confirm("¿Estás seguro de que quieres eliminar este cupón?")) {
    try {
      // Envío de la solicitud DELETE para eliminar el cupón
      const response = await fetch("/cupon/eliminar", {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ id }), // Cuerpo de la solicitud contiene el ID del cupón a eliminar
      });
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || "Error al eliminar el cupón"); // Lanza un error si la solicitud no es exitosa
      }
      // Actualiza la lista de cupones después de la eliminación
      cupones = cupones.filter((cupon) => cupon.id !== id);
      console.log("Cupón eliminado correctamente");
    } catch (error) {
      console.error("Error al eliminar el cupón:", error); // Registra un error si ocurre algún problema durante la eliminación
      alert(
        error.message ||
          "Error al eliminar el cupón. Por favor, inténtelo de nuevo.",
      );
    }
  }
};
</script>

<!-- Sección HTML -->
<div class="mb-3">
<h4>Gestión de Cupones</h4>
<a
  href="/admin/cupon/nuevo"
  on:click|preventDefault={() => navigate(`/admin/cupon/nuevo`)}
  class="btn btn-success">Agregar Cupón</a
>
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
            <a
              href={`/admin/cupones/edit/${cupon.id}`}
              on:click|preventDefault={() =>
                navigate(`/admin/cupones/edit/${cupon.id}`)}
              class="btn btn-danger">Editar</a
            >
            <button
              on:click|preventDefault={() => deleteCupon(cupon.id)}
              class="btn btn-secondary">Eliminar</button
            >
          </td>
        </tr>
      {/each}
    </tbody>
  </table>
</div>
</div>
