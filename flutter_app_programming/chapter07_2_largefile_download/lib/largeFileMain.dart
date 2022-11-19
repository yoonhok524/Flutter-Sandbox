import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path_provider/path_provider.dart';

class LargeFileMain extends StatefulWidget {
  const LargeFileMain({super.key});

  @override
  State<LargeFileMain> createState() => _LargeFileMainState();
}

class _LargeFileMainState extends State<LargeFileMain> {
  final imgUrl =
      'https://images.pexels.com/photos/240040/pexels-photo-240040.jpeg?auto=compress';
  bool downloading = false;
  var progressString = '';
  String file = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Large File Example'),
      ),
      body: Center(
        child: downloading
            ? Container(
                height: 120.0,
                width: 200.0,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'downloading file: $progressString',
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ))
            : FutureBuilder(
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text('No data');
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    case ConnectionState.active:
                      return const CircularProgressIndicator();
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        return snapshot.data as Widget;
                      }
                  }

                  return const Text('no data');
                },
                future: downloadWidget(file),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          downloadFile();
        },
        child: const Icon(Icons.download),
      ),
    );
  }

  Future<Widget> downloadWidget(String filePath) async {
    File file = File(filePath);
    bool exist = await file.exists();
    FileImage(file).evict();

    if (exist) {
      return Center(
        child: Column(
          children: [Image.file(File(filePath))],
        ),
      );
    } else {
      return const Text('no data');
    }
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();
      file = '${dir.path}/myimage.jpg';
      await dio.download(
        imgUrl,
        file,
        onReceiveProgress: (count, total) {
          print('count: $count, total: $total');
          setState(() {
            downloading = true;
            progressString = '${((count / total) * 100).toStringAsFixed(0)}%';
          });
        },
      );
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = 'Completed';
    });
    print('Download completed');
  }
}
