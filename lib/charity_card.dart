import 'package:flutter/material.dart';

class CharityCard extends StatelessWidget {
  const CharityCard({Key? key, required this.title, required this.subtitle, required this.tokens, required this.percentage, required this.color})
      : super(key: key);

  final String title;
  final String subtitle;
  final int tokens;
  final int percentage;
  final int color;


  @override
  Widget build(BuildContext context) {
    return Row(
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
                  style: const TextStyle(fontSize:20),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  subtitle,
                  style: const TextStyle(fontSize:16),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.token,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  tokens.toString(),
                  style: const TextStyle(fontSize:20),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  percentage.toString() + "%",
                  style: const TextStyle(fontSize:16),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
