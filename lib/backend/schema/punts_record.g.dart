// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'punts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PuntsRecord> _$puntsRecordSerializer = new _$PuntsRecordSerializer();

class _$PuntsRecordSerializer implements StructuredSerializer<PuntsRecord> {
  @override
  final Iterable<Type> types = const [PuntsRecord, _$PuntsRecord];
  @override
  final String wireName = 'PuntsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PuntsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
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
    value = object.placed;
    if (value != null) {
      result
        ..add('placed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.puntId;
    if (value != null) {
      result
        ..add('punt_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.winner;
    if (value != null) {
      result
        ..add('winner')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  PuntsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PuntsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
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
        case 'placed':
          result.placed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'punt_id':
          result.puntId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'winner':
          result.winner = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$PuntsRecord extends PuntsRecord {
  @override
  final double stake;
  @override
  final double odds;
  @override
  final double winAmount;
  @override
  final bool verified;
  @override
  final int season;
  @override
  final String puntSlip;
  @override
  final DateTime createdDate;
  @override
  final DocumentReference<Object> clubRef;
  @override
  final DocumentReference<Object> teamRef;
  @override
  final bool placed;
  @override
  final int puntId;
  @override
  final bool winner;
  @override
  final DocumentReference<Object> reference;

  factory _$PuntsRecord([void Function(PuntsRecordBuilder) updates]) =>
      (new PuntsRecordBuilder()..update(updates))._build();

  _$PuntsRecord._(
      {this.stake,
      this.odds,
      this.winAmount,
      this.verified,
      this.season,
      this.puntSlip,
      this.createdDate,
      this.clubRef,
      this.teamRef,
      this.placed,
      this.puntId,
      this.winner,
      this.reference})
      : super._();

  @override
  PuntsRecord rebuild(void Function(PuntsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PuntsRecordBuilder toBuilder() => new PuntsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PuntsRecord &&
        stake == other.stake &&
        odds == other.odds &&
        winAmount == other.winAmount &&
        verified == other.verified &&
        season == other.season &&
        puntSlip == other.puntSlip &&
        createdDate == other.createdDate &&
        clubRef == other.clubRef &&
        teamRef == other.teamRef &&
        placed == other.placed &&
        puntId == other.puntId &&
        winner == other.winner &&
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
                                                $jc($jc(0, stake.hashCode),
                                                    odds.hashCode),
                                                winAmount.hashCode),
                                            verified.hashCode),
                                        season.hashCode),
                                    puntSlip.hashCode),
                                createdDate.hashCode),
                            clubRef.hashCode),
                        teamRef.hashCode),
                    placed.hashCode),
                puntId.hashCode),
            winner.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PuntsRecord')
          ..add('stake', stake)
          ..add('odds', odds)
          ..add('winAmount', winAmount)
          ..add('verified', verified)
          ..add('season', season)
          ..add('puntSlip', puntSlip)
          ..add('createdDate', createdDate)
          ..add('clubRef', clubRef)
          ..add('teamRef', teamRef)
          ..add('placed', placed)
          ..add('puntId', puntId)
          ..add('winner', winner)
          ..add('reference', reference))
        .toString();
  }
}

class PuntsRecordBuilder implements Builder<PuntsRecord, PuntsRecordBuilder> {
  _$PuntsRecord _$v;

  double _stake;
  double get stake => _$this._stake;
  set stake(double stake) => _$this._stake = stake;

  double _odds;
  double get odds => _$this._odds;
  set odds(double odds) => _$this._odds = odds;

  double _winAmount;
  double get winAmount => _$this._winAmount;
  set winAmount(double winAmount) => _$this._winAmount = winAmount;

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

  DocumentReference<Object> _clubRef;
  DocumentReference<Object> get clubRef => _$this._clubRef;
  set clubRef(DocumentReference<Object> clubRef) => _$this._clubRef = clubRef;

  DocumentReference<Object> _teamRef;
  DocumentReference<Object> get teamRef => _$this._teamRef;
  set teamRef(DocumentReference<Object> teamRef) => _$this._teamRef = teamRef;

  bool _placed;
  bool get placed => _$this._placed;
  set placed(bool placed) => _$this._placed = placed;

  int _puntId;
  int get puntId => _$this._puntId;
  set puntId(int puntId) => _$this._puntId = puntId;

  bool _winner;
  bool get winner => _$this._winner;
  set winner(bool winner) => _$this._winner = winner;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PuntsRecordBuilder() {
    PuntsRecord._initializeBuilder(this);
  }

  PuntsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _stake = $v.stake;
      _odds = $v.odds;
      _winAmount = $v.winAmount;
      _verified = $v.verified;
      _season = $v.season;
      _puntSlip = $v.puntSlip;
      _createdDate = $v.createdDate;
      _clubRef = $v.clubRef;
      _teamRef = $v.teamRef;
      _placed = $v.placed;
      _puntId = $v.puntId;
      _winner = $v.winner;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PuntsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PuntsRecord;
  }

  @override
  void update(void Function(PuntsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  PuntsRecord build() => _build();

  _$PuntsRecord _build() {
    final _$result = _$v ??
        new _$PuntsRecord._(
            stake: stake,
            odds: odds,
            winAmount: winAmount,
            verified: verified,
            season: season,
            puntSlip: puntSlip,
            createdDate: createdDate,
            clubRef: clubRef,
            teamRef: teamRef,
            placed: placed,
            puntId: puntId,
            winner: winner,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
