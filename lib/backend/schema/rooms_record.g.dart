// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RoomsRecord> _$roomsRecordSerializer = new _$RoomsRecordSerializer();

class _$RoomsRecordSerializer implements StructuredSerializer<RoomsRecord> {
  @override
  final Iterable<Type> types = const [RoomsRecord, _$RoomsRecord];
  @override
  final String wireName = 'RoomsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, RoomsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(DocumentReference)])));
    }
    value = object.startups;
    if (value != null) {
      result
        ..add('startups')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(DocumentReference)])));
    }
    value = object.dateCreated;
    if (value != null) {
      result
        ..add('date_created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.purpose;
    if (value != null) {
      result
        ..add('purpose')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  RoomsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoomsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DocumentReference)]))
              as BuiltList<Object>);
          break;
        case 'startups':
          result.startups.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DocumentReference)]))
              as BuiltList<Object>);
          break;
        case 'date_created':
          result.dateCreated = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'purpose':
          result.purpose = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$RoomsRecord extends RoomsRecord {
  @override
  final BuiltList<DocumentReference> users;
  @override
  final BuiltList<DocumentReference> startups;
  @override
  final Timestamp dateCreated;
  @override
  final String purpose;
  @override
  final DocumentReference reference;

  factory _$RoomsRecord([void Function(RoomsRecordBuilder) updates]) =>
      (new RoomsRecordBuilder()..update(updates)).build();

  _$RoomsRecord._(
      {this.users,
      this.startups,
      this.dateCreated,
      this.purpose,
      this.reference})
      : super._();

  @override
  RoomsRecord rebuild(void Function(RoomsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoomsRecordBuilder toBuilder() => new RoomsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoomsRecord &&
        users == other.users &&
        startups == other.startups &&
        dateCreated == other.dateCreated &&
        purpose == other.purpose &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, users.hashCode), startups.hashCode),
                dateCreated.hashCode),
            purpose.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RoomsRecord')
          ..add('users', users)
          ..add('startups', startups)
          ..add('dateCreated', dateCreated)
          ..add('purpose', purpose)
          ..add('reference', reference))
        .toString();
  }
}

class RoomsRecordBuilder implements Builder<RoomsRecord, RoomsRecordBuilder> {
  _$RoomsRecord _$v;

  ListBuilder<DocumentReference> _users;
  ListBuilder<DocumentReference> get users =>
      _$this._users ??= new ListBuilder<DocumentReference>();
  set users(ListBuilder<DocumentReference> users) => _$this._users = users;

  ListBuilder<DocumentReference> _startups;
  ListBuilder<DocumentReference> get startups =>
      _$this._startups ??= new ListBuilder<DocumentReference>();
  set startups(ListBuilder<DocumentReference> startups) =>
      _$this._startups = startups;

  Timestamp _dateCreated;
  Timestamp get dateCreated => _$this._dateCreated;
  set dateCreated(Timestamp dateCreated) => _$this._dateCreated = dateCreated;

  String _purpose;
  String get purpose => _$this._purpose;
  set purpose(String purpose) => _$this._purpose = purpose;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  RoomsRecordBuilder() {
    RoomsRecord._initializeBuilder(this);
  }

  RoomsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users?.toBuilder();
      _startups = $v.startups?.toBuilder();
      _dateCreated = $v.dateCreated;
      _purpose = $v.purpose;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RoomsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RoomsRecord;
  }

  @override
  void update(void Function(RoomsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RoomsRecord build() {
    _$RoomsRecord _$result;
    try {
      _$result = _$v ??
          new _$RoomsRecord._(
              users: _users?.build(),
              startups: _startups?.build(),
              dateCreated: dateCreated,
              purpose: purpose,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
        _$failedField = 'startups';
        _startups?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RoomsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
