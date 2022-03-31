import 'package:flutter/material.dart';
import 'map.dart';

class StakePage extends StatefulWidget {
  const StakePage(
      {Key? key,
      required this.title,
      required this.url,
      required this.iconURL,
      required this.subtitle,
      required this.description,
      required this.themes})
      : super(key: key);

  final String url;
  final String title;
  final String iconURL;
  final String subtitle;
  final String description;
  final List<String> themes;
  @override
  State<StakePage> createState() => _StakePageState();
}

class _StakePageState extends State<StakePage> {
  double totalTokens = 100;
  double totalStaked = 40;
  double staking = 0;
  Color color = const Color(0xff65cab1);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            widget.subtitle,
          ),
          const SizedBox(height: 10),
          Text(
            widget.url,
            style: const TextStyle(
                color: Color(0xff22bb92), decoration: TextDecoration.underline),
          ),
          const SizedBox(height: 20),
          Text(widget.description),
          const SizedBox(height: 20),
          const SizedBox(
            height: 300,
            child: GMap(
              lat: -1.317086068764227,
              long: 36.718012034704934,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Features in:",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 80,
            child: ListView.builder(
                itemCount: widget.themes.length,
                itemBuilder: ((context, index) => Row(
                      children: [
                        const Icon(Icons.chevron_right),
                        Text(widget.themes[index]),
                      ],
                    ))),
          ),
          Text("Tokens staked: " + totalStaked.toInt().toString(), style: const TextStyle(fontSize: 16),),
          const SizedBox(height: 20),
          Text("Staking: " + staking.toInt().toString(), style: const TextStyle(fontSize: 16)),
          Slider(
            value: staking,
            min: -totalStaked,
            max: totalTokens,
            divisions: (100 + totalStaked.toInt()),
            activeColor: color,
            inactiveColor: const Color(0xffc4c4c4),
            onChanged: (double value) {
              setState(() {
                staking = value;
                if (value < 0) {
                  color = const Color(0xffcb3c3c);
                } else {
                  color = const Color(0xff65cab1);
                }
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
                    onPressed: () {
                      setState(() {
                        totalStaked += staking.toInt();
                        totalTokens -= staking.toInt();
                        staking = 0;
                      });
                    },
                    child: Text("Stake " + staking.toInt().toString(),
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
        ],
      ),
    );
  }
}
