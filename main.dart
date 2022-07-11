import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:takfoodowner/pages/home_app.dart';
import 'package:takfoodowner/pages/add_product_page.dart';
import 'package:takfoodowner/pages/splash_screen.dart';
import 'package:takfoodowner/providercontroller/order_controller.dart';
import 'package:takfoodowner/providercontroller/owner_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<OwnerProvider>(
        create: (_) => OwnerProvider(),
      ),
      ChangeNotifierProvider<OrderController>(
        create: (_) => OrderController(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "mesysam_app",
      theme: ThemeData(
        fontFamily: 'iy',
        primaryColor: const Color(0xfffd5e63),
        colorScheme: const ColorScheme.light(primary: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        primaryTextTheme: const TextTheme(headline1: TextStyle(color: Colors.black)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(selectedItemColor: Color(0xfffd5e63)),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const  SplashScreen(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("fa", "IR"),
      ],
      locale: const Locale("fa", "IR"),
    );
  }
}
