class Countries{
  List<Country> items = List();

  Countries();

  Countries.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return ;

    for (var item in jsonList){
      final country = Country.fromJsonMap(item);
      items.add(country);
    }
  }
}

class Country implements Comparable<Country>{
  String name;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;

  Country({
    this.name,
    this.countryCode,
    this.slug,
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.date
  });

  Country.fromJsonMap(Map<String, dynamic> json){
    name                 = json['Country'];
    countryCode          = json['CountryCode'];
    slug                 = json['Slug'];
    newConfirmed         = json['NewConfirmed'];
    totalConfirmed       = json['TotalConfirmed'];
    newDeaths            = json['NewDeaths'];
    totalDeaths          = json['TotalDeaths'];
    newRecovered         = json['NewRecovered'];
    totalRecovered       = json['TotalRecovered'];
    date                 = json['Date'];
  }

  @override
  int compareTo(Country other) {
    return this.totalConfirmed.compareTo(other.totalConfirmed);
  }
}