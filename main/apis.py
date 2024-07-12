import json
import traceback
from flask import Blueprint, request
from sqlalchemy.orm import sessionmaker
from sqlalchemy import text
from main.database import engine

api = Blueprint('api', __name__)


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



#PRODUCTOS
@api.route('/productos/list', methods=['GET'])
def productos_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("""
                SELECT * FROM productos;
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

#CLIENTES
@api.route('/clientes/list', methods=['GET'])
def clientes_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        query = text("""
            SELECT 
    c.id,
    c.nombres AS nombre,
    c.apellidos AS apellido,
    c.telefono,
    c.nroDocumento,
    c.email,
    c.contrasenia,
    c.tipoDocumento_id,  -- Solo el id de tipoDocumento
    c.direccion_id       -- Solo el id de dirección
FROM clientes c
JOIN tiposDocumento td ON c.tipoDocumento_id = td.id
JOIN direcciones d ON c.direccion_id = d.id;
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
                    'tipo_documento': r[7],
                    'distrito': r[8],
                    # Puedes agregar más campos según sea necesario
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


@api.route('/cliente/grabar', methods=['POST'])
def cliente_grabar():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        datos = request.get_json()

        # Obtener los IDs de tipoDocumento y dirección desde datos
        tipoDocumento_id = datos.get('tipoDocumento_id')
        direccion_id = datos.get('direccion_id')

        # Verificar que se reciben estos IDs
        if tipoDocumento_id is None or direccion_id is None:
            return json.dumps({"error": "Se requiere proporcionar tipoDocumento_id y direccion_id"}), 400

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

        session.commit()

        return json.dumps({"id": result.lastrowid}), 200

    except Exception as e:
        traceback.print_exc()
        error_message = "Error desconocido: {}".format(str(e))
        return json.dumps({"error": error_message}), 500

    finally:
        session.close()

#PEDIDOS
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






@api.route('/pedidos_productos/list', methods=['GET'])
def pedidos_productos_list():
    Session = sessionmaker(bind=engine)
    session = Session()
    try:
        with engine.connect() as connection:
            query = text("""
                SELECT 
    p.id AS Pedido_id,
    c.nombres || ' ' || c.apellidos || ' - ' || cp.codigo AS Pedido,+
	pr.descripcion || ' - ' || pr.precio AS "Producto y Precio",
    te.nombre AS "Tipo de entrega"
    
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
JOIN cupones cp ON p.cupon_id = cp.id
JOIN tiposEntrega te ON p.tipoEntrega_id = te.id
JOIN pedidos_productos pp ON p.id = pp.pedido_id
JOIN productos pr ON pp.producto_id = pr.id;
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
