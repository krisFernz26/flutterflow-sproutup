// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MessagesRecord> _$messagesRecordSerializer =
    new _$MessagesRecordSerializer();

class _$MessagesRecordSerializer
    implements StructuredSerializer<MessagesRecord> {
  @override
  final Iterable<Type> types = const [MessagesRecord, _$MessagesRecord];
  @override
  final String wireName = 'MessagesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MessagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
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
    value = object.room;
    if (value != null) {
      result
        ..add('room')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
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
  MessagesRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'author':
          result.author = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_sent':
          result.dateSent = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'room':
          result.room = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
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

class _$MessagesRecord extends MessagesRecord {
  @override
  final DocumentReference author;
  @override
  final String text;
  @override
  final String image;
  @override
  final String video;
  @override
  final Timestamp dateSent;
  @override
  final DocumentReference room;
  @override
  final DocumentReference reference;

  factory _$MessagesRecord([void Function(MessagesRecordBuilder) updates]) =>
      (new MessagesRecordBuilder()..update(updates)).build();

  _$MessagesRecord._(
      {this.author,
      this.text,
      this.image,
      this.video,
      this.dateSent,
      this.room,
      this.reference})
      : super._();

  @override
  MessagesRecord rebuild(void Function(MessagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessagesRecordBuilder toBuilder() =>
      new MessagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessagesRecord &&
        author == other.author &&
        text == other.text &&
        image == other.image &&
        video == other.video &&
        dateSent == other.dateSent &&
        room == other.room &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, author.hashCode), text.hashCode),
                        image.hashCode),
                    video.hashCode),
                dateSent.hashCode),
            room.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessagesRecord')
          ..add('author', author)
          ..add('text', text)
          ..add('image', image)
          ..add('video', video)
          ..add('dateSent', dateSent)
          ..add('room', room)
          ..add('reference', reference))
        .toString();
  }
}

class MessagesRecordBuilder
    implements Builder<MessagesRecord, MessagesRecordBuilder> {
  _$MessagesRecord _$v;

  DocumentReference _author;
  DocumentReference get author => _$this._author;
  set author(DocumentReference author) => _$this._author = author;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _video;
  String get video => _$this._video;
  set video(String video) => _$this._video = video;

  Timestamp _dateSent;
  Timestamp get dateSent => _$this._dateSent;
  set dateSent(Timestamp dateSent) => _$this._dateSent = dateSent;

  DocumentReference _room;
  DocumentReference get room => _$this._room;
  set room(DocumentReference room) => _$this._room = room;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  MessagesRecordBuilder() {
    MessagesRecord._initializeBuilder(this);
  }

  MessagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _author = $v.author;
      _text = $v.text;
      _image = $v.image;
      _video = $v.video;
      _dateSent = $v.dateSent;
      _room = $v.room;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessagesRecord;
  }

  @override
  void update(void Function(MessagesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessagesRecord build() {
    final _$result = _$v ??
        new _$MessagesRecord._(
            author: author,
            text: text,
            image: image,
            video: video,
            dateSent: dateSent,
            room: room,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
