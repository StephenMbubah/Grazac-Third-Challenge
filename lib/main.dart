import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/api.dart';
import 'package:untitled4/screens/sign_in.dart';
import 'package:untitled4/screens/seats.dart';
import 'package:untitled4/screens/sign_up.dart';
import 'package:untitled4/screens/test.dart';
import 'package:untitled4/screens/ticket.dart';
import 'package:untitled4/widgets/ticketview.dart';

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
          ChangeNotifierProvider(create: (_) => testingProvider()),
        ],
      child:MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogIn(),
    ));
  }
}
