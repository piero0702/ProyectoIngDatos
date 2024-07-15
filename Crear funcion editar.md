## Crear una ruta que coincida con la ruta del botón editar:

Si mi ruta del botón editar es:

```svelte
    <a href={`/admin/cupones/edit/${cupon.id}`}
              on:click|preventDefault={() => navigate(`/admin/cupones/edit/${cupon.id}`)}
              class="btn btn-danger">Editar</a >
```

Entonces crearé una ruta que concida con eso en `App.svelte`

```svelte
<!-- En App.svelte -->
<Route path="/admin/cupones/edit/:id" let:params>
    <CuponDetalle cuponId={params.id} />
</Route>
```

Tengo que verificar que cuando le de al botón editar, me aparezca el componente (en este caso: ``CuponDetalle``)

## Editar el componente de agregar para poder cargar los datos del cupón

En este caso, de agregar `export let cuponId = 'E'` para que me cargue el componente. También debo hacer una solicitud GET por id al servidor para que me de los datos del cupon por ID:

```svelte
    <!-- En CuponDetalle.svelte -->
<script>
    // Importación de funciones y componentes necesarios desde Svelte
    import { onMount } from "svelte";
    import { navigate } from "svelte-routing";

    // Declaración de variables reactivas
    export let cuponId = 'E'; // Propiedad para recibir el ID del cupón como prop (valor inicial 'E')
    let codigo = ""; // Variable para almacenar el código del cupón (inicialmente vacía)
    let porcentajeDsct = ""; // Variable para almacenar el porcentaje de descuento del cupón (inicialmente vacía)
    let mensajeExito = ""; // Variable para mostrar el mensaje de éxito después de guardar el cupón
    let cupon = {}; // Variable para almacenar los datos del cupón obtenidos del servidor (inicialmente un objeto vacío)

    // Función ejecutada al montar el componente
    onMount(async () => {
        await fetchCupon(); // Llama a la función fetchCupon() para obtener los datos del cupón
    });

    // Función asincrónica para obtener los datos del cupón desde el servidor
    const fetchCupon = async () => {
        try {
            const response = await fetch(`/cupones/fetch-one?id=${cuponId}`);
            if (!response.ok) {
                throw new Error("Error en la solicitud: " + response.status);
            }
            cupon = await response.json(); // Almacena los datos del cupón obtenidos del servidor
            codigo = cupon.codigo; // Asigna el valor del código del cupón a la variable 'codigo'
            porcentajeDsct = cupon.porcentajeDsct; // Asigna el valor del porcentaje de descuento a 'porcentajeDsct'
        } catch (error) {
            console.error("Error en la solicitud:", error); // Registra un error si la solicitud falla
        }
    };
    // Más codigo...
</script>

<!-- Más código ... -->
```

Para mayor detalle revisar el commit realizado.

## Crear la vista en `views.py`

En este caso:

```python
    @view.route('/admin/cupones/edit/<param>', methods=['GET'])
```

para mayor detalle revisar el commit.

## Crear el endpoint para obtener datos de 1 solo id:

```python
@api.route('/cupones/fetch-one', methods=['GET'])
def cupones_fetchOne():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("SELECT * FROM cupones where id = :id;")
            result = connection.execute(query, {'id': request.args.get('id')})
            rows = result.fetchall()
            if rows:
                resp = []
                for r in rows:
                    tmp = {
                        'id': r[0],
                        'codigo': r[1],
                        'porcentajeDsct': r[2]
                    }
                    resp.append(tmp)
                return json.dumps(resp[0])
            else:
                return json.dumps({"error": "No se encontraron resultados"}), 404
    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500
    finally:
        session.close()
```

Mayor detalle en el commit.

## Modificar el endpoint de grabar para que dependa de si es o no es una edición/grabación nueva

```python
@api.route('/cupon/grabar', methods=['POST'])
def cupon_grabar():
    # Establecer la sesión de base de datos
    Session = sessionmaker(bind=engine)  # Define la sesión utilizando el motor de base de datos proporcionado (engine)
    session = Session()  # Inicia la sesión

    try:
        datos = request.get_json()  # Obtener los datos JSON enviados en la solicitud POST

        # Verificar que se reciben los datos esperados
        codigo = datos.get('codigo')  # Obtener el valor del campo 'codigo' del JSON recibido
        porcentajeDsct = datos.get('porcentajeDsct')  # Obtener el valor del campo 'porcentajeDsct' del JSON recibido
        cuponId = datos.get('cuponId')  # Obtener el valor del campo 'cuponId' del JSON recibido
        print(cuponId)

        if codigo is None or porcentajeDsct is None:
            # Verificar si 'codigo' o 'porcentajeDsct' no fueron proporcionados
            return json.dumps({"error": "Se requiere proporcionar código y porcentaje de descuento"}), 400

        if cuponId == 'E':
            # Insertar el cupón en la base de datos si 'cuponId' es 0 (nuevo cupón)
            query = text("""
                INSERT INTO cupones (codigo, porcentajeDsct) 
                VALUES (:codigo, :porcentajeDsct)
            """)
            result = session.execute(query, {
                'codigo': codigo,
                'porcentajeDsct': porcentajeDsct
            })
        else:
            # Actualizar el cupón en la base de datos si 'cuponId' no es 0 (cupón existente)
            query = text("""
                UPDATE cupones SET codigo = :codigo, porcentajeDsct = :porcentajeDsct WHERE id = :cuponId
            """)
            result = session.execute(query, {
                'cuponId': cuponId,
                'codigo': codigo,
                'porcentajeDsct': porcentajeDsct
            })

        session.commit()  # Confirmar los cambios en la base de datos

        return json.dumps({"id": result.lastrowid}), 200  # Devolver el ID del cupón insertado o actualizado

    except Exception as e:
        traceback.print_exc()  # Imprimir la traza de la excepción en caso de error
        error_message = "Error desconocido: {}".format(str(e))  # Mensaje de error genérico
        return json.dumps({"error": error_message}), 500  # Devolver un mensaje de error y código HTTP 500 (error interno del servidor)

    finally:
        session.close()  # Cerrar la sesión de base de datos al finalizar la operación

```