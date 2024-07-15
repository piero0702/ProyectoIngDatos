<script>
  import { navigate } from 'svelte-routing';
</script>

<style></style>

<aside id="sidebar" class="js-sidebar">
  <!-- Content For Sidebar -->
  <div class="h-100">
    <div class="sidebar-logo">
      <a href="#">Fluye</a>
    </div>
    <ul class="sidebar-nav">
      <li class="sidebar-header">
        Admin Elements
      </li>
      <li class="sidebar-item">
        <a class="sidebar-link" href="/" on:click|preventDefault={() => {navigate('/')}}>
          Home
        </a>
      </li>
      <li class="sidebar-item">
        <a href="#" class="sidebar-link collapsed" data-bs-target="#pages" data-bs-toggle="collapse"
            aria-expanded="false"><i class="fa-solid fa-file-lines pe-2"></i>
            Sin foraneas
        </a>

      <ul id="pages" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
        
        <li class="sidebar-item">
          <a class="sidebar-link" href="/admin/colores" on:click|preventDefault={() => {navigate('/admin/colores')}}>
            Lista de Colores
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link" href="/admin/tamanios" on:click|preventDefault={() => {navigate('/admin/tamanios')}}>
            Lista de Tamaños
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link" href="/admin/cupones" on:click|preventDefault={() => {navigate('/admin/cupones')}}>
            Lista de Cupones
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link" href="/admin/distritos" on:click|preventDefault={() => {navigate('/admin/distritos')}}>
            Lista de Distritos
          </a>
        </li>
        <li class="sidebar-item">
          <a class="sidebar-link" href="/admin/tipos" on:click|preventDefault={() => {navigate('/admin/tipos')}}>
            Lista de Tipos
          </a>
        </li>

        <li class="sidebar-item">
          <a class="sidebar-link" href="/admin/documento" on:click|preventDefault={() => {navigate('/admin/documento')}}>
            Lista de Documentos
          </a>
        </li>

        <li class="sidebar-item">
          <a class="sidebar-link" href="/admin/entrega" on:click|preventDefault={() => {navigate('/admin/entrega')}}>
            Lista de Entregas
          </a>
        </li>

        <li class="sidebar-item">
          <a class="sidebar-link" href="/admin/tiposProductos" on:click|preventDefault={() => {navigate('/admin/tiposProductos')}}>
            Lista de Tipos de Productos
          </a>
        </li>
      </ul>
    </li>
    <li class="sidebar-item">
        <a href="#" class="sidebar-link collapsed" data-bs-target="#posts" data-bs-toggle="collapse"
            aria-expanded="false"><i class="fa-solid fa-sliders pe-2"></i>
            Con foraneas
        </a>
        <ul id="posts" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
          <li class="sidebar-item">
            <a class="sidebar-link" href="/admin/clientes" on:click|preventDefault={() => {navigate('/admin/clientes')}}>
              Lista de Clientes
            </a>
          </li>
  
          <li class="sidebar-item">
            <a class="sidebar-link" href="/admin/pedidos" on:click|preventDefault={() => {navigate('/admin/pedidos')}}>
              Lista de Pedidos
            </a>
          </li>

          <li class="sidebar-item">
            <a class="sidebar-link" href="/admin/productos" on:click|preventDefault={() => {navigate('/admin/productos')}}>
              Lista de Productos
            </a>
          </li>

          <li class="sidebar-item">
            <a class="sidebar-link" href="/admin/direcciones" on:click|preventDefault={() => {navigate('/admin/direcciones')}}>
              Lista de Direcciones
            </a>
          </li>

          <li class="sidebar-item">
            <a class="sidebar-link" href="/admin/pedidosProductos" on:click|preventDefault={() => {navigate('/admin/pedidosProductos')}}>
              Lista de Pedidos-Productos
            </a>
          </li>



        </ul>
      </li>

      <li class="sidebar-item">
        <a class="sidebar-link" href="/" on:click|preventDefault={() => {navigate('/')}}>
          Mostrar Listas
        </a>
      </li>
      <li class="sidebar-item">
        <a href="#" class="sidebar-link collapsed" data-bs-target="#mostrar" data-bs-toggle="collapse"
            aria-expanded="false"><i class="fa-solid fa-file-lines pe-2"></i>
            Mostrar Listas
        </a>

      <ul id="mostrar" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
        
        <li class="sidebar-item">
          <a class="sidebar-link" href="/admin/mostrarPedidoProducto" on:click|preventDefault={() => {navigate('/admin/mostrarPedidoProducto')}}>
            Lista de Pedidos de Clientes
          </a>
        </li>
      </ul>
    </li>

    </ul>
  </div>
</aside>