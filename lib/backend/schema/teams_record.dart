import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'teams_record.g.dart';

abstract class TeamsRecord implements Built<TeamsRecord, TeamsRecordBuilder> {
  static Serializer<TeamsRecord> get serializer => _$teamsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'team_name')
  String get teamName;

  @nullable
  @BuiltValueField(wireName: 'team_short_name')
  String get teamShortName;

  @nullable
  @BuiltValueField(wireName: 'team_code')
  String get teamCode;

  @nullable
  @BuiltValueField(wireName: 'club_ref')
  DocumentReference get clubRef;

  @nullable
  @BuiltValueField(wireName: 'season_winnings')
  double get seasonWinnings;

  @nullable
  @BuiltValueField(wireName: 'season_donations')
  double get seasonDonations;

  @nullable
  @BuiltValueField(wireName: 'season_overall')
  double get seasonOverall;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(TeamsRecordBuilder builder) => builder
    ..teamName = ''
    ..teamShortName = ''
    ..teamCode = ''
    ..seasonWinnings = 0.0
    ..seasonDonations = 0.0
    ..seasonOverall = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('teams')
          : FirebaseFirestore.instance.collectionGroup('teams');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('teams').doc();

  static Stream<TeamsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TeamsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TeamsRecord._();
  factory TeamsRecord([void Function(TeamsRecordBuilder) updates]) =
      _$TeamsRecord;

  static TeamsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTeamsRecordData({
  String teamName,
  String teamShortName,
  String teamCode,
  DocumentReference clubRef,
  double seasonWinnings,
  double seasonDonations,
  double seasonOverall,
}) =>
    serializers.toFirestore(
        TeamsRecord.serializer,
        TeamsRecord((t) => t
          ..teamName = teamName
          ..teamShortName = teamShortName
          ..teamCode = teamCode
          ..clubRef = clubRef
          ..seasonWinnings = seasonWinnings
          ..seasonDonations = seasonDonations
          ..seasonOverall = seasonOverall));
