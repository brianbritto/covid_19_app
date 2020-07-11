import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covid_19_app/src/models/country_model.dart';

class CountriesProvider {
  String _apikey = '';
  String _url = 'api.covid19api.com';
  String _language = 'es-ES';

  bool _loading = false;

  List<Country> _countries = List();
  final _countriesStreamController =
      StreamController<List<Country>>.broadcast();

  Function(List<Country>) get countriesSick =>
      _countriesStreamController.sink.add;

  Stream<List<Country>> get countriesStream =>
      _countriesStreamController.stream;

  void disposeStreams() {
    _countriesStreamController?.close();
  }

  Future<List<Country>> _procesarAnswer(Uri url) async {
    final answer = await http.get(url);
    final decodedData = json.decode(answer.body);

    final countries = Countries.fromJsonList(decodedData['Countries']);

    return countries.items;
  }

  Future<List<Country>> getCountries() async {

    final url = Uri.https(_url, 'summary', {
      //'api_key' : _apikey,
      'language': _language,
    });

    return _procesarAnswer(url);
  }

  /*Future<List<Country>> getCountries() async {
    if (_loading) return [];

    _loading = true;
    final url = Uri.https(_url, 'summary', {
      //'api_key' : _apikey,
      'language': _language,
    });

    final ans = await _procesarAnswer(url);

    _countries.addAll(ans);
    countriesSick(_countries);

    _loading = false;
    return ans;

  }*/
}
