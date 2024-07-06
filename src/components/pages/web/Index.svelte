<script>
  import { onMount } from 'svelte';
  import { navigate, Router, Route} from 'svelte-routing';
  onMount(() => {

  });
</script>
<style></style>

<svelte:head>
	<title>Inicio</title>
</svelte:head>

<!-- Carousel -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <ol class="carousel-indicators">
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://fluye-statics.s3.amazonaws.com/banners/Cups_1920x700.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First Slide</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://scontent.flim15-2.fna.fbcdn.net/v/t39.30808-6/438729765_822937256519837_3677215015024177512_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=YJHh-6GOfMIQ7kNvgEXJsNN&_nc_ht=scontent.flim15-2.fna&oh=00_AYAvJgnjTwSCaVdChMEUGW5IrvArrdBZ231tlYjO45Dnmw&oe=668F53ED" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second Slide</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </a>
</div>

<!-- Features Section -->
<section class="py-5">
  <div class="container">
    <div class="row text-center">
      <div class="col-lg-4">
        <div class="mb-5">
          <div class="icon bg-primary text-white rounded-circle mb-3">
            <i class="bi bi-briefcase-fill"></i>
          </div>
          <h3 class="h4">¡Somos más que una bottle!</h3>
          <p>Al comprar una botella reutilizable Fluye estás comprando practicidad y elegancia a tu estilo con los mejores productos sostenibles. Por cada Fluye que compras, reduces el uso de plásticos en tu vida diaria, y aportas a una ONG con impacto social y medioambiental. ¿Ya tienes tu FLUYE BOTTLE favorita?
          </p>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="mb-5">
          <div class="icon bg-primary text-white rounded-circle mb-3">
            <i class="bi bi-card-checklist"></i>
          </div>
          <h3 class="h4">Feature Two</h3>
          <p>Some representative placeholder content for the second feature.</p>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="mb-5">
          <div class="icon bg-primary text-white rounded-circle mb-3">
            <i class="bi bi-bar-chart-fill"></i>
          </div>
          <h3 class="h4">Feature Three</h3>
          <p>Some representative placeholder content for the third feature.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Call to Action Section -->
<section class="bg-light py-5">
  <div class="container">
    <div class="row text-center">
      <div class="col">
        <h2>Productos</h2>
        <p class="lead">Desea ver los productos que tenemos en stock?</p>
        <a href="/productos" on:click|preventDefault={() => {navigate('/productos')}} class="btn btn-primary btn-lg">Ver Ahora!</a>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-4">
  <p class="mb-0">© 2024 Your Brand. All rights reserved.</p>
</footer>