import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  const HttpApp({super.key});

  @override
  State<HttpApp> createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String? result;
  List? data;
  TextEditingController? _searchController;
  ScrollController? _scrollController;
  int page = 1;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    data = List.empty(growable: true);
    _scrollController = ScrollController();
    _scrollController?.addListener(() {
      if (_scrollController!.offset >=
              _scrollController!.position.maxScrollExtent &&
          !_scrollController!.position.outOfRange) {
        page++;
        getJsonData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
        controller: _searchController,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
            icon: Icon(Icons.search), hintText: 'input search keyword'),
      )),
      body: Center(
        child: data!.isEmpty
            ? const Text(
                'No Data',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )
            : ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return Card(
                      child: Row(
                    children: [
                      Image.network(data![index]['thumbnail'],
                          height: 100, width: 100, fit: BoxFit.contain),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 150,
                            child: Text(
                              data![index]['title'].toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(data![index]['authors'].toString()),
                          Text(data![index]['sale_price'].toString()),
                          Text(data![index]['status'].toString()),
                        ],
                      )
                    ],
                  ));
                },
                itemCount: data!.length,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          page = 1;
          data?.clear();
          getJsonData();
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJsonData() async {
    final url =
        'https://dapi.kakao.com/v3/search/book?query=${_searchController?.text}&page=$page';
    final response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK 7f19fef53eab5da5174279c3cef96300"});
    final result = response.body;
    setState(() {
      final dataConvertedToJson = json.decode(result);
      data?.addAll(dataConvertedToJson['documents']);
    });
    return result;
  }
}
