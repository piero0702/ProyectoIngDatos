import json
import traceback
from flask import Blueprint, request
from sqlalchemy.orm import sessionmaker
from sqlalchemy import text
from main.database import engine

api = Blueprint('api', __name__)




@api.route('/tiposDocumento/list', methods=['GET'])
def tiposDocumento_list():
  Session = sessionmaker(bind=engine)
  session = Session()
  try:
    with engine.connect() as connection:
      query = text("SELECT * FROM tiposDocumento;")
      result = connection.execute(query)
      # Obtener el primer resultado
      rows = result.fetchall()
      if rows:
        resp = []
        print(rows)
        for r in rows:
          tmp = {
            'id': r[0],
            'nombre': r[1]
          }
          resp.append(tmp)
        return json.dumps(resp)
      else:
          return json.dumps({"error": "No se encontraron resultados"}), 404
  except Exception as e:
    traceback.print_exc()
    error_message = "Error desconocido: {}".format(str(e))
    return json.dumps({"error": error_message}), 500
  finally:
    session.close()

#TIPOS DE PRODUCTOS
@api.route('/tipos/list', methods=['GET'])
def tipos_list():
  Session = sessionmaker(bind=engine)
  session = Session()
  try:
    with engine.connect() as connection:
      query = text("SELECT * FROM tipos;")
      result = connection.execute(query)
      # Obtener el primer resultado
      rows = result.fetchall()
      if rows:
        resp = []
        print(rows)
        for r in rows:
          tmp = {
            'id': r[0],
            'nombres': r[1]
          }
          resp.append(tmp)
        return json.dumps(resp)
      else:
          return json.dumps({"error": "No se encontraron resultados"}), 404
  except Exception as e:
    traceback.print_exc()
    error_message = "Error desconocido: {}".format(str(e))
    return json.dumps({"error": error_message}), 500
  finally:
    session.close()

#TIPO DE DOCUMENTO
@api.route('/documento/list', methods=['GET'])
def documento_list():
  Session = sessionmaker(bind=engine)
  session = Session()
  try:
    with engine.connect() as connection:
      query = text("SELECT * FROM tiposDocumento;")
      result = connection.execute(query)
      # Obtener el primer resultado
      rows = result.fetchall()
      if rows:
        resp = []
        print(rows)
        for r in rows:
          tmp = {
            'id': r[0],
            'nombre': r[1]
          }
          resp.append(tmp)
        return json.dumps(resp)
      else:
          return json.dumps({"error": "No se encontraron resultados"}), 404
  except Exception as e:
    traceback.print_exc()
    error_message = "Error desconocido: {}".format(str(e))
    return json.dumps({"error": error_message}), 500
  finally:
    session.close()

#TIPO DE ENTREGA
@api.route('/entrega/list', methods=['GET'])
def entrega_list():
  Session = sessionmaker(bind=engine)
  session = Session()
  try:
    with engine.connect() as connection:
      query = text("SELECT * FROM tiposEntrega;")
      result = connection.execute(query)
      # Obtener el primer resultado
      rows = result.fetchall()
      if rows:
        resp = []
        print(rows)
        for r in rows:
          tmp = {
            'id': r[0],
            'nombre': r[1]
          }
          resp.append(tmp)
        return json.dumps(resp)
      else:
          return json.dumps({"error": "No se encontraron resultados"}), 404
  except Exception as e:
    traceback.print_exc()
    error_message = "Error desconocido: {}".format(str(e))
    return json.dumps({"error": error_message}), 500
  finally:
    session.close()


#TIPO DE PRODUCTOS
@api.route('/tiposProductos/list', methods=['GET'])
def tiposProductos_list():
  Session = sessionmaker(bind=engine)
  session = Session()
  try:
    with engine.connect() as connection:
      query = text("SELECT * FROM tiposProducto;")
      result = connection.execute(query)
      # Obtener el primer resultado
      rows = result.fetchall()
      if rows:
        resp = []
        print(rows)
        for r in rows:
          tmp = {
            'id': r[0],
            'nombre': r[1]
          }
          resp.append(tmp)
        return json.dumps(resp)
      else:
          return json.dumps({"error": "No se encontraron resultados"}), 404
  except Exception as e:
    traceback.print_exc()
    error_message = "Error desconocido: {}".format(str(e))
    return json.dumps({"error": error_message}), 500
  finally:
    session.close()

#LISTA DE COLORES
@api.route('/colores/list', methods=['GET'])
def colores_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("SELECT * FROM colores;")
            result = connection.execute(query)
            rows = result.fetchall()
            if rows:
                resp = []
                for r in rows:
                    tmp = {
                        'id': r[0],
                        'nombre': r[1]
                    }
                    resp.append(tmp)
                return json.dumps(resp)
            else:
                return json.dumps({"error": "No se encontraron resultados"}), 404
    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500
    finally:
        session.close()

#LISTA DE TAMANIOS
@api.route('/tamanios/list', methods=['GET'])
def tamanios_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("SELECT * FROM tamanios;")
            result = connection.execute(query)
            rows = result.fetchall()
            if rows:
                resp = []
                for r in rows:
                    tmp = {
                        'id': r[0],
                        'numeroMl': r[1]
                    }
                    resp.append(tmp)
                return json.dumps(resp)
            else:
                return json.dumps({"error": "No se encontraron resultados"}), 404
    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500
    finally:
        session.close()



#CUPON = LISTA + ELIMINAR + GRABAR
@api.route('/cupones/list', methods=['GET'])
def cupones_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("SELECT * FROM cupones;")
            result = connection.execute(query)
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
                return json.dumps(resp)
            else:
                return json.dumps({"error": "No se encontraron resultados"}), 404
    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500
    finally:
        session.close()


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

@api.route('/cupon/eliminar', methods=['DELETE'])
def cupon_eliminar():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        datos = request.get_json()
        cupon_id = datos.get('id')

        if not cupon_id:
            return json.dumps({"error": "Se requiere proporcionar un ID de cupón"}), 400

        # Eliminar el cupón de la base de datos
        query = text("DELETE FROM cupones WHERE id = :id")
        session.execute(query, {'id': cupon_id})
        session.commit()

        return json.dumps({"mensaje": "Cupón eliminado correctamente"}), 200

    except Exception as e:
        traceback.print_exc()
        error_message = "Error al eliminar el cupón: {}".format(str(e))
        return json.dumps({"error": error_message}), 500

    finally:
        session.close()



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


#LISTA DE DISTRITOS
@api.route('/distritos/list', methods=['GET'])
def distritos_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("SELECT * FROM distritos;")
            result = connection.execute(query)
            rows = result.fetchall()
            if rows:
                resp = []
                for r in rows:
                    tmp = {
                        'id': r[0],
                        'nombre': r[1],                  
                    }
                    resp.append(tmp)
                return json.dumps(resp)
            else:
                return json.dumps({"error": "No se encontraron resultados"}), 404
    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500
    finally:
        session.close()



#LISTA DE PRODUCTOS + ELIMINAR
@api.route('/productos/list', methods=['GET'])
def productos_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("""
                SELECT 
    p.id AS producto_id,
    p.descripcion AS producto_descripcion,
    p.cuidados AS producto_cuidados,
    p.propiedades AS producto_propiedades,
    p.stock AS producto_stock,
    t.nombres AS tipo_botella,
    c.nombres AS color,
    tm.numeroMl AS tamano,
    p.imagen AS producto_imagen,
    p.precio AS producto_precio
FROM productos p
INNER JOIN tipos t ON p.tipo_id = t.id
INNER JOIN colores c ON p.color_id = c.id
INNER JOIN tamanios tm ON p.tamano_id = tm.id;
            """)
            result = connection.execute(query)
            rows = result.fetchall()
            if rows:
                resp = []
                for r in rows:
                    tmp = {
                        'id': r[0],
                        'descripcion': r[1],
                        'cuidados': r[2],
                        'propiedades': [3],
                        'stock': r[4],
                        'tipo_id': r[5],
                        'color_id': r[6],
                        'tamano_id': r[7],
                        'imagen': r[8],
                        'precio': r[9]
                    }
                    resp.append(tmp)
                return json.dumps(resp)
            else:
                return json.dumps({"error": "No se encontraron resultados"}), 404
    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500
    finally:
        session.close()

@api.route('/producto/eliminar', methods=['DELETE'])
def producto_eliminar():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        datos = request.get_json()
        producto_id = datos.get('id')

        if not producto_id:
            return json.dumps({"error": "Se requiere proporcionar un ID de cliente"}), 400

        # Eliminar el cliente de la base de datos
        query = text("DELETE FROM productos WHERE id = :id")
        session.execute(query, {'id': producto_id})
        session.commit()

        return json.dumps({"mensaje": "Cliente eliminado correctamente"}), 200

    except Exception as e:
        traceback.print_exc()
        error_message = "Error al eliminar el cliente: {}".format(str(e))
        return json.dumps({"error": error_message}), 500

    finally:
        session.close()


#LISTA DE CLIENTES + ELIMINAR + GRABAR
@api.route('/clientes/list', methods=['GET'])
def clientes_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        query = text("""
            SELECT 
    C.id, 
    C.nombres, 
    C.apellidos, 
    C.telefono, 
    C.nroDocumento, 
    C.email, 
    C.contrasenia, 
    T.nombre AS tipoDocumento, 
    D.direccionEntrega as direccion 
FROM 
    clientes C 
INNER JOIN 
    tiposDocumento T ON C.tipoDocumento_id = T.id
INNER JOIN 
    direcciones D ON D.id = C.direccion_id;
        """)
        result = session.execute(query)
        rows = result.fetchall()
        if rows:
            resp = []
            for r in rows:
                tmp = {
                    'id': r[0],
                    'nombre': r[1],
                    'apellido': r[2],
                    'telefono': r[3],
                    'nroDocumento': r[4],
                    'email': r[5],
                    'contrasenia': r[6],
                    'tipoDocumento': r[7],
                    'direccion': r[8],
                }
                resp.append(tmp)
            return json.dumps(resp)
        else:
            return json.dumps({"error": "No se encontraron resultados"}), 404
    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500
    finally:
        session.close()


@api.route('/cliente/eliminar', methods=['DELETE'])
def cliente_eliminar():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        datos = request.get_json()
        cliente_id = datos.get('id')

        if not cliente_id:
            return json.dumps({"error": "Se requiere proporcionar un ID de cliente"}), 400

        # Eliminar el cliente de la base de datos
        query = text("DELETE FROM clientes WHERE id = :id")
        session.execute(query, {'id': cliente_id})
        session.commit()

        return json.dumps({"mensaje": "Cliente eliminado correctamente"}), 200

    except Exception as e:
        traceback.print_exc()
        error_message = "Error al eliminar el cliente: {}".format(str(e))
        return json.dumps({"error": error_message}), 500

    finally:
        session.close()

@api.route('/cliente/fetch-one', methods=['GET'])
def cliente_fetchOne():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("SELECT * FROM clientes where id = :id;")
            result = connection.execute(query, {'id': request.args.get('id')})
            rows = result.fetchall()
            if rows:
                resp = []
                for r in rows:
                    tmp = {
                        'id': r[0],
                        'nombres': r[1],
                        'apellidos': r[2],
                        'telefono': r[3],
                        'nroDocumento': r[4],
                        'email': r[5],
                        'contrasenia': r[6],
                        'tipoDocumento_id': r[7],
                        'direccion_id': r[8]
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

@api.route('/cliente/grabar', methods=['POST'])
def cliente_grabar():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        datos = request.get_json()

        # Obtener los IDs de tipoDocumento y dirección desde datos
        tipoDocumento_id = datos.get('tipoDocumento_id')
        direccion_id = datos.get('direccion_id')
        clienteId = datos.get("clienteId")

        # Verificar que se reciben estos IDs
        if tipoDocumento_id is None or direccion_id is None:
            return json.dumps({"error": "Se requiere proporcionar tipoDocumento_id y direccion_id"}), 400
        
        if clienteId == 'E':
            # Insertar el cliente en la base de datos
            query = text("""
                INSERT INTO clientes (nombres, apellidos, telefono, nroDocumento, email, contrasenia, tipoDocumento_id, direccion_id) 
                VALUES (:nombres, :apellidos, :telefono, :nroDocumento, :email, :contrasenia, :tipoDocumento_id, :direccion_id)
            """)
            result = session.execute(query, {
                'nombres': datos['nombres'],
                'apellidos': datos['apellidos'],
                'telefono': datos['telefono'],
                'nroDocumento': datos['nroDocumento'],
                'email': datos['email'],
                'contrasenia': datos['contrasenia'],
                'tipoDocumento_id': tipoDocumento_id,
                'direccion_id': direccion_id
            })
        else:
            query = text("""
UPDATE clientes SET nombres = :nombres, apellidos = :apellidos, telefono = :telefono, nroDocumento = :nroDocumento,
                         email = :email, contrasenia = :contrasenia, tipoDocumento_id = :tipoDocumento_id, direccion_id = :direccion_id
                         WHERE id = :clienteId
""")
            result = session.execute(query, {
                'clienteId': clienteId,
                'nombres': datos['nombres'],
                'apellidos': datos['apellidos'],
                'telefono': datos['telefono'],
                'nroDocumento': datos['nroDocumento'],
                'email': datos['email'],
                'contrasenia': datos['contrasenia'],
                'tipoDocumento_id': tipoDocumento_id,
                'direccion_id': direccion_id
            })

        session.commit()

        return json.dumps({"id": result.lastrowid}), 200

    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500

    finally:
        session.close()

#PEDIDOS + ELIMINAR + GRABAR
@api.route('/pedidos/list', methods=['GET'])
def pedidos_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        query = """
            SELECT id, tipoEntrega_id, cupon_id, cliente_id
            FROM pedidos
        """
        result = session.execute(text(query))
        rows = result.fetchall()
        
        if rows:
            pedidos = []
            for r in rows:
                pedido = {
                    'id': r[0],
                    'tipoEntrega_id': r[1],
                    'cupon_id': r[2],
                    'cliente_id': r[3]
                }
                pedidos.append(pedido)
            return json.dumps(pedidos)
        else:
            return json.dumps({"error": "No se encontraron resultados"}), 404
    
    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500
    
    finally:
        session.close()


@api.route('/pedido/eliminar', methods=['DELETE'])
def pedido_eliminar():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        datos = request.get_json()
        pedido_id = datos.get('id')

        if not pedido_id:
            return json.dumps({"error": "Se requiere proporcionar un ID de pedido"}), 400

        # Eliminar el pedido de la base de datos
        query = text("DELETE FROM pedidos WHERE id = :id")
        session.execute(query, {'id': pedido_id})
        session.commit()

        return json.dumps({"mensaje": "Pedido eliminado correctamente"}), 200

    except Exception as e:
        traceback.print_exc()
        error_message = "Error al eliminar el pedido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500

    finally:
        session.close()


@api.route('/pedido/grabar', methods=['POST'])
def pedido_grabar():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        datos = request.get_json()

        # Obtener los IDs de tipoEntrega y cupon desde datos
        tipoEntrega_id = datos.get('tipoEntrega_id')
        cupon_id = datos.get('cupon_id')
        cliente_id = datos.get('cliente_id')  # Asegúrate de obtener el cliente_id si es necesario

        # Verificar que se reciben estos IDss
        if tipoEntrega_id is None or cupon_id is None:
            return json.dumps({"error": "Se requiere proporcionar tipoEntrega_id y cupon_id"}), 400
        
        # Insertar el pedido en la base de datos
        query = text("""
            INSERT INTO pedidos (tipoEntrega_id, cupon_id, cliente_id) 
            VALUES (:tipoEntrega_id, :cupon_id, :cliente_id)
        """)
        result = session.execute(query, {
            'tipoEntrega_id': tipoEntrega_id,
            'cupon_id': cupon_id,
            'cliente_id': cliente_id  # Asegúrate de pasar el cliente_id si es necesario
        })

        session.commit()

        return json.dumps({"id": result.lastrowid}), 200

    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500

    finally:
        session.close()


#LISTA DE DIRECCIONES
@api.route('/direcciones/list', methods=['GET'])
def direcciones_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("""
                SELECT d.id, d.direccionEntrega, d.codigoPostal, dt.nombres AS nombreDistrito
FROM direcciones d
JOIN distritos dt ON d.distrito_id = dt.id;
            """)
            result = connection.execute(query)
            rows = result.fetchall()
            if rows:
                resp = [{
                    'id': r[0],
                    'direccionEntrega': r[1],
                    'codigoPostal': r[2],
                    'distrito_id': r[3]
                } for r in rows]
                return json.dumps(resp)
            else:
                return json.dumps({"error": "No se encontraron resultados"}), 404
    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500
    finally:
        session.close()


#CUPON = LISTA + ELIMINAR + GRABAR
@api.route('/pedidos_productos/list', methods=['GET'])
def pedidos_productos_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("""
                SELECT * FROM pedidos_productos;
            """)
            result = connection.execute(query)
            rows = result.fetchall()
            if rows:
                resp = [{
                    'id': r[0],
                    'pedido_id': r[1],
                    'producto_id': r[2],
                    'tipoProducto_id': r[3]
                } for r in rows]
                return json.dumps(resp)
            else:
                return json.dumps({"error": "No se encontraron resultados"}), 404
    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500
    finally:
        session.close()


@api.route('/pedidoProducto/eliminar', methods=['DELETE'])
def pedidoProducto_eliminar():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        datos = request.get_json()
        pedidoProducto_id = datos.get('id')

        if not pedidoProducto_id:
            return json.dumps({"error": "Se requiere proporcionar un ID de pedido"}), 400

        # Eliminar el pedido de la base de datoss
        query = text("DELETE FROM pedidos_productos WHERE id = :id")
        session.execute(query, {'id': pedidoProducto_id})
        session.commit()

        return json.dumps({"mensaje": "Pedido eliminado correctamente"}), 200

    except Exception as e:
        traceback.print_exc()
        error_message = "Error al eliminar el pedido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500

    finally:
        session.close()


@api.route('/pedidoProducto/grabar', methods=['POST'])
def pedidoProducto_grabar():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        datos = request.get_json()

        pedido_id = datos.get('pedido_id')
        producto_id = datos.get('producto_id')
        tipoProducto_id = datos.get('tipoProducto_id')

        if pedido_id is None or producto_id is None or tipoProducto_id is None:
            return json.dumps({"error": "Se requiere proporcionar pedido_id, producto_id y tipoProducto_id"}), 400

        query = text("""
            INSERT INTO pedidos_productos (pedido_id, producto_id, tipoProducto_id) 
            VALUES (:pedido_id, :producto_id, :tipoProducto_id)
        """)
        result = session.execute(query, {
            'pedido_id': pedido_id,
            'producto_id': producto_id,
            'tipoProducto_id': tipoProducto_id
        })

        session.commit()

        return json.dumps({"mensaje": "Pedido producto agregado correctamente"}), 200

    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500

    finally:
        session.close()


#MOSTRAR
@api.route('/mostrar_pedidos_productos/list', methods=['GET'])
def mostrar_pedidos_productos_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("""
                SELECT 
    p.id AS Pedido_id,
    c.nombres || ' ' || c.apellidos AS Cliente,
    cp.codigo AS Cupon,
    pr.descripcion AS Producto,
    pr.precio AS Precio,
    te.nombre AS "Tipo de entrega",
    tp.nombre AS "Tipo Producto"
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
JOIN cupones cp ON p.cupon_id = cp.id
JOIN tiposEntrega te ON p.tipoEntrega_id = te.id
JOIN pedidos_productos pp ON p.id = pp.pedido_id
JOIN productos pr ON pp.producto_id = pr.id
JOIN tiposProducto tp ON pp.tipoProducto_id = tp.id;
            """)
            result = connection.execute(query)
            rows = result.fetchall()
            if rows:
                resp = [{
                    'id': r[0],
                    'cliente': r[1],
                    'cupon': r[2],
                    'producto': r[3],
                    'precio': r[4],  # Asegura que el precio sea un float
                    'tipo_entrega': r[5],
                    'tipo_producto': r[6]
                } for r in rows]
                return json.dumps(resp)
            else:
                return json.dumps({"error": "No se encontraron resultados"}), 404
    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500
    finally:
        session.close()
