import 'package:flutter/material.dart';
import 'theme_charity_card.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key, required this.theme}) : super(key: key);

  final String theme;

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  double total = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: ListView(children: <Widget>[
          Text(widget.theme,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          const SizedBox(height: 30),
          const Text("Total value", style: TextStyle(fontSize: 24)),
          Text("£ " + total.toString(), style: const TextStyle(fontSize: 24)),
          // const SizedBox(height: 30),
          Slider(
            value: total,
            min: 0,
            max: 1000,
            divisions: 100,
            activeColor: const Color(0xff65cab1),
            inactiveColor: const Color(0xffc4c4c4),
            onChanged: (double value) {
              setState(() {
                total = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              semanticContainer: false,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: const Color(0xff65cab1),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextButton(
                    onPressed: () {},
                    child: Text("Donate £ " + total.toString(),
                        style: const TextStyle(
                            fontSize: 24, color: Colors.white))),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(10),
            ),
          ),

          const SizedBox(height: 30),
          ThemeCharityCard(
            title: "African Wildlife Foundation",
            subtitle: "Conserving african wildlife",
            pounds: (40 * 0.01 * total).toInt(),
            percentage: 40,
            color: 0xff2bfec3,
            description:
                "African Wildlife Foundation’s mission is to ensure wildlife and wild lands thrive in modern Africa. AWF targets large areas of land and implement a variety of conservation initiatives, all of which are centered around three specific areas: land, wildlife and people (including education and enterprise). AWF also incorporates climate change adaptation and mitigation efforts into many of their projects.",
            themes: const [
              "Climate Action",
              "Life on Land",
            ],
            url: "https://www.awf.org",
          ),
          const SizedBox(height: 30),
          ThemeCharityCard(
            title: "WaterAid",
            subtitle: "Ending Water Crisis",
            pounds: (40 * 0.01 * total).toInt(),
            percentage: 40,
            color: 0xff2bfec3,
          ),
          const SizedBox(height: 30),
          ThemeCharityCard(
            title: "Ripple Africa",
            subtitle: "Carbon Negative Companies",
            pounds: (20 * 0.01 * total).toInt(),
            percentage: 20,
            color: 0xff2bfec3,
          ),
        ]));
  }
}
