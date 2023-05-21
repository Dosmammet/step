//@dart=2.9
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Config {
  final String websiteURL = 'beyan.wiki';
  final String dataurl = 'https://api.beyan.wiki/api/';
  //final String dataurl = 'http://192.168.2.86:8000/api/';
  final String imageAdress = 'https://api.beyan.wiki/public/uploadedimages/';
  final String explorePostImageAdress = 'https://admin.beyan.wiki/public/';

  //app theme color
  final Color darkAppColor = HexColor('#1C293E');
  final Color darkBackgroundColor = HexColor('#2C384C');

  final Color appColorLight = HexColor('#F6F7F9');
  
  // final Color appColor = HexColor("#0784b5");
  // final Color lightModeColor = HexColor('#dee4e7');
  // final Color darkModeColor = HexColor('#182029');
  //Language Setup
  final List<String> languages = [
    'English',
    'Turkmen',
    'Russian',
  ];
}
