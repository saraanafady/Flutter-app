import 'package:flutter/material.dart';
import 'screen.dart';
// import 'screen2.dart';
// import 'screen3.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

var isNightMode = true;
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home:ThisIsScreen(), debugShowCheckedModeBanner: false);
  }
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home:TaskDetailsScreen(), debugShowCheckedModeBanner: false);
//   }
  
  
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home:CreateTaskScreen(), debugShowCheckedModeBanner: false);
//   }

}
