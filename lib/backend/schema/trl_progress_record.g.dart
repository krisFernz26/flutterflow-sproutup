// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trl_progress_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TrlProgressRecord> _$trlProgressRecordSerializer =
    new _$TrlProgressRecordSerializer();

class _$TrlProgressRecordSerializer
    implements StructuredSerializer<TrlProgressRecord> {
  @override
  final Iterable<Type> types = const [TrlProgressRecord, _$TrlProgressRecord];
  @override
  final String wireName = 'TrlProgressRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TrlProgressRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.startup;
    if (value != null) {
      result
        ..add('startup')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    value = object.level;
    if (value != null) {
      result
        ..add('level')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dateUpdated;
    if (value != null) {
      result
        ..add('date_updated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.levelOneProgress;
    if (value != null) {
      result
        ..add('level_one_progress')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.levelTwoProgress;
    if (value != null) {
      result
        ..add('level_two_progress')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.levelThreeProgress;
    if (value != null) {
      result
        ..add('level_three_progress')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.levelFourProgress;
    if (value != null) {
      result
        ..add('level_four_progress')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.levelFiveProgress;
    if (value != null) {
      result
        ..add('level_five_progress')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.levelSixProgress;
    if (value != null) {
      result
        ..add('level_six_progress')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.levelSevenProgress;
    if (value != null) {
      result
        ..add('level_seven_progress')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.levelEightProgress;
    if (value != null) {
      result
        ..add('level_eight_progress')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.levelNineProgress;
    if (value != null) {
      result
        ..add('level_nine_progress')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    return result;
  }

  @override
  TrlProgressRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TrlProgressRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'startup':
          result.startup = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'date_updated':
          result.dateUpdated = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'level_one_progress':
          result.levelOneProgress = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level_two_progress':
          result.levelTwoProgress = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level_three_progress':
          result.levelThreeProgress = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level_four_progress':
          result.levelFourProgress = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level_five_progress':
          result.levelFiveProgress = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level_six_progress':
          result.levelSixProgress = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level_seven_progress':
          result.levelSevenProgress = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level_eight_progress':
          result.levelEightProgress = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'level_nine_progress':
          result.levelNineProgress = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
      }
    }

    return result.build();
  }
}

class _$TrlProgressRecord extends TrlProgressRecord {
  @override
  final DocumentReference startup;
  @override
  final int level;
  @override
  final Timestamp dateUpdated;
  @override
  final int levelOneProgress;
  @override
  final int levelTwoProgress;
  @override
  final int levelThreeProgress;
  @override
  final int levelFourProgress;
  @override
  final int levelFiveProgress;
  @override
  final int levelSixProgress;
  @override
  final int levelSevenProgress;
  @override
  final int levelEightProgress;
  @override
  final int levelNineProgress;
  @override
  final DocumentReference reference;

  factory _$TrlProgressRecord(
          [void Function(TrlProgressRecordBuilder) updates]) =>
      (new TrlProgressRecordBuilder()..update(updates)).build();

  _$TrlProgressRecord._(
      {this.startup,
      this.level,
      this.dateUpdated,
      this.levelOneProgress,
      this.levelTwoProgress,
      this.levelThreeProgress,
      this.levelFourProgress,
      this.levelFiveProgress,
      this.levelSixProgress,
      this.levelSevenProgress,
      this.levelEightProgress,
      this.levelNineProgress,
      this.reference})
      : super._();

  @override
  TrlProgressRecord rebuild(void Function(TrlProgressRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TrlProgressRecordBuilder toBuilder() =>
      new TrlProgressRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TrlProgressRecord &&
        startup == other.startup &&
        level == other.level &&
        dateUpdated == other.dateUpdated &&
        levelOneProgress == other.levelOneProgress &&
        levelTwoProgress == other.levelTwoProgress &&
        levelThreeProgress == other.levelThreeProgress &&
        levelFourProgress == other.levelFourProgress &&
        levelFiveProgress == other.levelFiveProgress &&
        levelSixProgress == other.levelSixProgress &&
        levelSevenProgress == other.levelSevenProgress &&
        levelEightProgress == other.levelEightProgress &&
        levelNineProgress == other.levelNineProgress &&
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
                                                $jc($jc(0, startup.hashCode),
                                                    level.hashCode),
                                                dateUpdated.hashCode),
                                            levelOneProgress.hashCode),
                                        levelTwoProgress.hashCode),
                                    levelThreeProgress.hashCode),
                                levelFourProgress.hashCode),
                            levelFiveProgress.hashCode),
                        levelSixProgress.hashCode),
                    levelSevenProgress.hashCode),
                levelEightProgress.hashCode),
            levelNineProgress.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TrlProgressRecord')
          ..add('startup', startup)
          ..add('level', level)
          ..add('dateUpdated', dateUpdated)
          ..add('levelOneProgress', levelOneProgress)
          ..add('levelTwoProgress', levelTwoProgress)
          ..add('levelThreeProgress', levelThreeProgress)
          ..add('levelFourProgress', levelFourProgress)
          ..add('levelFiveProgress', levelFiveProgress)
          ..add('levelSixProgress', levelSixProgress)
          ..add('levelSevenProgress', levelSevenProgress)
          ..add('levelEightProgress', levelEightProgress)
          ..add('levelNineProgress', levelNineProgress)
          ..add('reference', reference))
        .toString();
  }
}

class TrlProgressRecordBuilder
    implements Builder<TrlProgressRecord, TrlProgressRecordBuilder> {
  _$TrlProgressRecord _$v;

  DocumentReference _startup;
  DocumentReference get startup => _$this._startup;
  set startup(DocumentReference startup) => _$this._startup = startup;

  int _level;
  int get level => _$this._level;
  set level(int level) => _$this._level = level;

  Timestamp _dateUpdated;
  Timestamp get dateUpdated => _$this._dateUpdated;
  set dateUpdated(Timestamp dateUpdated) => _$this._dateUpdated = dateUpdated;

  int _levelOneProgress;
  int get levelOneProgress => _$this._levelOneProgress;
  set levelOneProgress(int levelOneProgress) =>
      _$this._levelOneProgress = levelOneProgress;

  int _levelTwoProgress;
  int get levelTwoProgress => _$this._levelTwoProgress;
  set levelTwoProgress(int levelTwoProgress) =>
      _$this._levelTwoProgress = levelTwoProgress;

  int _levelThreeProgress;
  int get levelThreeProgress => _$this._levelThreeProgress;
  set levelThreeProgress(int levelThreeProgress) =>
      _$this._levelThreeProgress = levelThreeProgress;

  int _levelFourProgress;
  int get levelFourProgress => _$this._levelFourProgress;
  set levelFourProgress(int levelFourProgress) =>
      _$this._levelFourProgress = levelFourProgress;

  int _levelFiveProgress;
  int get levelFiveProgress => _$this._levelFiveProgress;
  set levelFiveProgress(int levelFiveProgress) =>
      _$this._levelFiveProgress = levelFiveProgress;

  int _levelSixProgress;
  int get levelSixProgress => _$this._levelSixProgress;
  set levelSixProgress(int levelSixProgress) =>
      _$this._levelSixProgress = levelSixProgress;

  int _levelSevenProgress;
  int get levelSevenProgress => _$this._levelSevenProgress;
  set levelSevenProgress(int levelSevenProgress) =>
      _$this._levelSevenProgress = levelSevenProgress;

  int _levelEightProgress;
  int get levelEightProgress => _$this._levelEightProgress;
  set levelEightProgress(int levelEightProgress) =>
      _$this._levelEightProgress = levelEightProgress;

  int _levelNineProgress;
  int get levelNineProgress => _$this._levelNineProgress;
  set levelNineProgress(int levelNineProgress) =>
      _$this._levelNineProgress = levelNineProgress;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  TrlProgressRecordBuilder() {
    TrlProgressRecord._initializeBuilder(this);
  }

  TrlProgressRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startup = $v.startup;
      _level = $v.level;
      _dateUpdated = $v.dateUpdated;
      _levelOneProgress = $v.levelOneProgress;
      _levelTwoProgress = $v.levelTwoProgress;
      _levelThreeProgress = $v.levelThreeProgress;
      _levelFourProgress = $v.levelFourProgress;
      _levelFiveProgress = $v.levelFiveProgress;
      _levelSixProgress = $v.levelSixProgress;
      _levelSevenProgress = $v.levelSevenProgress;
      _levelEightProgress = $v.levelEightProgress;
      _levelNineProgress = $v.levelNineProgress;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TrlProgressRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TrlProgressRecord;
  }

  @override
  void update(void Function(TrlProgressRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TrlProgressRecord build() {
    final _$result = _$v ??
        new _$TrlProgressRecord._(
            startup: startup,
            level: level,
            dateUpdated: dateUpdated,
            levelOneProgress: levelOneProgress,
            levelTwoProgress: levelTwoProgress,
            levelThreeProgress: levelThreeProgress,
            levelFourProgress: levelFourProgress,
            levelFiveProgress: levelFiveProgress,
            levelSixProgress: levelSixProgress,
            levelSevenProgress: levelSevenProgress,
            levelEightProgress: levelEightProgress,
            levelNineProgress: levelNineProgress,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
