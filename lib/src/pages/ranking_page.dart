import 'package:covid_19_app/src/models/country_model.dart';
import 'package:covid_19_app/src/providers/countries_provider.dart';
import 'package:covid_19_app/src/widgets/country_vertical.dart';
import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage>
    with AutomaticKeepAliveClientMixin<RankingPage> {
  final countriesProvider = CountriesProvider();
  List<Country> _countries = List();

  _loadCountries() async {
    _countries = await countriesProvider.getCountries();
    _countries.sort();
    _countries = _countries.reversed.toList();
    setState(() {});
  }

  @override
  void initState() {
    _loadCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('ranking');
    return Scaffold(
      body: _countriesConfirmed0(),
      floatingActionButton: FloatingActionButton(
        onPressed: _reorder,
        child: Icon(Icons.reorder),
        backgroundColor: Color(0xff379982),
      ),
    );
  }

  Widget _countriesConfirmed0() {
    if (_countries.isNotEmpty) {
      return CountryVertical(countries: _countries);
    } else
      return Container(
          height: 400.0,
          child: Center(
            child: CircularProgressIndicator(),
          ));
  }

  void _reorder() {
    setState(() {
      _countries = _countries.reversed.toList();
      print('first country => ${_countries[0].name}');
    });
  }

  Widget _countryVertical(List<Country> countries) {
    return ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: FadeInImage(
                image: NetworkImage(
                    _getCountryImageUrl(countries[index].countryCode)),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 48.0,
                width: 80.0,
              ),
              title: Text(countries[index].name),
              subtitle: Text('${countries[index].totalConfirmed}'),
              onTap: () => {},
            ),
          );
        });
  }

  String _getCountryImageUrl(String countryCode) {
    return 'https://www.countryflags.io/$countryCode/flat/64.png';
  }

  Widget _countriesConfirmed() {
    return FutureBuilder(
      future: countriesProvider.getCountries(),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          _countries = snapshot.data;
          _countries.sort();
          _countries = _countries.reversed.toList();
          return _countryVertical(_countries);
        } else {
          return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator(),
              ));
        }
      },
    );
  }

  Widget _countriesConfirmed2() {
    return _countryVertical(_countries);
  }

  @override
  bool get wantKeepAlive => true;
}
