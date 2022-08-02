import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'clubs_record.g.dart';

abstract class ClubsRecord implements Built<ClubsRecord, ClubsRecordBuilder> {
  static Serializer<ClubsRecord> get serializer => _$clubsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'club_name')
  String get clubName;

  @nullable
  @BuiltValueField(wireName: 'club_owner')
  DocumentReference get clubOwner;

  @nullable
  int get season;

  @nullable
  @BuiltValueField(wireName: 'season_winnings')
  double get seasonWinnings;

  @nullable
  @BuiltValueField(wireName: 'club_code')
  String get clubCode;

  @nullable
  @BuiltValueField(wireName: 'club_bsb')
  String get clubBsb;

  @nullable
  @BuiltValueField(wireName: 'club_account')
  String get clubAccount;

  @nullable
  @BuiltValueField(wireName: 'season_active')
  bool get seasonActive;

  @nullable
  @BuiltValueField(wireName: 'club_short_name')
  String get clubShortName;

  @nullable
  @BuiltValueField(wireName: 'punt_count')
  int get puntCount;

  @nullable
  @BuiltValueField(wireName: 'season_week')
  int get seasonWeek;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ClubsRecordBuilder builder) => builder
    ..clubName = ''
    ..season = 0
    ..seasonWinnings = 0.0
    ..clubCode = ''
    ..clubBsb = ''
    ..clubAccount = ''
    ..seasonActive = false
    ..clubShortName = ''
    ..puntCount = 0
    ..seasonWeek = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clubs');

  static Stream<ClubsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ClubsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ClubsRecord._();
  factory ClubsRecord([void Function(ClubsRecordBuilder) updates]) =
      _$ClubsRecord;

  static ClubsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createClubsRecordData({
  String clubName,
  DocumentReference clubOwner,
  int season,
  double seasonWinnings,
  String clubCode,
  String clubBsb,
  String clubAccount,
  bool seasonActive,
  String clubShortName,
  int puntCount,
  int seasonWeek,
}) =>
    serializers.toFirestore(
        ClubsRecord.serializer,
        ClubsRecord((c) => c
          ..clubName = clubName
          ..clubOwner = clubOwner
          ..season = season
          ..seasonWinnings = seasonWinnings
          ..clubCode = clubCode
          ..clubBsb = clubBsb
          ..clubAccount = clubAccount
          ..seasonActive = seasonActive
          ..clubShortName = clubShortName
          ..puntCount = puntCount
          ..seasonWeek = seasonWeek));
