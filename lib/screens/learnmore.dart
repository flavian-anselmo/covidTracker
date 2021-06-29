import 'package:covidtracker/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class LearnMoreAboutCovid extends StatefulWidget {
  @override
  _LearnMoreAboutCovidState createState() => _LearnMoreAboutCovidState();
}

// ignore: todo
///TODO:Add an area where the buttons of call and msg will be placed
// ignore: todo
///TODO:add the buttons
// ignore: todo
///TODO:add functionality to the buttons
// ignore: todo
///TODO:make the ui more good
class _LearnMoreAboutCovidState extends State<LearnMoreAboutCovid> {
  //property for user input
  //gets the hotline number
  late String hotLineNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('CovidTracker'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: klearnmoredecorations,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Covid-19',
                            //style: ,
                            style: TextStyle(
                              color: Color(0xFFF0F0F3),
                              fontSize: 25.0,
                            ),
                          ),
                        ),

                        //enter the number of the user
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Are You feeling sick?',
                                  style: TextStyle(
                                    color: Color(0xFFEC0A42),
                                    //fontSize: 5.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'if you are feeling sick with any of the symptoms call your country Hotline Number.',
                                  style: TextStyle(
                                    color: Color(0xFF1D691D),
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              TextField(
                                maxLines: 1,
                                decoration: khotlinenumbertxt,
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 12.0),
                                keyboardType:
                                    TextInputType.phone, //the numeric keyboard
                                //pick the value enteerd by the user
                                onChanged: (value) {
                                  //update in real time
                                  hotLineNumber = value;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        //button to call the hotline number enterd by the user
                        TextButton.icon(
                          //direct the user and call the hotline nnumber
                          onPressed: () {
                            //call the number the user enters
                            _callNumber();
                          },
                          icon: Icon(Icons.call),
                          label: Text('Call Now '),
                          style: ButtonStyle(
                           
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF104E08)),
                            overlayColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Container(
                    //decoration: klearnmoredecorations,
                    constraints: BoxConstraints.expand(),
                    ///color: Color(0xFF2EABCA),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/loading.jpg'),
                        
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  _callNumber() async {
    //get the hotline number
    var number = hotLineNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }
}
//place the calling button and messaging button
//make some prevention in formationn
//when clicked a  text field pop up will come for the suerto
///enterthe phone numberand call
///send message will automatically send the usertothe start up textfor the
///textuser implies to send
///
