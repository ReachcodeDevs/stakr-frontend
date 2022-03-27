import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      theme: ThemeData.dark(),
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
              const Image(image: AssetImage("images/Rectangle5.png"), fit: BoxFit.contain,),
            ],
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
        child: Text(widget.themeName),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(10),
      ),
      Container(
        child: ListView(
          shrinkWrap: true,
          children: const <Widget>[
            ThemeCard(title: "Example", img: "images/climateaction.jpeg"),
            ThemeCard(title: "Example2", img: "images/ex2.png")
          ],
          scrollDirection: Axis.horizontal,
        ),
        height: 100,
        width: 350,
      )
    ]);
  }
}

class ThemeCard extends StatelessWidget {
  const ThemeCard({Key? key, required this.title, required this.img})
      : super(key: key);

  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image(
              image: AssetImage(img),
              fit: BoxFit.fill,
              color: const Color.fromRGBO(255, 255, 255, 0.5),
              colorBlendMode: BlendMode.modulate),
          // const Flexible(
          //   child: Text('Add long text here',
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 50
          //     ),
          //     maxLines: 2,
          //     softWrap: false,
          //     overflow: TextOverflow.visible,
          //     ),
          // ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
    );
  }
}
