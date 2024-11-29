import 'package:flutter/material.dart';
import 'package:orders_app/view/onboarding_view.dart';
import 'package:orders_app/view_model/order_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => OrderViewModel()..readJson(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Orders App',
        debugShowCheckedModeBanner: false,
        home: OnBoardingView());
  }
}
