import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'home_page.dart';
import 'portfolio_page.dart';
import 'donations_page.dart';
import 'page.dart' as p;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  runApp(const AuthGate());
}

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
              title: "Stakr",
              theme: ThemeData(
                  brightness: Brightness.dark, fontFamily: 'Montserrat'),
              home: const SignInScreen(
                providerConfigs: [
                  EmailProviderConfiguration(),
                  GoogleProviderConfiguration(
                      clientId: "1:43501228528:web:0d1651f94bb2bc8ab8cd35")
                ],
              ));
        }

        // Render your application if authenticated
        return const TheApp();
      },
    );
  }
}

class TheApp extends StatelessWidget {
  const TheApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stakr',
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Montserrat'),
      home: const p.Page(title: "Home", child: HomePage()),
      routes: <String, WidgetBuilder>{
        '/portfolio': (BuildContext context) =>
            const p.Page(child: PortfolioPage(), title: "Stake Breakdown"),
        // '/theme': (BuildContext context) =>
        //     const Page(child: ThemePage(), title: ""),
        // '/stake': (BuildContext context) => const p.Page(
        //       child: StakePage(),
        //       title: "",
        //     ),
        '/donations': (BuildContext context) => const p.Page(
              child: DonationsPage(),
              title: "Donation History",
            )
      },
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return const SignInScreen(
      providerConfigs: [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(
            clientId: "1:43501228528:web:0d1651f94bb2bc8ab8cd35"),
      ],
    );
  }
}
