import 'package:covid_19_app/src/models/country_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountryVertical extends StatefulWidget {
  List<Country> countries;

  CountryVertical({@required this.countries});

  @override
  _CountryVerticalState createState() => _CountryVerticalState();
}

class _CountryVerticalState extends State<CountryVertical> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.countries.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: FadeInImage(
                image: NetworkImage(
                    getCountryImageUrl(widget.countries[index].countryCode)),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 48.0,
                width: 80.0,
              ),
              title: Text(widget.countries[index].name),
              subtitle: Text('${widget.countries[index].totalConfirmed}'),
              onTap: () {
                _settingModalBottomSheet(context, widget.countries[index]);
              },
            ),
          );
        });
  }

  void _settingModalBottomSheet(context, Country country) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: FadeInImage(
                    image: NetworkImage(
                        getCountryImageUrl(country.countryCode)),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                    height: 40.0,
                    width: 80.0,
                  ),
                  title: Text(country.name, style: TextStyle(color: Colors.blueGrey, fontSize: 24, fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  title: Text('${country.totalConfirmed}', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300)),
                  subtitle: Text('total confirmed'),
                ),
                ListTile(
                  title: Text('${country.totalDeaths}', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300)),
                  subtitle: Text('total deaths'),
                ),
                ListTile(
                  title: Text('${country.totalRecovered}', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300)),
                  subtitle: Text('total recovered'),
                ),
              ],
            ),
          );
        });
  }

  String getCountryImageUrl(String countryCode) {
    return 'https://www.countryflags.io/$countryCode/flat/64.png';
  }
}
