import 'package:flutter/material.dart';
import 'stake_charity_card.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView(children: const <Widget>[
        Text("Stake Breakdown",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
        Image(
            image: AssetImage("images/PortfolioPieChart.png"),
            fit: BoxFit.fill,
            colorBlendMode: BlendMode.modulate),
        SizedBox(height: 30),
        StakeCharityCard(
          title: "Ripple Africa",
          subtitle: "LIFE ON LAND",
          tokens: 40,
          percentage: 40,
          color: 0xff2bfec3,
        ),
        SizedBox(height: 30),
        StakeCharityCard(
            title: "CATF",
            subtitle: "CLIMATE ACTION",
            tokens: 30,
            percentage: 30,
            color: 0xff40ced7),
        SizedBox(height: 30),
        StakeCharityCard(
            title: "EarthJustice",
            subtitle: "INFRASTRUCTURE",
            tokens: 20,
            percentage: 20,
            color: 0xff41dfc1),
        SizedBox(height: 30),
        StakeCharityCard(
            title: "Solar Sister",
            subtitle: "CLIMATE ACTION",
            tokens: 10,
            percentage: 10,
            color: 0xffa0feed),
      ]),
    );
  }
}
