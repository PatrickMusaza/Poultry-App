import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> currency() {
  // Currency world wide which filter and map one by one in dropdown
  List<String> currencies = ['KES', 'RWF', 'USD', 'ZMW'];

  return currencies;
}

double? sumInvestment() {
// sum up the values of the text from home page namely text1, text2, text3, text4, text5, text6, and text7
  final text1 = '100.00';
  final text2 = '50.00';
  final text3 = '75.00';
  final text4 = '25.00';
  final text5 = '30.00';
  final text6 = '10.00';
  final text7 = '60.00';

  final double value1 = double.tryParse(text1) ?? 0.0;
  final double value2 = double.tryParse(text2) ?? 0.0;
  final double value3 = double.tryParse(text3) ?? 0.0;
  final double value4 = double.tryParse(text4) ?? 0.0;
  final double value5 = double.tryParse(text5) ?? 0.0;
  final double value6 = double.tryParse(text6) ?? 0.0;
  final double value7 = double.tryParse(text7) ?? 0.0;

  final sum = value1 + value2 + value3 + value4 + value5 + value6 + value7;

  return sum;
}

String? greetings() {
  // use Good Morning in day time, Good Afternoon in the afternoon, and Good Evening according to user's time
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
