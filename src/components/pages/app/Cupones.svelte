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
    }
  
    const deleteCupon = (id) => {
      alert(id);
    }
  </script>
  
  <style></style>
  
  <div class="mb-3">
    <h4>Gestión de Cupones</h4>
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
              </td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
  </div>
  