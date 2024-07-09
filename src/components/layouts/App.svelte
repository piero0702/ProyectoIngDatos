<script lang="ts">
import { onMount } from 'svelte';
import { Router, Route } from 'svelte-routing';
import Sidebar from '../widgets/Sidebar.svelte';
import Navbar from '../widgets/Navbar.svelte';
import ThemeToggle from '../widgets/ThemeToggle.svelte';
import Footer from '../widgets/Footer.svelte';
import Home from '../pages/app/Home.svelte';
import Level from '../pages/app/Level.svelte';
import BodyPart from '../pages/app/BodyPart.svelte';
import Member from '../pages/app/Member.svelte';
import Country from '../pages/app/Country.svelte';
import Departamentos from '../pages/app/Departamentos.svelte';
import Tipos from '../pages/app/Tipos.svelte';
import Productos from '../pages/app/Productos.svelte';
	import Clientes from '../pages/app/Clientes.svelte';
	import Pedidos from '../pages/app/Pedidos.svelte';
export let basepath = '/admin';

const toggleRootClass = () => {
  const current = document.documentElement.getAttribute('data-bs-theme');
  const inverted = current === 'dark' ? 'light' : 'dark';
  document.documentElement.setAttribute('data-bs-theme', inverted);
}

const toggleLocalStorage = () => {
  if (isLight()) {
    localStorage.removeItem('light');
  } else {
    localStorage.setItem('light', 'set');
  }
}

const isLight = () => {
  return localStorage.getItem('light');
}

onMount(() => {
  const sidebarToggle = document.querySelector('#sidebar-toggle');
  if (sidebarToggle) {
    sidebarToggle.addEventListener('click', () => {
      document.querySelector('#sidebar').classList.toggle('collapsed');
    });
  }

  const themeToggle = document.querySelector('.theme-toggle');
  if (themeToggle) {
    themeToggle.addEventListener('click', () => {
      toggleLocalStorage();
      toggleRootClass();
    });
  }

  if (isLight()) {
    toggleRootClass();
  }
});
</script>

<style></style>

<div class="wrapper">
  <Sidebar />
  <div class="main">
    <Navbar />
    <main class="content px-3 py-2">
      <div class="container-fluid">
        <Router basepath="{basepath}">
          <Route path="/" component={Home} />
          <Route path="/level" component={Level} />
          <Route path="/body-part" component={BodyPart} />
          <Route path="/member" component={Member} />
          <Route path="/country" component={Country} />
          <Route path= "/departamentos" component={Departamentos}/>
          <Route path= "/tipos" component={Tipos}/>
          <Route path= "/productos" component={Productos}/>
          <Route path= "/clientes" component={Clientes}/>
          <Route path= "/pedidos" component={Pedidos}/>
        </Router>
      </div>
    </main>
    <ThemeToggle />
    <Footer />
  </div>
</div>

