// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DonationsRecord> _$donationsRecordSerializer =
    new _$DonationsRecordSerializer();

class _$DonationsRecordSerializer
    implements StructuredSerializer<DonationsRecord> {
  @override
  final Iterable<Type> types = const [DonationsRecord, _$DonationsRecord];
  @override
  final String wireName = 'DonationsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, DonationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.donationId;
    if (value != null) {
      result
        ..add('donation_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.stake;
    if (value != null) {
      result
        ..add('stake')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.odds;
    if (value != null) {
      result
        ..add('odds')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.winAmount;
    if (value != null) {
      result
        ..add('win_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.donation;
    if (value != null) {
      result
        ..add('donation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.verified;
    if (value != null) {
      result
        ..add('verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.season;
    if (value != null) {
      result
        ..add('season')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.puntSlip;
    if (value != null) {
      result
        ..add('punt_slip')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.clubRef;
    if (value != null) {
      result
        ..add('club_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.teamRef;
    if (value != null) {
      result
        ..add('team_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  DonationsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DonationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'donation_id':
          result.donationId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'stake':
          result.stake = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'odds':
          result.odds = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'win_amount':
          result.winAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'donation':
          result.donation = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'verified':
          result.verified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'season':
          result.season = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'punt_slip':
          result.puntSlip = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'club_ref':
          result.clubRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'team_ref':
          result.teamRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$DonationsRecord extends DonationsRecord {
  @override
  final int donationId;
  @override
  final double stake;
  @override
  final double odds;
  @override
  final double winAmount;
  @override
  final double donation;
  @override
  final bool verified;
  @override
  final int season;
  @override
  final String puntSlip;
  @override
  final DateTime createdDate;
  @override
  final DocumentReference<Object> userRef;
  @override
  final DocumentReference<Object> clubRef;
  @override
  final DocumentReference<Object> teamRef;
  @override
  final DocumentReference<Object> reference;

  factory _$DonationsRecord([void Function(DonationsRecordBuilder) updates]) =>
      (new DonationsRecordBuilder()..update(updates))._build();

  _$DonationsRecord._(
      {this.donationId,
      this.stake,
      this.odds,
      this.winAmount,
      this.donation,
      this.verified,
      this.season,
      this.puntSlip,
      this.createdDate,
      this.userRef,
      this.clubRef,
      this.teamRef,
      this.reference})
      : super._();

  @override
  DonationsRecord rebuild(void Function(DonationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DonationsRecordBuilder toBuilder() =>
      new DonationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DonationsRecord &&
        donationId == other.donationId &&
        stake == other.stake &&
        odds == other.odds &&
        winAmount == other.winAmount &&
        donation == other.donation &&
        verified == other.verified &&
        season == other.season &&
        puntSlip == other.puntSlip &&
        createdDate == other.createdDate &&
        userRef == other.userRef &&
        clubRef == other.clubRef &&
        teamRef == other.teamRef &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, donationId.hashCode),
                                                    stake.hashCode),
                                                odds.hashCode),
                                            winAmount.hashCode),
                                        donation.hashCode),
                                    verified.hashCode),
                                season.hashCode),
                            puntSlip.hashCode),
                        createdDate.hashCode),
                    userRef.hashCode),
                clubRef.hashCode),
            teamRef.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DonationsRecord')
          ..add('donationId', donationId)
          ..add('stake', stake)
          ..add('odds', odds)
          ..add('winAmount', winAmount)
          ..add('donation', donation)
          ..add('verified', verified)
          ..add('season', season)
          ..add('puntSlip', puntSlip)
          ..add('createdDate', createdDate)
          ..add('userRef', userRef)
          ..add('clubRef', clubRef)
          ..add('teamRef', teamRef)
          ..add('reference', reference))
        .toString();
  }
}

class DonationsRecordBuilder
    implements Builder<DonationsRecord, DonationsRecordBuilder> {
  _$DonationsRecord _$v;

  int _donationId;
  int get donationId => _$this._donationId;
  set donationId(int donationId) => _$this._donationId = donationId;

  double _stake;
  double get stake => _$this._stake;
  set stake(double stake) => _$this._stake = stake;

  double _odds;
  double get odds => _$this._odds;
  set odds(double odds) => _$this._odds = odds;

  double _winAmount;
  double get winAmount => _$this._winAmount;
  set winAmount(double winAmount) => _$this._winAmount = winAmount;

  double _donation;
  double get donation => _$this._donation;
  set donation(double donation) => _$this._donation = donation;

  bool _verified;
  bool get verified => _$this._verified;
  set verified(bool verified) => _$this._verified = verified;

  int _season;
  int get season => _$this._season;
  set season(int season) => _$this._season = season;

  String _puntSlip;
  String get puntSlip => _$this._puntSlip;
  set puntSlip(String puntSlip) => _$this._puntSlip = puntSlip;

  DateTime _createdDate;
  DateTime get createdDate => _$this._createdDate;
  set createdDate(DateTime createdDate) => _$this._createdDate = createdDate;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  DocumentReference<Object> _clubRef;
  DocumentReference<Object> get clubRef => _$this._clubRef;
  set clubRef(DocumentReference<Object> clubRef) => _$this._clubRef = clubRef;

  DocumentReference<Object> _teamRef;
  DocumentReference<Object> get teamRef => _$this._teamRef;
  set teamRef(DocumentReference<Object> teamRef) => _$this._teamRef = teamRef;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DonationsRecordBuilder() {
    DonationsRecord._initializeBuilder(this);
  }

  DonationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _donationId = $v.donationId;
      _stake = $v.stake;
      _odds = $v.odds;
      _winAmount = $v.winAmount;
      _donation = $v.donation;
      _verified = $v.verified;
      _season = $v.season;
      _puntSlip = $v.puntSlip;
      _createdDate = $v.createdDate;
      _userRef = $v.userRef;
      _clubRef = $v.clubRef;
      _teamRef = $v.teamRef;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DonationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DonationsRecord;
  }

  @override
  void update(void Function(DonationsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  DonationsRecord build() => _build();

  _$DonationsRecord _build() {
    final _$result = _$v ??
        new _$DonationsRecord._(
            donationId: donationId,
            stake: stake,
            odds: odds,
            winAmount: winAmount,
            donation: donation,
            verified: verified,
            season: season,
            puntSlip: puntSlip,
            createdDate: createdDate,
            userRef: userRef,
            clubRef: clubRef,
            teamRef: teamRef,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
