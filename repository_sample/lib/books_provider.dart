import 'package:flutter/cupertino.dart';
import 'package:repository_sample/model/Book.dart';
import 'package:repository_sample/repo/BooksRepository.dart';

class BooksProvider with ChangeNotifier {
  final BooksRepository _booksRepo = BooksRepository();

  final List<Book> _books = List.empty(growable: true);
  List<Book> get books => _books;

  loadBooks() async {
    final List<Book> titles = await _booksRepo.getBooks();
    _books.addAll(titles);
    notifyListeners();
  }
}
