#!/usr/bin/env python
# -*- coding: utf-8 -*-
from flask import Blueprint, render_template

view = Blueprint('demo-app-index', __name__)

@view.route('/reset-password', methods=['GET'])
@view.route('/sign-up', methods=['GET'])
@view.route('/login', methods=['GET'])
def access():
  locals = {}
  locals['title'] = 'Bienvenido'
  locals['csss'] = ['dist/access']
  locals['jss'] = ['dist/access']
  return render_template('access.html', locals = locals)

@view.route('/contact', methods=['GET'])
@view.route('/about', methods=['GET'])
@view.route('/services', methods=['GET'])
@view.route('/', methods=['GET'])
def home():
  locals = {}
  locals['title'] = 'Bienvenido'
  locals['csss'] = ['dist/web']
  locals['jss'] = ['dist/web']
  return render_template('web.html', locals = locals)


@view.route('/admin/departamentos',methods=['GET'])
@view.route('/admin/tipos',methods=['GET'])
@view.route('/admin/productos',methods=['GET'])
@view.route('/admin/clientes',methods=['GET'])
@view.route('/admin/cliente/nuevo',methods=['GET'])
@view.route('/admin/pedidos',methods=['GET'])
@view.route('/admin/pedido/nuevo',methods=['GET'])
@view.route('/admin/documento',methods=['GET'])
@view.route('/admin/entrega',methods=['GET'])
@view.route('/admin/tiposProductos',methods=['GET'])
@view.route('/admin/colores',methods=['GET'])
@view.route('/admin/tamanios',methods=['GET'])
@view.route('/admin/cupones',methods=['GET'])
@view.route('/admin/cupones/edit/<param>', methods=['GET'])
@view.route('/admin/distritos',methods=['GET'])
@view.route('/admin/direcciones',methods=['GET'])
@view.route('/admin/pedidosProductos',methods=['GET'])
@view.route('/admin/pedidosProductos/nuevo',methods=['GET'])
@view.route('/admin/mostrarPedidoProducto',methods=['GET'])
@view.route('/admin/pagos',methods=['GET'])
@view.route('/admin', methods=['GET'])
def app(param=0):
  locals = {}
  locals['title'] = 'Panel de Administración'
  locals['csss'] = ['dist/app']
  locals['jss'] = ['dist/app']
  return render_template('app.html', locals = locals)

@view.route('/error/access/<code>', methods=['GET'])
def error_access(code):
  #lagos
  # lang = session_language(session)
  # locals_dic = { }
  # return render_template('demo/index.html', locals=locals_dic)
  return 'Recurso no encontrado', code
