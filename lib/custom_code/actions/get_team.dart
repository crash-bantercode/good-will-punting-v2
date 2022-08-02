// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<DocumentReference> getTeam(List<String> clubCodes) async {
  var returnedClub;
  await FirebaseFirestore.instance
      .collection('clubs')
      .where('club_code', isEqualTo: clubCodes[0])
      .get()
      .then((QuerySnapshot clubQuery) {
    if (clubQuery.docs[0].exists) {
      returnedClub = clubQuery.docs[0].id;
    } else {
      returnedClub = null;
    }
  });

  var teamRef = null;

  if (returnedClub != null) {
    await FirebaseFirestore.instance
        .collection('clubs')
        .doc(returnedClub)
        .collection('teams')
        .where('team_short_name', isEqualTo: clubCodes[1])
        .get()
        .then((QuerySnapshot query) {
      teamRef = query.docs[0].reference;
    });
  }
  return teamRef;
}
