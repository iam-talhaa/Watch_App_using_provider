import 'package:favourite_app_using_provider/provider/fav_provider.dart';
import 'package:favourite_app_using_provider/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => fav_provider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homepage(),
      ),
    );
  }
}
