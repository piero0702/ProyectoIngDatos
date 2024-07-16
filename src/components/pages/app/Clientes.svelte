<script>
  import { onMount } from 'svelte';
  import { navigate } from 'svelte-routing';

  let Clientes = [];

  onMount(() => {
    fetchClientes();
  });

  const fetchClientes = () => {
    fetch(`/clientes/list`)
      .then(response => {
        if (!response.ok) {
          throw new Error('Error en la solicitud: ' + response.status);
        }
        return response.json(); 
      })
      .then(data => {
        Clientes = data; // Asignar los datos obtenidos a Clientes
      })
      .catch(error => {
        console.error('Error en la solicitud:', error);
      });
  }

  const deleteCliente = (id) => {
    if (confirm("¿Estás seguro de que quieres eliminar este cliente?")) {
      fetch("/cliente/eliminar", {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ id })
      })
      .then(response => {
        if (!response.ok) {
          return response.json().then(data => { throw new Error(data.error || "Error al eliminar el cliente"); });
        }
        return response.json();
      })
      .then(data => {
        // Actualizar Clientes después de eliminar el cliente
        Clientes = Clientes.filter(cliente => cliente.id !== id);
        console.log(data.mensaje);
      })
      .catch(error => {
        console.error("Error al eliminar el cliente:", error);
        alert(error.message || "Error al eliminar el cliente. Por favor, inténtelo de nuevo.");
      });
    }
  }

  // Función para agregar un nuevo cliente
  const agregarCliente = async (datosCliente) => {
    try {
      const opciones = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(datosCliente)
      };

      const response = await fetch("/cliente/grabar", opciones);
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error("Error en la solicitud: " + errorData.error);
      }

      // Actualizar la lista de clientes después de agregar uno nuevo
      fetchClientes();

      // Mostrar mensaje de éxito o hacer cualquier otra acción necesaria
      console.log("Cliente agregado correctamente");

    } catch (error) {
      console.error("Error al agregar el cliente:", error);
      alert("Error al intentar agregar cliente. Por favor, inténtelo de nuevo.");
    }
  }
</script>

<div class="mb-3">
  <h4>Gestión de Clientes</h4>
  <a href="/admin/cliente/nuevo" on:click|preventDefault={() => navigate(`/admin/cliente/nuevo`)} class="btn btn-success">Agregar Cliente</a>
</div>

<div class="card border-0">
  <div class="card-header">
    <h5 class="card-title">Clientes</h5>
  </div>
  <div class="card-body">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Nombre</th>
          <th scope="col">Apellido</th>
          <th scope="col">Teléfono</th>
          <th scope="col">Nº de Documento</th>
          <th scope="col">Email</th>
          <th scope="col">Contraseña</th>
          <th scope="col">Tipo de Documento</th>
          <th scope="col">Direccion</th>
          <th scope="col">Acciones</th>
        </tr>
      </thead>
      <tbody>
        {#each Clientes as cliente}
          <tr>
            <td>{cliente.id}</td>
            <td>{cliente.nombre}</td>
            <td>{cliente.apellido}</td>
            <td>{cliente.telefono}</td>
            <td>{cliente.nroDocumento}</td>
            <td>{cliente.email}</td>
            <td>{cliente.contrasenia}</td>
            <td>{cliente.tipoDocumento}</td>
            <td>{cliente.direccion}</td>
            <td>
              <a href="/admin/cliente/editar/{cliente.id}" on:click|preventDefault={() => navigate(`/admin/cliente/editar/${cliente.id}`)} class="btn btn-danger">Editar</a>
              <button on:click|preventDefault={() => deleteCliente(cliente.id)} class="btn btn-secondary">Eliminar</button>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
</div>
