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
        
        <p></p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://fluye-statics.s3.amazonaws.com/abouts/Artboard_1_copy_6.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <p></p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://fluye-statics.s3.amazonaws.com/abouts/1440x700_corportavivo-desktop.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
          <div class="flex-center flex-col" style="margin-top: -650px; text-align: center;">
              <h1 style="font-size: 48px; font-weight: bold;">Corporativo | Fluye Bottle</h1>
              <p style="font-size: 18px;">Una Fluye perfecta para fomentar un estilo de vida saludable en tu empresa, colaboradores y clientes.</p>
          </div>
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
          <h3 class="h4">Sobre Nosotros</h3>
          <p>En octubre de 2017, fundamos Fluye con la misión de abordar la contaminación ambiental causada por el uso desmedido de plástico. Hartos de presenciar la degradación de nuestro entorno natural debido a botellas y envases plásticos, decidimos aportar nuestra solución. 
          </p>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="mb-5">
          <div class="icon bg-primary text-white rounded-circle mb-3">
            <i class="bi bi-card-checklist"></i>
          </div>
          <h3 class="h4">¡Somos más que una bottle!</h3>
          <p>Al comprar una botella reutilizable Fluye estás comprando practicidad y elegancia a tu estilo con los mejores productos sostenibles. Por cada Fluye que compras, reduces el uso de plásticos en tu vida diaria, y aportas a una ONG con impacto social y medioambiental. ¿Ya tienes tu FLUYE BOTTLE favorita?
          </p>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="mb-5">
          <div class="icon bg-primary text-white rounded-circle mb-3">
            <i class="bi bi-bar-chart-fill"></i>
          </div>
          <h3 class="h4">Nuestra promesa</h3>
          <p>En el fascinante mundo de Fluye, la perfección es la esencia misma de nuestra filosofía. Nos esforzamos incansablemente para garantizar que cada Fluye no sólo sea una experiencia, sino una expresión de excelencia. Nos enorgullece no solo crear productos de calidad inigualable, sino también abrazar nuestro papel activo en la preservación del planeta.
          </p>
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
  <p class="mb-0"></p>
</footer>