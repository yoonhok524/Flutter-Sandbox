import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/books_provider.dart';

class BooksWidget extends StatelessWidget {
  BooksWidget({super.key});

  late BooksProvider _booksProvider;

  @override
  Widget build(BuildContext context) {
    _booksProvider = Provider.of<BooksProvider>(context);
    final books = _booksProvider.books;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text('book: ${books[index]}');
        },
        itemCount: books.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _booksProvider.loadBooks();
        },
        child: Icon(Icons.search),
      ),
    );
  }
}
