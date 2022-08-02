// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future newSeason(String clubCode) async {
  var clubId;
  var clubRef;

  await FirebaseFirestore.instance
      .collection('clubs')
      .where('club_code', isEqualTo: clubCode)
      .get()
      .then((QuerySnapshot club) {
    clubId = club.docs[0].id;
    clubRef = club.docs[0].reference;
  });

  await FirebaseFirestore.instance
      .collection('users')
      .where('club_ref', isEqualTo: clubRef)
      .get()
      .then((QuerySnapshot users) {
    users.docs.forEach((document) {
      document.reference.update({'season_donations': 0});
    });
  });

  await FirebaseFirestore.instance
      .collection('clubs')
      .doc(clubId)
      .collection('teams')
      .get()
      .then((QuerySnapshot teams) {
    teams.docs.forEach((document) {
      document.reference.update(
          {'season_overall': 0, 'season_winnings': 0, 'season_donations': 0});
    });
  });
}
