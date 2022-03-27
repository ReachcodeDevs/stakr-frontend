import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/painting.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'theme_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stakr',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Montserrat'
      ),
      home: const Page(title: "Home", child: HomePage()),
    );
  }
}

class Page extends StatelessWidget {
  final Widget child;
  final String title;

  const Page({Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: child,
    );
  }
}

// class Page extends State {
//   final String title;
//   final Widget child;

//   const Page({Key? key, required this.title, required this.child})
//       : super(key: key);

//   @override
//   State<Page> createState() => _PageState();
// }

// class _PageState extends State<Page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: widget.child,
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage("images/Rectangle5.png"),
                  fit: BoxFit.contain,
              ),
              Column(children: [
                Text("Your Portfolio"),
                Text("Total Donated"),
                Text("Tokens Staked"),
              ],
              )],
          ),
        ),
        const ThemeCategory(
          themeName: "Environment",
        ),
        const ThemeCategory(
          themeName: "Health and Social",
        ),
        const ThemeCategory(
          themeName: "Growth",
        ),
      ],
    );
  }
}

class ThemeCategory extends StatefulWidget {
  final String themeName;
  const ThemeCategory({Key? key, required this.themeName}) : super(key: key);

  @override
  State<ThemeCategory> createState() => _ThemeCategoryState();
}

class _ThemeCategoryState extends State<ThemeCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Text(widget.themeName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(10),
      ),
      Container(
        child: ListView(
          shrinkWrap: true,
          children: const <Widget>[
            ThemeCard(title: "Climate Action", img: "images/climateAction.jpg"),
            ThemeCard(title: "Life On Land", img: "images/lifeOnLand.jpg"),
            ThemeCard(title: "Clean Energy", img: "images/cleanEnergy.jpg"),
            ThemeCard(title: "Education", img: "images/education.jpg"),
            ThemeCard(title: "Food Poverty", img: "images/foodPoverty.jpg"),
            ThemeCard(title: "Water & Sanitation", img: "images/water.jpg"),
          ],
          scrollDirection: Axis.horizontal,
        ),
        height: 100,
        width: MediaQuery.of(context).size.width,
      )
    ]);
  }
}