import 'package:flutter/material.dart';

const ktxtsizeheaders = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w600,
);

const ktxtcontanerupdates = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  color: Color(0xFF39393D),
);

var kcontanerdecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: Color(0xFF24243B),
);

const kpadding = const EdgeInsets.fromLTRB(8, 8, 8, 8);

const kcasesfontstyle = TextStyle(
  fontSize: 11,
  color: Color(0xFF91ECEC),
  fontWeight: FontWeight.w500,
);

const knumberofcasesstyle = TextStyle(fontSize: 14.45, color: Colors.white);

const ktextfielddecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter country name',

  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
  contentPadding: EdgeInsets.all(8.0), //here your padding
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(9.0)),
    borderSide: BorderSide.none,
  ),
);

var klearnmoredecorations = BoxDecoration(
  color: Color(0xFF2EABCA),
  borderRadius: BorderRadius.circular(10),
);

const khotlinenumbertxt = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Country Hotline Number',
  hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 15.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(9.0)),
    borderSide: BorderSide.none,
  ),
);

//api information
//this is a free api with no key
const globe = 'all'; //get global information
const country = 'countries'; //get country information
const apiUrl = 'disease.sh';
const apiPath = '/v3/covid-19/$globe'; //by globe
const apiPathCountries = '/v3/covid-19/$country'; //by country

// https://disease.sh/v3/covid-19/countries
