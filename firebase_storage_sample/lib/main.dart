import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var imageUrl = '';
  final storage = FirebaseStorage.instanceFor(
      bucket: 'gs://email-link-auth-sample-95a4a.appspot.com');

  @override
  void initState() {
    super.initState();
    getBackgroundImage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl), // 배경 이미지
        ),
      ),
    );
  }

  void getBackgroundImage() async {
    await storage.ref().child("1.jpg").getDownloadURL().then((value) {
      print('url: $value');
      setState(() {
        imageUrl = value;
      });
    });
  }
}
