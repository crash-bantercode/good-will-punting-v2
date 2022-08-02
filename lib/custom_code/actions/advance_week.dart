// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future advanceWeek(DocumentReference club) async {
  await FirebaseFirestore.instance
      .collection('users')
      .where('club_ref', isEqualTo: club)
      .get()
      .then((QuerySnapshot users) {
    users.docs.forEach((document) {
      Map<String, dynamic> current = document.data();
      var newWeek = current['week_debt'] != null ? current['week_debt'] + 1 : 1;
      document.reference.update({'week_debt': newWeek});
    });
  });
}
