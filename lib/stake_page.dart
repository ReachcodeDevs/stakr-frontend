import 'package:flutter/material.dart';

class StakePage extends StatefulWidget {
  const StakePage(
      {Key? key,
      this.staked = 15,
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
  final int staked;
  @override
  State<StakePage> createState() => _StakePageState();
}

class _StakePageState extends State<StakePage> {
  double totalTokens = 40;
  double staking = 0;
  Color color = const Color(0xff65cab1);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Text(widget.subtitle),
          Text(
            widget.url,
            style: const TextStyle(color: Colors.blue),
          ),
          Text(widget.description),
          const Text("Features in:"),
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
          Text("Tokens staked: " + staking.toInt().toString()),
          Slider(
            value: staking,
            min: -widget.staked.toDouble(),
            max: 100,
            divisions: (100 + widget.staked),
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
          )
        ],
      ),
    );
  }
}
