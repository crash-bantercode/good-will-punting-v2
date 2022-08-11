import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String createTeamCode(
  String clubCode,
  String teamShort,
) {
  return clubCode + ':' + teamShort;
}

double sumValues(List<double> values) {
  double sum = 0.0;
  for (var i = 0; i < values.length; i++) {
    sum += values[i];
  }
  return sum;
}

int getIndex(int index) {
  return index + 1;
}

bool validateDonationSubmit(
  String img,
  double donation,
) {
  var valid = true;
  if (img == null) {
    valid = false;
  }
  if (donation == 0.0) {
    valid = false;
  }

  return valid;
}

double multiply(
  double stake,
  double odds,
) {
  if (stake != null && odds != null) {
    return stake * odds;
  } else {
    return 0;
  }
}

double getPercent(
  double stake,
  double odds,
  double percentage,
) {
  var factor = percentage / 100;
  return (stake * odds) * factor;
}

int increment(int count) {
  return count + 1;
}

bool inDebt(int debt) {
  var result = false;

  if (debt > 1) {
    result = true;
  }

  return result;
}
