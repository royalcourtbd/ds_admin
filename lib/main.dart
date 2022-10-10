import 'package:ds_admin/bindings/all_controller_binding.dart';
import 'package:ds_admin/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'general/routes/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DS Admin',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: HomePageView(),
      initialRoute: RoutesClass.getHomePageRoute(),
      getPages: RoutesClass.routes,
      initialBinding: AllControllerBinding(),
    );
  }
}
