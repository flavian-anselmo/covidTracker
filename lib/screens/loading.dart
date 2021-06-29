import 'package:covidtracker/components/spinner.dart';
import 'package:covidtracker/constants/constants.dart';
import 'package:covidtracker/networking/networking.dart';
import 'package:covidtracker/screens/liveupdates.dart';
import 'package:flutter/material.dart';

///object instances
///used to acces the the data fetched form the apis
GlobeNetworking globaldata = GlobeNetworking();
CountryNetworking countryNet = CountryNetworking();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var globalCovidData; //stores corona global data
  var countryCovidData; //stores corona local country data

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    // navigate to the next screen afterfetching the data
    //when the app loads this will be the first function
    //to load the data to the appp form the api

    super.initState();

    ///has all the fuctions that fetch data form the api 
    fetch();
  }
  // ignore: todo
  ///TODO:how to check the internetconnection and display another screen 
  // ignore: todo
  ///TODO:make sure it can be there is internet if not notify the user 
  ///Tif there is no internt connection notify the user to retry 
  ///
  ///

  ///fetch global data
  Future<void> fetchformAPI() async {
    ///this asynchronous function loads the data asynchronously
    ///the fucntion initialises the data as a json file 
    ///to the specified class prperties 
    ///
    try {
      await globaldata.fetchFromApi(); //get for globe
      globalCovidData = await globaldata.globaldata;
      //s = true;
    } catch (e) {
      globalCovidData = await globaldata.globaldata; //json data for global case
      // print(globalCovidData);
    }
    //PASS DATA TO THE NEXT SCREEN
    ///take the data in json format and forward it to the next screen
    ///this happens after loading the screen 
    ///both the countr data and the global data 
    ///this data will be manipulated in the next screen 
    ///by dislaying it in rela time 
    ///sent through a constractor in the next screen 
    ///as the data is forwarded the app moves tothe next screen
    ///auotomaticaly 
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          //open this screen with the global data
          return GetLiveUpdates(
            //go to the next screen liveupdates
            globalDataForCorona:
                globalCovidData, //pass global data to the next screen
            countryDataForCorona:
                countryCovidData, //pass countrydata to the next screen
          );
        },
      ),
    );
  }

  ///fetch data for country
  Future<void> fetchFromAPIcountry() async {
    ///used to fetch country datta 
    ///this si fetch asynchronously 
    ///this fucntion return a future 
    ///
    try {
      await countryNet.fetchFromApi(); //fetch datafor countries
      countryCovidData = await countryNet.countrydata;
      //s = true;
    } catch (e) {
      countryCovidData = await countryNet.countrydata;
      //print(countryCovidData);
      
    }
  }

  Future<void> fetch() async {
    ///calls all the functions
    ///asynchronously 
    await fetchFromAPIcountry(); //get countrydata
    await fetchformAPI(); //fetch the global data
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          //this will have an image  together with a spinner for loading data in json
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/loading4.jpg'),
              fit: BoxFit.cover,
            ),
          ),

          //this will spin to allow the app to get the json data form web servers
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Covid19Tracker',
                  style: ktxtsizeheaders,
                ),
                //SPINNER WIDGET
                Spin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
