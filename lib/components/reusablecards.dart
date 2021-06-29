//reusable large cards
import 'dart:ui';
import 'package:covidtracker/constants/constants.dart';
import 'package:flutter/material.dart';

class RLargeReusableCrads extends StatelessWidget {
//this constractor is used to initialise 
//the data from the json file 
//cases 
//recoverd 
//death 
// 
  RLargeReusableCrads(
      {required this.nametxtcard,
      this.cases,
      this.recovered,
      this.death,
      this.childcard});
  final childcard;
  final String nametxtcard;
  final cases;
  final recovered;
  final death;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: kpadding,
        child: Container(
          //color: Color(0xFF101427),
          decoration: kcontanerdecoration,

          child: Column(
            //this is where the live updates for the global world will go
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    child: Text(nametxtcard,
                        style: TextStyle(color: Color(0xFF85EC8E))),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 5.0),
                  ),
                  // Expanded(
                  //   child: Container(
                  //     alignment: Alignment.topRight,
                  //     padding: EdgeInsets.only(left: 50.0),
                  //     child: TextButton(
                  //       style: ButtonStyle(
                  //         foregroundColor:
                  //             MaterialStateProperty.all<Color>(Colors.blue),
                  //       ),
                  //       onPressed: () {
                  //         //REFRESH THE CURRENT DATA
                  //       },
                  //       child: Text(
                  //         'Refresh',
                  //         style: TextStyle(fontSize: 12),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
              Row(
                children: <Widget>[
                  //confirmed //recovered//deaths
                  ReusableCards(
                    //initialize forom here
                    casestxt: 'Confirmed',
                    numbertxt: cases.toString(),
                    bgColor: Color(0xFF523F94),
                  ),
                  ReusableCards(
                    casestxt: 'Recovered',
                    numbertxt: recovered.toString(),
                    bgColor: Color(0xFF54C45E),
                  ),
                  ReusableCards(
                    casestxt: 'Death',
                    numbertxt: death.toString(),
                    bgColor: Color(0xFFFC4976),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//reusable small cards
class ReusableCards extends StatelessWidget {
  ReusableCards(
      {required this.casestxt, required this.numbertxt, required this.bgColor});
  final String casestxt;
  final String numbertxt;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //confirmed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
        ),

        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              casestxt,
              style: kcasesfontstyle,
            ),
            Text(
              numbertxt,
              style: knumberofcasesstyle,
            )
          ],
        ),
      ),
    );
  }
}
