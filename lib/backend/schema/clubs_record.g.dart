// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClubsRecord> _$clubsRecordSerializer = new _$ClubsRecordSerializer();

class _$ClubsRecordSerializer implements StructuredSerializer<ClubsRecord> {
  @override
  final Iterable<Type> types = const [ClubsRecord, _$ClubsRecord];
  @override
  final String wireName = 'ClubsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ClubsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.clubName;
    if (value != null) {
      result
        ..add('club_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clubOwner;
    if (value != null) {
      result
        ..add('club_owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.season;
    if (value != null) {
      result
        ..add('season')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.seasonWinnings;
    if (value != null) {
      result
        ..add('season_winnings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.clubCode;
    if (value != null) {
      result
        ..add('club_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clubBsb;
    if (value != null) {
      result
        ..add('club_bsb')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clubAccount;
    if (value != null) {
      result
        ..add('club_account')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.seasonActive;
    if (value != null) {
      result
        ..add('season_active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.clubShortName;
    if (value != null) {
      result
        ..add('club_short_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.puntCount;
    if (value != null) {
      result
        ..add('punt_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.seasonWeek;
    if (value != null) {
      result
        ..add('season_week')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ClubsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClubsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'club_name':
          result.clubName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'club_owner':
          result.clubOwner = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'season':
          result.season = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'season_winnings':
          result.seasonWinnings = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'club_code':
          result.clubCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'club_bsb':
          result.clubBsb = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'club_account':
          result.clubAccount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'season_active':
          result.seasonActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'club_short_name':
          result.clubShortName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'punt_count':
          result.puntCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'season_week':
          result.seasonWeek = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$ClubsRecord extends ClubsRecord {
  @override
  final String clubName;
  @override
  final DocumentReference<Object> clubOwner;
  @override
  final int season;
  @override
  final double seasonWinnings;
  @override
  final String clubCode;
  @override
  final String clubBsb;
  @override
  final String clubAccount;
  @override
  final bool seasonActive;
  @override
  final String clubShortName;
  @override
  final int puntCount;
  @override
  final int seasonWeek;
  @override
  final DocumentReference<Object> reference;

  factory _$ClubsRecord([void Function(ClubsRecordBuilder) updates]) =>
      (new ClubsRecordBuilder()..update(updates))._build();

  _$ClubsRecord._(
      {this.clubName,
      this.clubOwner,
      this.season,
      this.seasonWinnings,
      this.clubCode,
      this.clubBsb,
      this.clubAccount,
      this.seasonActive,
      this.clubShortName,
      this.puntCount,
      this.seasonWeek,
      this.reference})
      : super._();

  @override
  ClubsRecord rebuild(void Function(ClubsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClubsRecordBuilder toBuilder() => new ClubsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClubsRecord &&
        clubName == other.clubName &&
        clubOwner == other.clubOwner &&
        season == other.season &&
        seasonWinnings == other.seasonWinnings &&
        clubCode == other.clubCode &&
        clubBsb == other.clubBsb &&
        clubAccount == other.clubAccount &&
        seasonActive == other.seasonActive &&
        clubShortName == other.clubShortName &&
        puntCount == other.puntCount &&
        seasonWeek == other.seasonWeek &&
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
                                            $jc($jc(0, clubName.hashCode),
                                                clubOwner.hashCode),
                                            season.hashCode),
                                        seasonWinnings.hashCode),
                                    clubCode.hashCode),
                                clubBsb.hashCode),
                            clubAccount.hashCode),
                        seasonActive.hashCode),
                    clubShortName.hashCode),
                puntCount.hashCode),
            seasonWeek.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClubsRecord')
          ..add('clubName', clubName)
          ..add('clubOwner', clubOwner)
          ..add('season', season)
          ..add('seasonWinnings', seasonWinnings)
          ..add('clubCode', clubCode)
          ..add('clubBsb', clubBsb)
          ..add('clubAccount', clubAccount)
          ..add('seasonActive', seasonActive)
          ..add('clubShortName', clubShortName)
          ..add('puntCount', puntCount)
          ..add('seasonWeek', seasonWeek)
          ..add('reference', reference))
        .toString();
  }
}

class ClubsRecordBuilder implements Builder<ClubsRecord, ClubsRecordBuilder> {
  _$ClubsRecord _$v;

  String _clubName;
  String get clubName => _$this._clubName;
  set clubName(String clubName) => _$this._clubName = clubName;

  DocumentReference<Object> _clubOwner;
  DocumentReference<Object> get clubOwner => _$this._clubOwner;
  set clubOwner(DocumentReference<Object> clubOwner) =>
      _$this._clubOwner = clubOwner;

  int _season;
  int get season => _$this._season;
  set season(int season) => _$this._season = season;

  double _seasonWinnings;
  double get seasonWinnings => _$this._seasonWinnings;
  set seasonWinnings(double seasonWinnings) =>
      _$this._seasonWinnings = seasonWinnings;

  String _clubCode;
  String get clubCode => _$this._clubCode;
  set clubCode(String clubCode) => _$this._clubCode = clubCode;

  String _clubBsb;
  String get clubBsb => _$this._clubBsb;
  set clubBsb(String clubBsb) => _$this._clubBsb = clubBsb;

  String _clubAccount;
  String get clubAccount => _$this._clubAccount;
  set clubAccount(String clubAccount) => _$this._clubAccount = clubAccount;

  bool _seasonActive;
  bool get seasonActive => _$this._seasonActive;
  set seasonActive(bool seasonActive) => _$this._seasonActive = seasonActive;

  String _clubShortName;
  String get clubShortName => _$this._clubShortName;
  set clubShortName(String clubShortName) =>
      _$this._clubShortName = clubShortName;

  int _puntCount;
  int get puntCount => _$this._puntCount;
  set puntCount(int puntCount) => _$this._puntCount = puntCount;

  int _seasonWeek;
  int get seasonWeek => _$this._seasonWeek;
  set seasonWeek(int seasonWeek) => _$this._seasonWeek = seasonWeek;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ClubsRecordBuilder() {
    ClubsRecord._initializeBuilder(this);
  }

  ClubsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clubName = $v.clubName;
      _clubOwner = $v.clubOwner;
      _season = $v.season;
      _seasonWinnings = $v.seasonWinnings;
      _clubCode = $v.clubCode;
      _clubBsb = $v.clubBsb;
      _clubAccount = $v.clubAccount;
      _seasonActive = $v.seasonActive;
      _clubShortName = $v.clubShortName;
      _puntCount = $v.puntCount;
      _seasonWeek = $v.seasonWeek;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClubsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClubsRecord;
  }

  @override
  void update(void Function(ClubsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ClubsRecord build() => _build();

  _$ClubsRecord _build() {
    final _$result = _$v ??
        new _$ClubsRecord._(
            clubName: clubName,
            clubOwner: clubOwner,
            season: season,
            seasonWinnings: seasonWinnings,
            clubCode: clubCode,
            clubBsb: clubBsb,
            clubAccount: clubAccount,
            seasonActive: seasonActive,
            clubShortName: clubShortName,
            puntCount: puntCount,
            seasonWeek: seasonWeek,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
