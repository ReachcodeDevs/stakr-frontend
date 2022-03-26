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
      home: const Page(title: "Home", child: MyHomePage()),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class Page extends StatelessWidget {
  final Widget child;
  final String title;

  const Page({Key? key, required this.child, required this.title}) : super(key: key);

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: ThemeCard(
            title: "Climate Action", img: 'images/climateaction.jpeg'));
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
