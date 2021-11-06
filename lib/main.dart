import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'app/controllers/auth_controller.dart';
import 'app/utils/error_screen.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/loading_screen.dart';
import 'app/utils/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshots) {
        if (snapshots.hasError) {
          return ErrorScreen();
        }
        if (snapshots.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Chat App",
            initialRoute: Routes.LOGIN,
            getPages: AppPages.routes,
          );
          // return FutureBuilder(
          //   future: Future.delayed(
          //     Duration(seconds: 3),
          //   ),
          //   builder: (context, snapshots) {
          //     if (snapshots.connectionState == ConnectionState.done) {
          //       return Obx(
          //         () => GetMaterialApp(
          //           debugShowCheckedModeBanner: false,
          //           title: "Chat App",
          //           initialRoute: authC.isSkipIntro.isTrue
          //               ? authC.isAuth.isTrue
          //                   ? Routes.HOME
          //                   : Routes.LOGIN
          //               : Routes.INTRODUCTION,
          //           getPages: AppPages.routes,
          //         ),
          //       );
          //     }
          //     return SplashScreen();
          //   },
          // );
        }
        return LoadingScreen();
      },
    );
  }
}
