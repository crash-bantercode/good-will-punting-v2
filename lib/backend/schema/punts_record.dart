import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'punts_record.g.dart';

abstract class PuntsRecord implements Built<PuntsRecord, PuntsRecordBuilder> {
  static Serializer<PuntsRecord> get serializer => _$puntsRecordSerializer;

  @nullable
  double get stake;

  @nullable
  double get odds;

  @nullable
  @BuiltValueField(wireName: 'win_amount')
  double get winAmount;

  @nullable
  bool get verified;

  @nullable
  int get season;

  @nullable
  @BuiltValueField(wireName: 'punt_slip')
  String get puntSlip;

  @nullable
  @BuiltValueField(wireName: 'created_date')
  DateTime get createdDate;

  @nullable
  @BuiltValueField(wireName: 'club_ref')
  DocumentReference get clubRef;

  @nullable
  @BuiltValueField(wireName: 'team_ref')
  DocumentReference get teamRef;

  @nullable
  bool get placed;

  @nullable
  @BuiltValueField(wireName: 'punt_id')
  int get puntId;

  @nullable
  bool get winner;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PuntsRecordBuilder builder) => builder
    ..stake = 0.0
    ..odds = 0.0
    ..winAmount = 0.0
    ..verified = false
    ..season = 0
    ..puntSlip = ''
    ..placed = false
    ..puntId = 0
    ..winner = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('punts');

  static Stream<PuntsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PuntsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PuntsRecord._();
  factory PuntsRecord([void Function(PuntsRecordBuilder) updates]) =
      _$PuntsRecord;

  static PuntsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPuntsRecordData({
  double stake,
  double odds,
  double winAmount,
  bool verified,
  int season,
  String puntSlip,
  DateTime createdDate,
  DocumentReference clubRef,
  DocumentReference teamRef,
  bool placed,
  int puntId,
  bool winner,
}) =>
    serializers.toFirestore(
        PuntsRecord.serializer,
        PuntsRecord((p) => p
          ..stake = stake
          ..odds = odds
          ..winAmount = winAmount
          ..verified = verified
          ..season = season
          ..puntSlip = puntSlip
          ..createdDate = createdDate
          ..clubRef = clubRef
          ..teamRef = teamRef
          ..placed = placed
          ..puntId = puntId
          ..winner = winner));
