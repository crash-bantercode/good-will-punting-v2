// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<bool> teamExists(String code) async {
  //var found = FirebaseFirestore.instance.collection('Clubs').where("club_code", isEqualTo: code).get();
  //if (found != null) {
  //return true;
  //} else {
  //return false;
  //}
  var clubCode = code.split(':')[0];
  var teamCode = code.split(':')[1];
  bool found = false;
  var club = await FirebaseFirestore.instance
      .collection('clubs')
      .where('club_code', isEqualTo: clubCode)
      .get()
      .then((QuerySnapshot query) {
    if (query.docs.isNotEmpty) {
      found = true;
    } else {
      found = false;
    }
  });

  return found;
}
