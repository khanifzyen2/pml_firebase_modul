import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'app/utils/error_page.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/loading_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshots) {
        if (snapshots.hasError) {
          return ErrorPage();
        }
        if (snapshots.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Chat App",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        }
        return LoadingPage();
      },
    );
  }
}
