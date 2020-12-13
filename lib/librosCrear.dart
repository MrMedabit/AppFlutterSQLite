import 'package:flutter/material.dart';
import 'package:app_libreria/db/operation.dart';
import 'package:app_libreria/models/libro.dart';

class LibroCrear extends StatelessWidget {
  static const String ROUTE = '/crear';

  final _formKey = GlobalKey<FormState>();
  final isbnController = TextEditingController();
  final tituloController = TextEditingController();
  final autorController = TextEditingController();
  final editorialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Libro libro = ModalRoute.of(context).settings.arguments;
    _init(libro);

    return Scaffold(
      appBar: AppBar(
        title: Text("Guardar"),
      ),
      body: Container(
        child: _buildForm(libro),
      ),
    );
  }

  _init(Libro libro) {
    isbnController.text = libro.isbn;
    tituloController.text = libro.titulo;
    autorController.text = libro.autor;
    editorialController.text = libro.editorial;
  }

  Widget _buildForm(Libro libro) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: isbnController,
              decoration: InputDecoration(
                  labelText: 'ISBN', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: tituloController,
              decoration: InputDecoration(
                  labelText: 'Titulo', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: autorController,
              decoration: InputDecoration(
                  labelText: 'Autor', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: editorialController,
              decoration: InputDecoration(
                  labelText: 'Editorial', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              child: Text("Guardar"),
              onPressed: () {
                Operation.crear(Libro(
                    isbn: isbnController.text,
                    titulo: tituloController.text,
                    autor: autorController.text,
                    editorial: editorialController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
