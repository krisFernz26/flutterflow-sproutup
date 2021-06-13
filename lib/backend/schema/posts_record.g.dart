// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsRecord> _$postsRecordSerializer = new _$PostsRecordSerializer();

class _$PostsRecordSerializer implements StructuredSerializer<PostsRecord> {
  @override
  final Iterable<Type> types = const [PostsRecord, _$PostsRecord];
  @override
  final String wireName = 'PostsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    value = object.startup;
    if (value != null) {
      result
        ..add('startup')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    value = object.body;
    if (value != null) {
      result
        ..add('body')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.datePosted;
    if (value != null) {
      result
        ..add('date_posted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.dateUpdated;
    if (value != null) {
      result
        ..add('date_updated')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.likesCount;
    if (value != null) {
      result
        ..add('likes_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.likedUsers;
    if (value != null) {
      result
        ..add('liked_users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(DocumentReference)])));
    }
    value = object.thumbnail;
    if (value != null) {
      result
        ..add('thumbnail')
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
  PostsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
        case 'startup':
          result.startup = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'date_posted':
          result.datePosted = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'date_updated':
          result.dateUpdated = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'likes_count':
          result.likesCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'liked_users':
          result.likedUsers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DocumentReference)]))
              as BuiltList<Object>);
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
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

class _$PostsRecord extends PostsRecord {
  @override
  final String title;
  @override
  final DocumentReference user;
  @override
  final DocumentReference startup;
  @override
  final String body;
  @override
  final BuiltList<String> images;
  @override
  final Timestamp datePosted;
  @override
  final Timestamp dateUpdated;
  @override
  final int likesCount;
  @override
  final BuiltList<DocumentReference> likedUsers;
  @override
  final String thumbnail;
  @override
  final DocumentReference reference;

  factory _$PostsRecord([void Function(PostsRecordBuilder) updates]) =>
      (new PostsRecordBuilder()..update(updates)).build();

  _$PostsRecord._(
      {this.title,
      this.user,
      this.startup,
      this.body,
      this.images,
      this.datePosted,
      this.dateUpdated,
      this.likesCount,
      this.likedUsers,
      this.thumbnail,
      this.reference})
      : super._();

  @override
  PostsRecord rebuild(void Function(PostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsRecordBuilder toBuilder() => new PostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsRecord &&
        title == other.title &&
        user == other.user &&
        startup == other.startup &&
        body == other.body &&
        images == other.images &&
        datePosted == other.datePosted &&
        dateUpdated == other.dateUpdated &&
        likesCount == other.likesCount &&
        likedUsers == other.likedUsers &&
        thumbnail == other.thumbnail &&
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
                                        $jc($jc(0, title.hashCode),
                                            user.hashCode),
                                        startup.hashCode),
                                    body.hashCode),
                                images.hashCode),
                            datePosted.hashCode),
                        dateUpdated.hashCode),
                    likesCount.hashCode),
                likedUsers.hashCode),
            thumbnail.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostsRecord')
          ..add('title', title)
          ..add('user', user)
          ..add('startup', startup)
          ..add('body', body)
          ..add('images', images)
          ..add('datePosted', datePosted)
          ..add('dateUpdated', dateUpdated)
          ..add('likesCount', likesCount)
          ..add('likedUsers', likedUsers)
          ..add('thumbnail', thumbnail)
          ..add('reference', reference))
        .toString();
  }
}

class PostsRecordBuilder implements Builder<PostsRecord, PostsRecordBuilder> {
  _$PostsRecord _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  DocumentReference _user;
  DocumentReference get user => _$this._user;
  set user(DocumentReference user) => _$this._user = user;

  DocumentReference _startup;
  DocumentReference get startup => _$this._startup;
  set startup(DocumentReference startup) => _$this._startup = startup;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  ListBuilder<String> _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String> images) => _$this._images = images;

  Timestamp _datePosted;
  Timestamp get datePosted => _$this._datePosted;
  set datePosted(Timestamp datePosted) => _$this._datePosted = datePosted;

  Timestamp _dateUpdated;
  Timestamp get dateUpdated => _$this._dateUpdated;
  set dateUpdated(Timestamp dateUpdated) => _$this._dateUpdated = dateUpdated;

  int _likesCount;
  int get likesCount => _$this._likesCount;
  set likesCount(int likesCount) => _$this._likesCount = likesCount;

  ListBuilder<DocumentReference> _likedUsers;
  ListBuilder<DocumentReference> get likedUsers =>
      _$this._likedUsers ??= new ListBuilder<DocumentReference>();
  set likedUsers(ListBuilder<DocumentReference> likedUsers) =>
      _$this._likedUsers = likedUsers;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  PostsRecordBuilder() {
    PostsRecord._initializeBuilder(this);
  }

  PostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _user = $v.user;
      _startup = $v.startup;
      _body = $v.body;
      _images = $v.images?.toBuilder();
      _datePosted = $v.datePosted;
      _dateUpdated = $v.dateUpdated;
      _likesCount = $v.likesCount;
      _likedUsers = $v.likedUsers?.toBuilder();
      _thumbnail = $v.thumbnail;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsRecord;
  }

  @override
  void update(void Function(PostsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostsRecord build() {
    _$PostsRecord _$result;
    try {
      _$result = _$v ??
          new _$PostsRecord._(
              title: title,
              user: user,
              startup: startup,
              body: body,
              images: _images?.build(),
              datePosted: datePosted,
              dateUpdated: dateUpdated,
              likesCount: likesCount,
              likedUsers: _likedUsers?.build(),
              thumbnail: thumbnail,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'likedUsers';
        _likedUsers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
