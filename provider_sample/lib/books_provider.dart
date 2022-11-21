import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BooksProvider with ChangeNotifier {
  List<String> _books = List.empty(growable: true);
  List<String> get books => _books;

  loadBooks() async {
    final url = 'https://dapi.kakao.com/v3/search/book?target=title&query=doit';
    var response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'KakaoAK 7f19fef53eab5da5174279c3cef96300'});
    final List data = json.decode(response.body)['documents'];
    final List<String> titles = data.map((e) => e['title'] as String).toList();
    print(titles);
    _books.addAll(titles);
    notifyListeners();
  }
}
