import 'portfolio_page.dart';
import 'theme_page.dart';
import 'theme_card.dart';
import 'page.dart' as p;
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const p.Page(
                              child: PortfolioPage(),
                              title: "Portfolio",
                            )),
                  );
                },
                child: const Image(
                  image: AssetImage("images/Rectangle5.png"),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Text("Total Donated "),
                        Container(
                          child: RichText(
                              text: const TextSpan(children: [
                            WidgetSpan(
                                child: Icon(
                              Icons.currency_pound_rounded,
                              size: 30,
                            )),
                            TextSpan(
                                text: "365",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 32)),
                          ])),
                          margin: const EdgeInsets.all(10),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Tokens Staked"),
                        Container(
                          child: RichText(
                              text: const TextSpan(children: [
                            WidgetSpan(
                                child: Icon(
                              Icons.token,
                              size: 30,
                            )),
                            TextSpan(
                                text: "100",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 32)),
                          ])),
                          margin: const EdgeInsets.all(10),
                        )
                      ],
                    ),
                  ],
                ),
                width: 210,
                height: 100,
              )
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
  final List<Theme> themes;
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
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => p.Page(
                                child: ThemePage(
                                    theme: widget.themes[index].title),
                                title: "Theme Breakdown",
                              )),
                    );
                  },
                  child: ThemeCard(
                    title: widget.themes[index].title,
                    img: widget.themes[index].img,
                  ));
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
