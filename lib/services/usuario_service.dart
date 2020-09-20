

import 'dart:async';

import 'package:estados/models/usuario.dart';

class _UsusarioService {

  Usuario _usuario;

  StreamController<Usuario> _userStreamCont = new StreamController<Usuario>.broadcast();

  Usuario get usuario => this._usuario;
  bool get existeUser => (this._usuario != null) ? true : false;

  Stream<Usuario> get usuarioStream => _userStreamCont.stream;

  void cargarUsuario( Usuario user){
    this._usuario = user;
    this._userStreamCont.add(user);
  }

  void cambiarEdad( int edad){
    this._usuario.edad = edad;
    this._userStreamCont.add(this._usuario);

  }

  dispose(){
    this._userStreamCont?.close();
  }

}


final usuarioService = new _UsusarioService();