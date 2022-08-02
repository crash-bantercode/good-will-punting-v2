// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<DocumentReference> getClub(List<String> clubCodes) async {
  var code = clubCodes[0];

  var club = await FirebaseFirestore.instance
      .collection('clubs')
      .where('club_code', isEqualTo: code)
      .get()
      .then((QuerySnapshot query) {
    return query.docs[0].reference;
  });

  return club;
}
