import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';

import '../model/Book.dart';

class BooksRepository {
  Future<List<Book>> getBooks() async {
    const url = 'https://dapi.kakao.com/v3/search/book?target=title&query=doit';
    var response = await get(Uri.parse(url),
        headers: {'Authorization': 'KakaoAK 7f19fef53eab5da5174279c3cef96300'});
    final List data = json.decode(response.body)['documents'];
    return data.map((item) => Book.fromMap(item)).toList();
  }
}
