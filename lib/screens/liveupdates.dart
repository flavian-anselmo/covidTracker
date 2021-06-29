
import 'package:covidtracker/components/reusablecards.dart';
import 'package:covidtracker/constants/constants.dart';
import 'package:covidtracker/screens/learnmore.dart';
import 'package:flutter/material.dart';

class GetLiveUpdates extends StatefulWidget {
  //get the data from the loading screen
  //the parameters are initilised with data
  //in the loading screen

  GetLiveUpdates({this.globalDataForCorona, this.countryDataForCorona});
  final globalDataForCorona;
  final countryDataForCorona;
  @override
  _GetLiveUpdatesState createState() => _GetLiveUpdatesState();
}

class _GetLiveUpdatesState extends State<GetLiveUpdates> {
  //GLOBAL DETAILS
  late int globalcases = 0;
  late int globalrecoveredCases = 0;
  late int globalDeath = 0;

  //COUNTRY DETAILS
  String countryName = '';
  int countrycases = 0;
  int countryrecovered = 0;
  int countrydeath = 0;
  int countryindx = 0;
  String countryFlag = 'https://disease.sh/assets/img/flags/af.png';
  String userEntry = 'Afganistan';
  List<String> userinput = []; //used in the validation algo
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    //load the json file when the app is started
    //
    updateUIWithGlobalData(widget.globalDataForCorona);
    updateUIWithCountryData(widget.countryDataForCorona);
  }

  void updateUIWithGlobalData(var coronaGlobalData) {
    //acesss global data
    //initilise data form the json file
    //this is the global data
    try {
      globalcases = coronaGlobalData['cases'];
      globalrecoveredCases = coronaGlobalData['recovered'];
      globalDeath = coronaGlobalData['deaths'];
    } catch (e) {
      print(e);
    }
  }

  void updateUIWithCountryData(var coronaCountryData) {
    //ACCESS country data
    //this is the country data
    //accessed for the json file

    try {
      countryName = coronaCountryData[countryindx]['country'];
      countrycases = coronaCountryData[countryindx]['cases'];
      countryrecovered = coronaCountryData[countryindx]['recovered'];
      countrydeath = coronaCountryData[countryindx]['deaths'];
      countryFlag = coronaCountryData[countryindx]['countryInfo']['flag'];
    } catch (e) {
      print(e);
    }
  }

  void userInputValidation() {
    //print(userEntry);
    //check if the first letter is uppercase
    //if yes add it to the list
    //then change the rest to lowercase
    //if lower case  change to upper
    //and the rest to lower

    if (userEntry[0] == userEntry[0].toUpperCase()) {
      userinput.add(userEntry[0]);
      for (int i = 1; i < (userEntry.length); i++) {
        userinput.add(userEntry[i].toLowerCase());
      }
    } else if (userEntry[0] == userEntry[0].toLowerCase()) {
      for (int i = 0; i < (userEntry.length); i++) {
        userinput.add(userEntry[i].toLowerCase());
      }
      userinput[0] = userinput[0].toUpperCase();
    }
    userEntry = userinput.join();
    userEntry = userEntry.trim(); //remove all spacess
  }

  void searchForCountry(var coronaSearchCountryData) {
    print(userEntry);
    //this is a linear search algorith
    //intergrate a faster algo like binary search
    userInputValidation(); //validate user input

    if (userEntry == userinput.join()) {
      for (int idxR = 0; idxR < coronaSearchCountryData.length; idxR++) {
        if (coronaSearchCountryData[idxR]['country'] == userEntry) {
          countryName = coronaSearchCountryData[idxR]['country'];
          countrycases = coronaSearchCountryData[idxR]['cases'];
          countryrecovered = coronaSearchCountryData[idxR]['recovered'];
          countrydeath = coronaSearchCountryData[idxR]['deaths'];
          countryFlag = coronaSearchCountryData[idxR]['countryInfo']['flag'];
          print('found');
        } else {
          print('notfound');
          //return;
        }
      }
    } else {
      return;
    }
  }

  AlertDialog checktextfield() {
    return AlertDialog(
      title: Text('Enter a country name'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Ok'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //inside this contaner i will have images rows and columns
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                //this will have an image  together with a spinner for loading data in json
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/loading4.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            RLargeReusableCrads(
              nametxtcard: 'Global Updates',
              cases: globalcases,
              recovered: globalrecoveredCases,
              death: globalDeath,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: kcontanerdecoration,
                padding: EdgeInsets.fromLTRB(10, 20.0, 20.0, 20.0),
                // alignment: Alignment.center,
                child: Row(
                  children: [
                    //country flags
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Image(
                        image: NetworkImage(countryFlag),
                        width: 50,
                        height: 50,

                        //size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: TextField(
                        maxLines: 2,
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 15.0),
                        decoration: ktextfielddecoration,
                        onChanged: (value) {
                          //set the user entry to the value
                          //we are getting user inputs from this widget
                          userEntry = value;
                          //change the entry of the user
                          //make the first letter uppercase
                          //make the other letters lower case
                        },
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        //this will fetch data form the json file
                        setState(() {
                          //convertback to a string
                          if (userinput.isEmpty) {
                            //checktextfield();
                          }
                          searchForCountry(widget.countryDataForCorona);
                          userinput.clear(); //EMPTY THE LIST
                        });
                      },
                      child: Text('Search'),
                    )
                  ],
                ),
              ),
            ),
            RLargeReusableCrads(
              nametxtcard: 'Country Updates',
              cases: countrycases,
              death: countrydeath,
              recovered: countryrecovered,
            ),
            //SizedBox(height: 10,),
            Expanded(
              child: Padding(
                padding: kpadding,
                child: Container(
                  //padding: kpadding,
                  decoration: kcontanerdecoration,
                  child: Stack(
                    children: [
                      //learmore pic and learmore butto to the learn more screen
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('images/loading2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          //on pressed go to the next screen
                          onPressed: () {
                            setState(() {
                              ///move to the nextscreen
                              ///in this screen the user can call
                              ///the hot line number
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LearnMoreAboutCovid();//move to the next screen
                              }));
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF0FC1C7)),
                            overlayColor:
                                MaterialStateProperty.all(Colors.blueAccent),
                          ),
                          child: Text(
                            'Learn More',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
