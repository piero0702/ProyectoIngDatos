#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
import traceback
from flask import Blueprint
from sqlalchemy.orm import sessionmaker
from sqlalchemy import text
from main.database import engine

api = Blueprint('api', __name__)

@api.route('/departamentos/list', methods=['GET'])
def departamentos_list():
  Session = sessionmaker(bind=engine)
  session = Session()
  try:
    with engine.connect() as connection:
      query = text("SELECT * FROM departamentos;")
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

@api.route('/productos/list', methods=['GET'])
def productos_list():
  Session = sessionmaker(bind=engine)
  session = Session()
  try:
    with engine.connect() as connection:
      query = text("SELECT productos.id, (tipos.nombres || ' ' || colores.nombres || ' ' || tamanios.numeroMl) as Nombre, productos.imagen FROM productos INNER JOIN tipos ON productos.tipo_id = tipos.id INNER JOIN colores ON productos.color_id = colores.id INNER JOIN tamanios ON productos.tamano_id = tamanios.id;")
      result = connection.execute(query)
      # Obtener el primer resultado
      rows = result.fetchall()
      if rows:
        resp = []
        print(rows)
        for r in rows:
          tmp = {
            'id':r[0],
            'nombre': r[1],
            'imagen': r[2]
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