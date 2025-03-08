import 'package:flutter/material.dart';

// Provider
import 'package:app/providers/ProviderTemplate.dart';
import 'package:provider/provider.dart';

// Components
import 'package:app/component/Home.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderTemplate()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => Scaffold(),
        '/signup': (context) => Scaffold(),
        '/dashboard': (context) => Scaffold(),
      },
    );
  }
}
