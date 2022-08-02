// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teams_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TeamsRecord> _$teamsRecordSerializer = new _$TeamsRecordSerializer();

class _$TeamsRecordSerializer implements StructuredSerializer<TeamsRecord> {
  @override
  final Iterable<Type> types = const [TeamsRecord, _$TeamsRecord];
  @override
  final String wireName = 'TeamsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TeamsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.teamName;
    if (value != null) {
      result
        ..add('team_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.teamShortName;
    if (value != null) {
      result
        ..add('team_short_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.teamCode;
    if (value != null) {
      result
        ..add('team_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clubRef;
    if (value != null) {
      result
        ..add('club_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.seasonWinnings;
    if (value != null) {
      result
        ..add('season_winnings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.seasonDonations;
    if (value != null) {
      result
        ..add('season_donations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.seasonOverall;
    if (value != null) {
      result
        ..add('season_overall')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  TeamsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TeamsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'team_name':
          result.teamName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'team_short_name':
          result.teamShortName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'team_code':
          result.teamCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'club_ref':
          result.clubRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'season_winnings':
          result.seasonWinnings = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'season_donations':
          result.seasonDonations = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'season_overall':
          result.seasonOverall = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
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

class _$TeamsRecord extends TeamsRecord {
  @override
  final String teamName;
  @override
  final String teamShortName;
  @override
  final String teamCode;
  @override
  final DocumentReference<Object> clubRef;
  @override
  final double seasonWinnings;
  @override
  final double seasonDonations;
  @override
  final double seasonOverall;
  @override
  final DocumentReference<Object> reference;

  factory _$TeamsRecord([void Function(TeamsRecordBuilder) updates]) =>
      (new TeamsRecordBuilder()..update(updates))._build();

  _$TeamsRecord._(
      {this.teamName,
      this.teamShortName,
      this.teamCode,
      this.clubRef,
      this.seasonWinnings,
      this.seasonDonations,
      this.seasonOverall,
      this.reference})
      : super._();

  @override
  TeamsRecord rebuild(void Function(TeamsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TeamsRecordBuilder toBuilder() => new TeamsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeamsRecord &&
        teamName == other.teamName &&
        teamShortName == other.teamShortName &&
        teamCode == other.teamCode &&
        clubRef == other.clubRef &&
        seasonWinnings == other.seasonWinnings &&
        seasonDonations == other.seasonDonations &&
        seasonOverall == other.seasonOverall &&
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
                            $jc($jc(0, teamName.hashCode),
                                teamShortName.hashCode),
                            teamCode.hashCode),
                        clubRef.hashCode),
                    seasonWinnings.hashCode),
                seasonDonations.hashCode),
            seasonOverall.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TeamsRecord')
          ..add('teamName', teamName)
          ..add('teamShortName', teamShortName)
          ..add('teamCode', teamCode)
          ..add('clubRef', clubRef)
          ..add('seasonWinnings', seasonWinnings)
          ..add('seasonDonations', seasonDonations)
          ..add('seasonOverall', seasonOverall)
          ..add('reference', reference))
        .toString();
  }
}

class TeamsRecordBuilder implements Builder<TeamsRecord, TeamsRecordBuilder> {
  _$TeamsRecord _$v;

  String _teamName;
  String get teamName => _$this._teamName;
  set teamName(String teamName) => _$this._teamName = teamName;

  String _teamShortName;
  String get teamShortName => _$this._teamShortName;
  set teamShortName(String teamShortName) =>
      _$this._teamShortName = teamShortName;

  String _teamCode;
  String get teamCode => _$this._teamCode;
  set teamCode(String teamCode) => _$this._teamCode = teamCode;

  DocumentReference<Object> _clubRef;
  DocumentReference<Object> get clubRef => _$this._clubRef;
  set clubRef(DocumentReference<Object> clubRef) => _$this._clubRef = clubRef;

  double _seasonWinnings;
  double get seasonWinnings => _$this._seasonWinnings;
  set seasonWinnings(double seasonWinnings) =>
      _$this._seasonWinnings = seasonWinnings;

  double _seasonDonations;
  double get seasonDonations => _$this._seasonDonations;
  set seasonDonations(double seasonDonations) =>
      _$this._seasonDonations = seasonDonations;

  double _seasonOverall;
  double get seasonOverall => _$this._seasonOverall;
  set seasonOverall(double seasonOverall) =>
      _$this._seasonOverall = seasonOverall;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TeamsRecordBuilder() {
    TeamsRecord._initializeBuilder(this);
  }

  TeamsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _teamName = $v.teamName;
      _teamShortName = $v.teamShortName;
      _teamCode = $v.teamCode;
      _clubRef = $v.clubRef;
      _seasonWinnings = $v.seasonWinnings;
      _seasonDonations = $v.seasonDonations;
      _seasonOverall = $v.seasonOverall;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeamsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TeamsRecord;
  }

  @override
  void update(void Function(TeamsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  TeamsRecord build() => _build();

  _$TeamsRecord _build() {
    final _$result = _$v ??
        new _$TeamsRecord._(
            teamName: teamName,
            teamShortName: teamShortName,
            teamCode: teamCode,
            clubRef: clubRef,
            seasonWinnings: seasonWinnings,
            seasonDonations: seasonDonations,
            seasonOverall: seasonOverall,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
