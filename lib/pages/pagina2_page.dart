

import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';


class Pagina2Page extends StatefulWidget {

  @override
  _Pagina2PageState createState() => _Pagina2PageState();
}

class _Pagina2PageState extends State<Pagina2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
          StreamBuilder(
            stream: usuarioService.usuarioStream,
            builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
              return snapshot.hasData ?
                      Text('${snapshot.data.nombre}')
                      : Text('Pagina 2');
          
            },
            
          ),

          

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

                final usuario = new Usuario(
                  nombre: 'Adam',
                  edad: 4,
                ) ;

                

                usuarioService.cargarUsuario(usuario);
              },
            ),
            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                usuarioService.cambiarEdad(30);
              },
            ),
            MaterialButton(
              child: Text('Anadir una Profesion', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

              },
            )
          ],
        )
     ),
   );
  }
}