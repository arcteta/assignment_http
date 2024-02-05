import 'package:assignment_http/controller/provider.dart';
import 'package:assignment_http/models/user_model.dart';
import 'package:assignment_http/pages/main_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProviderApp())],
      child: const MaterialApp(
        home: Scaffold(
          body: MainScreenUI(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
