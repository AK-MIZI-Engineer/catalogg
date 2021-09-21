import 'package:flutter/material.dart';
import 'package:flutter_cataloge/pages/hompage.dart';
import 'package:flutter_cataloge/pages/login.dart';
import 'package:flutter_cataloge/theme.dart';
import 'package:flutter_cataloge/utils/routes.dart';

void main(List<String> args) {
  runApp(practiceApp());
}

class practiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context), darkTheme: MyTheme.darkTheme(context),
      // theme: ThemeData(
      //   primarySwatch: Colors.green,
      //   fontFamily: GoogleFonts.lato().fontFamily,
      //   appBarTheme: AppBarTheme(
      //     color: Colors.blue,
      //     elevation: 0.0,
      //     iconTheme: IconThemeData(color: Colors.black),
      //     textTheme: Theme.of(context).textTheme,
      //   )
      // ),

      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   primarySwatch: Colors.amber,
      //   fontFamily: GoogleFonts.lato().fontFamily,
      //   primaryTextTheme: GoogleFonts.latoTextTheme(),
      // ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeroute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeroute: (context) => HomePage(),
        MyRoutes.longRoute: (context) => LoginPage(),
      },
    );
  }
}
