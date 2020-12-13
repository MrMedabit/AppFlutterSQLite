import 'package:app_libreria/librosCrear.dart';
import 'package:flutter/material.dart';
import 'package:app_libreria/db/operation.dart';
import 'package:app_libreria/models/libro.dart';

class LibroConsulta extends StatelessWidget {
  static const String ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, LibroCrear.ROUTE,
                arguments: Libro.empty());
          },
        ),
        appBar: AppBar(
          title: Center(
            child: Text("Libros"),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("Hola"),
                onTap: () {},
              )
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () {},
          child: Container(
            child: _MyList(),
          ),
        ));
  }
}

class _MyList extends StatefulWidget {
  @override
  __MyListState createState() => __MyListState();
}

class __MyListState extends State<_MyList> {
  List<Libro> libros = [];

  @override
  void initState() {
    _loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: libros.length,
      itemBuilder: (_, i) => _createItem(i),
    );
  }

  _loadData() async {
    List<Libro> auxLibro = await Operation.libros();

    setState(() {
      libros = auxLibro;
    });
  }

  _createItem(int i) {
    return Dismissible(
      key: Key(i.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: (direction) {
        print(direction);
        Operation.delete(libros[i]);
      },
      child: ListTile(
        title: Text(libros[i].titulo),
        trailing: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, LibroCrear.ROUTE,
                arguments: libros[i]);
          },
          child: Icon(Icons.edit),
        ),
      ),
    );
  }
}
