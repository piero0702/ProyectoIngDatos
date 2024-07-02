from faker import Faker
import random

fake = Faker()

i = 0
total = ''
while i < 30:
  id = i + 1
  nombres = fake.first_name() + " " + fake.first_name()
  apellidos = fake.last_name() + " " + fake.last_name()
  correo = fake.email()
  imagen_url = 'periodista.png'
  resumen = fake.paragraph(10)
  pais_id = random.randint(1,20)
  query = "INSERT INTO periodistas (id, nombres, apellidos, correo, imagen_url, resumen, pais_id) VALUES ({}, '{}', '{}', '{}', '{}', '{}', {});".format(id, nombres, apellidos, correo, imagen_url, resumen, pais_id)
  total = total + query + '\n'
  i = i + 1

with open('periodistas.sql', 'w') as archivo:
  # Escribir contenido en el archivo
  archivo.write(total)