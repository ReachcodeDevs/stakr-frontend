import 'package:flutter/material.dart';
import 'page.dart' as p;
import 'stake_page.dart';

class ThemeCharityCard extends StatelessWidget {
  const ThemeCharityCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.pounds,
    required this.percentage,
    required this.color,
    this.iconURL = "",
    this.description = "",
    this.url = "",
    this.themes = const [],
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String iconURL;
  final String description;
  final List<String> themes;
  final String url;
  final int pounds;
  final int percentage;
  final int color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(4),
                width: 15.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: Color(color),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 17),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 13),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "£ " + pounds.toString(),
                        style: const TextStyle(fontSize: 17),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        percentage.toString() + "%",
                        style: const TextStyle(fontSize: 13),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
              // const SizedBox(width: 10),
              Column(
                children: const [
                  Icon(
                    Icons.chevron_right,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => p.Page(
                    child: StakePage(
                        title: title,
                        subtitle: subtitle,
                        iconURL: iconURL,
                        description: description,
                        themes: themes,
                        url: url),
                    title: title,
                  )),
        );
      },
    );
  }
}
