// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReportsRecord> _$reportsRecordSerializer =
    new _$ReportsRecordSerializer();

class _$ReportsRecordSerializer implements StructuredSerializer<ReportsRecord> {
  @override
  final Iterable<Type> types = const [ReportsRecord, _$ReportsRecord];
  @override
  final String wireName = 'ReportsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ReportsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateSent;
    if (value != null) {
      result
        ..add('date_sent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.dateInvestigated;
    if (value != null) {
      result
        ..add('date_investigated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reportedId;
    if (value != null) {
      result
        ..add('reported_id')
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
  ReportsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReportsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_sent':
          result.dateSent = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'date_investigated':
          result.dateInvestigated = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reported_id':
          result.reportedId = serializers.deserialize(value,
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

class _$ReportsRecord extends ReportsRecord {
  @override
  final DocumentReference user;
  @override
  final BuiltList<String> images;
  @override
  final String video;
  @override
  final String text;
  @override
  final Timestamp dateSent;
  @override
  final Timestamp dateInvestigated;
  @override
  final String status;
  @override
  final String reportedId;
  @override
  final DocumentReference reference;

  factory _$ReportsRecord([void Function(ReportsRecordBuilder) updates]) =>
      (new ReportsRecordBuilder()..update(updates)).build();

  _$ReportsRecord._(
      {this.user,
      this.images,
      this.video,
      this.text,
      this.dateSent,
      this.dateInvestigated,
      this.status,
      this.reportedId,
      this.reference})
      : super._();

  @override
  ReportsRecord rebuild(void Function(ReportsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportsRecordBuilder toBuilder() => new ReportsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportsRecord &&
        user == other.user &&
        images == other.images &&
        video == other.video &&
        text == other.text &&
        dateSent == other.dateSent &&
        dateInvestigated == other.dateInvestigated &&
        status == other.status &&
        reportedId == other.reportedId &&
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
                            $jc($jc($jc(0, user.hashCode), images.hashCode),
                                video.hashCode),
                            text.hashCode),
                        dateSent.hashCode),
                    dateInvestigated.hashCode),
                status.hashCode),
            reportedId.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReportsRecord')
          ..add('user', user)
          ..add('images', images)
          ..add('video', video)
          ..add('text', text)
          ..add('dateSent', dateSent)
          ..add('dateInvestigated', dateInvestigated)
          ..add('status', status)
          ..add('reportedId', reportedId)
          ..add('reference', reference))
        .toString();
  }
}

class ReportsRecordBuilder
    implements Builder<ReportsRecord, ReportsRecordBuilder> {
  _$ReportsRecord _$v;

  DocumentReference _user;
  DocumentReference get user => _$this._user;
  set user(DocumentReference user) => _$this._user = user;

  ListBuilder<String> _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String> images) => _$this._images = images;

  String _video;
  String get video => _$this._video;
  set video(String video) => _$this._video = video;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  Timestamp _dateSent;
  Timestamp get dateSent => _$this._dateSent;
  set dateSent(Timestamp dateSent) => _$this._dateSent = dateSent;

  Timestamp _dateInvestigated;
  Timestamp get dateInvestigated => _$this._dateInvestigated;
  set dateInvestigated(Timestamp dateInvestigated) =>
      _$this._dateInvestigated = dateInvestigated;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _reportedId;
  String get reportedId => _$this._reportedId;
  set reportedId(String reportedId) => _$this._reportedId = reportedId;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  ReportsRecordBuilder() {
    ReportsRecord._initializeBuilder(this);
  }

  ReportsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _images = $v.images?.toBuilder();
      _video = $v.video;
      _text = $v.text;
      _dateSent = $v.dateSent;
      _dateInvestigated = $v.dateInvestigated;
      _status = $v.status;
      _reportedId = $v.reportedId;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportsRecord;
  }

  @override
  void update(void Function(ReportsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReportsRecord build() {
    _$ReportsRecord _$result;
    try {
      _$result = _$v ??
          new _$ReportsRecord._(
              user: user,
              images: _images?.build(),
              video: video,
              text: text,
              dateSent: dateSent,
              dateInvestigated: dateInvestigated,
              status: status,
              reportedId: reportedId,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ReportsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
