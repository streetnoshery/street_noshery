import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/firebase_options.dart';
import 'package:street_noshery/onboarding/views/street_noshery_first_view.dart';
import 'package:street_noshery/routes/app_pages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppLinks appLink = AppLinks();
  final sub = appLink.uriLinkStream.listen((uri) {
    log("printing uri: ${uri.toString()}");
    print("printing uri : ${uri.toString()}");
    log("URI: ${uri.toString()}");
  });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter(); // Initializes Hive with Flutter bindings
  await Hive.openBox('myBox'); // Open a box named 'myBox'
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        getPages: Pages.routes);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("_MyHomePageState class running: print");
    return const StreetNosheryHeartbeatScreen();
  }
}
