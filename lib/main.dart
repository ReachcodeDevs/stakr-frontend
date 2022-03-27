import 'package:flutter/material.dart';

void main() {
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
      children: const <Widget>[
        SizedBox(
          height: 200,
          child: Card(),
        ),
        ThemeCategory(themeName: "Environment",),
        ThemeCategory(themeName: "Health and Social",),
        ThemeCategory(themeName: "Growth",),
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
    return Column(
      children: [
        Text(widget.themeName),
        ListView(shrinkWrap: true, children: const <Widget>[
          Text("Hello")
        ])]
    );
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
            style: const TextStyle(color: Colors.white, fontSize: 50),
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
