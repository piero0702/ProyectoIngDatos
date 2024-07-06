<script>
  import { onMount } from 'svelte';
  import { navigate } from 'svelte-routing';
  
  onMount(() => {

  });
</script>
<style></style>

<svelte:head>
	<title>Contacto</title>
</svelte:head>
<section class="py-5">
  <div class="container">
    <div class="row">
      <!-- Contact Form -->
      <div class="col-md-6">
        <h2>Contact Us</h2>
        <form>
          <div class="mb-3">
            <label for="name" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="name" required>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" required>
          </div>
          <div class="mb-3">
            <label for="message" class="form-label">Mensaje</label>
            <textarea class="form-control" id="message" rows="4" required></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Enviar!</button>
        </form>
      </div>
      <!-- Image -->
      <div class="col-md-6">
        <img src="https://fluyebottle.com/images/subscribe/sus.jpeg" class="img-fluid" alt="Contact Image">
      </div>
    </div>
  </div>
</section>