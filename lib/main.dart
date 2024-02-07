import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/login/login_page.dart';
import 'package:udemy_flutter_delivery/src/pages/register/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print('Usuario id: ${userSession}, ');

    return GetMaterialApp(
      title: 'HkTest',
      debugShowCheckedModeBanner: false ,
      //initialRoute: '/',
      //initialRoute: userSession.id != null ? '/home' :  '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        //GetPage(name: '/home', page: () => HomePage())
      ],
      theme: ThemeData(
        primaryColor: Colors.amber,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.amber,
          onPrimary: Colors.grey,
          secondary: Colors.amberAccent,
          onSecondary: Colors.grey,
          error:Colors.grey,
          onError: Colors.grey,
          background: Colors.white,
          onBackground: Colors.grey,
          surface: Colors.amber,
          onSurface: Colors.grey,
        ),
      ),
      navigatorKey: Get.key,
    );
  }
}