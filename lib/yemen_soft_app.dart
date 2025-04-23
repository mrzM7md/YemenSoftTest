import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/routes/router.dart';
import 'core/values/colors.dart';

class YemenSoftApp extends StatelessWidget {
  const YemenSoftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "يمن سوفت - محمد الزمير",
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
          textTheme: TextTheme() ,
          // fontFamily: "Amiri",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
          scaffoldBackgroundColor: Color(backgroundColor),
          appBarTheme: const AppBarTheme(color: Colors.black),
    ));
  }
}
