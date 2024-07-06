<script>
  import { onMount } from 'svelte';
  import { navigate } from 'svelte-routing';
  
  onMount(() => {

  });
</script>
<style></style>

<svelte:head>
	<title>Nosotros</title>
</svelte:head>
<section class="py-5">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-6">
        <h2>Nosotros</h2>
        <p class="lead">Fluye nace con la misión de eliminar residuos como el plástico, pero más allá de eso, también tiene la tarea de ayudar a quienes lo habitan. </p>
        <p>Por eso, una FLUYE no es solo una botella de acero inoxidable de la más alta calidad, es nuestra aliada para lograr un ALTO IMPACTO.</p>
        <div class="mt-4">
          <a href="#" class="btn btn-primary me-2"><i class="bi bi-info-circle me-1"></i>Learn More</a>
          <a href="#" class="btn btn-outline-secondary"><i class="bi bi-telephone me-1"></i>Contact Us</a>
        </div>
      </div>
      <div class="col-lg-6">
        <img src="https://fluye-statics.s3.amazonaws.com/abouts/1440_x_700_copy_3.jpg" class="img-fluid rounded" alt="About Image">
      </div>
    </div>
  </div>
</section>