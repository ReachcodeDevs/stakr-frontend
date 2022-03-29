import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Montserrat'),
      home: const Page(title: "Home", child: HomePage()),
      routes: <String, WidgetBuilder>{
        '/portfolio': (BuildContext context) => const Page(child: PortfolioPage(), title: "Stake Breakdown"),
        '/theme': (BuildContext context) => const Page(child: ThemePage(), title: ""),
        '/stake':(BuildContext context) => const Page(child: StakePage(), title: "",),
        '/donations': (BuildContext context) => const Page(child: DonationsPage(), title: "Donation History",)
      },
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Donations',
            backgroundColor: Colors.grey,
          ),
        ],
        ),
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
              const Image(
                image: AssetImage("images/Rectangle5.png"),
                fit: BoxFit.contain,
              ),
              SizedBox(child: Row(
                children: [
                  Column(children: [
                    const Text("Total Donated "),
                    Container(child: RichText(text: 
                    const TextSpan(children: 
                    [
                      WidgetSpan(child: Icon(Icons.currency_pound_rounded, size: 20,)),
                      TextSpan(text: "365", style: TextStyle(color: Colors.white)),
                    ])), margin: const EdgeInsets.all(10),) 
                  ],),
                   Column(children: [
                    const Text("Tokens Staked"),
                    Container(child: RichText(text: 
                    const TextSpan(children: 
                    [
                      WidgetSpan(child: Icon(Icons.token, size: 20,)),
                      TextSpan(text: "100", style: TextStyle(color: Colors.white)),
                    ])), margin: const EdgeInsets.all(10),) 
                  ],),
                ],
              ),
              width: 210,
              height: 100,)
            ],
          ),
        ),
        ThemeCategory(themeName: "Environment", themes: [
          Theme("Climate Action", "images/climateAction.jpg"),
          Theme("Life On Land", "images/lifeOnLand.jpg"),
          Theme("Clean Energy", "images/cleanEnergy.jpg")
        ]),
        ThemeCategory(themeName: "Health and Social", themes: [
          Theme("Education", "images/education.jpg"),
          Theme("Food Poverty", "images/foodPoverty.jpg"),
          Theme("Water & Sanitation", "images/water.jpg")
        ]),
        ThemeCategory(themeName: "Growth", themes: [
          Theme("Creating Jobs", "images/creatingJobs.jpg"),
          Theme("Infra-Structure", "images/infrastructure.jpg"),
          Theme("Innovation", "images/innovation.jpg")
        ]),
      ],
    );
  }
}

class Theme {
  String title;
  String img;
  Theme(this.title, this.img);
}

class ThemeCategory extends StatefulWidget {
  final String themeName;
  final List themes;
  const ThemeCategory({Key? key, required this.themeName, required this.themes})
      : super(key: key);

  @override
  State<ThemeCategory> createState() => _ThemeCategoryState();
}

class _ThemeCategoryState extends State<ThemeCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Column(children: [
        Container(
          child: Text(widget.themeName,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
        ),
        SizedBox(
          child: ListView.builder(
            itemCount: widget.themes.length,
            itemBuilder: (context, index) {
              return ThemeCard(
                title: widget.themes[index].title,
                img: widget.themes[index].img,
              );
            },
            scrollDirection: Axis.horizontal,
          ),
          height: 100,
          width: MediaQuery.of(context).size.width - 10,
        )
      ]),
    );
  }
}


class PortfolioPage extends StatelessWidget {
  const PortfolioPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class ThemePage extends StatelessWidget {
  const ThemePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class StakePage extends StatelessWidget {
  const StakePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class DonationsPage extends StatelessWidget {
  const DonationsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}