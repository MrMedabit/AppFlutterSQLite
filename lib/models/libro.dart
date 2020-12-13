class Libro {
  int id;
  String isbn;
  String titulo;
  String autor;
  String editorial;

  Libro({this.id, this.isbn, this.titulo, this.autor, this.editorial});

  Libro.empty();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isbn': isbn,
      'titulo': titulo,
      'autor': autor,
      'editorial': editorial
    };
  }
}
