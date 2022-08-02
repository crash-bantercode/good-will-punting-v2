import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'donations_record.g.dart';

abstract class DonationsRecord
    implements Built<DonationsRecord, DonationsRecordBuilder> {
  static Serializer<DonationsRecord> get serializer =>
      _$donationsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'donation_id')
  int get donationId;

  @nullable
  double get stake;

  @nullable
  double get odds;

  @nullable
  @BuiltValueField(wireName: 'win_amount')
  double get winAmount;

  @nullable
  double get donation;

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
  @BuiltValueField(wireName: 'user_ref')
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: 'club_ref')
  DocumentReference get clubRef;

  @nullable
  @BuiltValueField(wireName: 'team_ref')
  DocumentReference get teamRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(DonationsRecordBuilder builder) => builder
    ..donationId = 0
    ..stake = 0.0
    ..odds = 0.0
    ..winAmount = 0.0
    ..donation = 0.0
    ..verified = false
    ..season = 0
    ..puntSlip = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('donations')
          : FirebaseFirestore.instance.collectionGroup('donations');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('donations').doc();

  static Stream<DonationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DonationsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DonationsRecord._();
  factory DonationsRecord([void Function(DonationsRecordBuilder) updates]) =
      _$DonationsRecord;

  static DonationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDonationsRecordData({
  int donationId,
  double stake,
  double odds,
  double winAmount,
  double donation,
  bool verified,
  int season,
  String puntSlip,
  DateTime createdDate,
  DocumentReference userRef,
  DocumentReference clubRef,
  DocumentReference teamRef,
}) =>
    serializers.toFirestore(
        DonationsRecord.serializer,
        DonationsRecord((d) => d
          ..donationId = donationId
          ..stake = stake
          ..odds = odds
          ..winAmount = winAmount
          ..donation = donation
          ..verified = verified
          ..season = season
          ..puntSlip = puntSlip
          ..createdDate = createdDate
          ..userRef = userRef
          ..clubRef = clubRef
          ..teamRef = teamRef));
