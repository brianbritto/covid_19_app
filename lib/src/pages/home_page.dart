import 'package:covid_19_app/src/pages/indicator_page.dart';
import 'package:covid_19_app/src/pages/ranking_page.dart';
import 'package:covid_19_app/src/widgets/circle_tab_indicator.dart';
import 'package:flutter/material.dart';

const kMainColor = Color(0xFF573851);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('App COVID-19', style: TextStyle(color: kMainColor)),
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicator: CircleTabIndicator(color: kMainColor, radius: 3),
            tabs: <Widget>[
              Tab(
                  child: Text(
                'Ranking',
                style: TextStyle(color: kMainColor),
              )),
              Tab(
                  child: Text(
                'Indicator',
                style: TextStyle(color: kMainColor),
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            RankingPage(),
            IndicatorPage(),
          ],
        ),
      ),
    );
  }
}
