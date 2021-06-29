import 'dart:convert';
import 'package:covidtracker/constants/constants.dart';
import 'package:http/http.dart' as http;

abstract class Networking {
  //this class will
  //we are going to have two apis for the globe and for the
  //specific countries
  //this abstract class has a method fecth api
  Future<http.Response> fetchFromApi();
}

class GlobeNetworking extends Networking {
  var globaldata;
  //get data for the whole world

  @override
  Future<http.Response> fetchFromApi() async {
    var fetchedDatajsonResponse = await http.get(
      //get the data for the globe asyncronously
      Uri.https(apiUrl, apiPath),
    );

    globaldata = fetchedDatajsonResponse.body;

    if (fetchedDatajsonResponse.statusCode == 200) {
      //decode the fetched data in a json format
      globaldata = await jsonDecode(globaldata);
      //print(globaldata);
      return globaldata;
    } else {
      return throw Exception('Failed to load data in json format');
    }
  }
}

class CountryNetworking extends Networking {
  var countrydata;
  @override
  Future<http.Response> fetchFromApi() async {
    // ignore: todo
    // TODO: implement fetchFromApi
    //throw UnimplementedError();
    var fetchedDataJsonCountryReaponse = await http.get(
      //fetch data for all countries in the world
      Uri.https(apiUrl, apiPathCountries),
    );

    countrydata = fetchedDataJsonCountryReaponse.body;

    if (fetchedDataJsonCountryReaponse.statusCode == 200) {
      countrydata = await jsonDecode(countrydata);
      //print(countrydata);
      return await countrydata;
      //s=true;
    } else {
      print(fetchedDataJsonCountryReaponse.statusCode);
      return throw Exception('Failed to load json format');
    }
  }
}
