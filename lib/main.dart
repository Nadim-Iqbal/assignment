import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'firebase_options.dart';

import 'app/helpers/firebase_option.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  // Future<void> initializeDefaultFromAndroidResource() async {
    // if (defaultTargetPlatform != TargetPlatform.android || kIsWeb) {
    //   print('Not running on Android, skipping');
    //   return;
    // }
  //   FirebaseApp app = await Firebase.initializeApp();
  //   print('Initialized default app $app from Android resource');
  // }
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
