import 'package:flutter/material.dart';
import 'package:untitled4/home_screen.dart';
import 'package:untitled4/sign_in.dart';
import 'package:untitled4/seats.dart';
import 'package:untitled4/sign_up.dart';
import 'package:untitled4/ticket.dart';
import 'package:untitled4/ticketview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicketView(),
    );
  }
}
