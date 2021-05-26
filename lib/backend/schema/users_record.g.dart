// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateLastLoggedIn;
    if (value != null) {
      result
        ..add('date_last_logged_in')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.investmentCount;
    if (value != null) {
      result
        ..add('investment_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.followCount;
    if (value != null) {
      result
        ..add('follow_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.applicationCount;
    if (value != null) {
      result
        ..add('application_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.startup;
    if (value != null) {
      result
        ..add('startup')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    value = object.isPremium;
    if (value != null) {
      result
        ..add('is_premium')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.likesCount;
    if (value != null) {
      result
        ..add('likes_count')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_last_logged_in':
          result.dateLastLoggedIn = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'investment_count':
          result.investmentCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'follow_count':
          result.followCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'application_count':
          result.applicationCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'startup':
          result.startup = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
        case 'is_premium':
          result.isPremium = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'likes_count':
          result.likesCount = serializers.deserialize(value,
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

class _$UsersRecord extends UsersRecord {
  @override
  final String lastName;
  @override
  final String email;
  @override
  final Timestamp dateLastLoggedIn;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final String uid;
  @override
  final Timestamp createdTime;
  @override
  final int investmentCount;
  @override
  final int followCount;
  @override
  final int applicationCount;
  @override
  final DocumentReference startup;
  @override
  final bool isPremium;
  @override
  final int likesCount;
  @override
  final DocumentReference reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder) updates]) =>
      (new UsersRecordBuilder()..update(updates)).build();

  _$UsersRecord._(
      {this.lastName,
      this.email,
      this.dateLastLoggedIn,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.investmentCount,
      this.followCount,
      this.applicationCount,
      this.startup,
      this.isPremium,
      this.likesCount,
      this.reference})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        lastName == other.lastName &&
        email == other.email &&
        dateLastLoggedIn == other.dateLastLoggedIn &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        investmentCount == other.investmentCount &&
        followCount == other.followCount &&
        applicationCount == other.applicationCount &&
        startup == other.startup &&
        isPremium == other.isPremium &&
        likesCount == other.likesCount &&
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
                                                $jc(
                                                    $jc(
                                                        $jc(0,
                                                            lastName.hashCode),
                                                        email.hashCode),
                                                    dateLastLoggedIn.hashCode),
                                                displayName.hashCode),
                                            photoUrl.hashCode),
                                        uid.hashCode),
                                    createdTime.hashCode),
                                investmentCount.hashCode),
                            followCount.hashCode),
                        applicationCount.hashCode),
                    startup.hashCode),
                isPremium.hashCode),
            likesCount.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersRecord')
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('dateLastLoggedIn', dateLastLoggedIn)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('investmentCount', investmentCount)
          ..add('followCount', followCount)
          ..add('applicationCount', applicationCount)
          ..add('startup', startup)
          ..add('isPremium', isPremium)
          ..add('likesCount', likesCount)
          ..add('reference', reference))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord _$v;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  Timestamp _dateLastLoggedIn;
  Timestamp get dateLastLoggedIn => _$this._dateLastLoggedIn;
  set dateLastLoggedIn(Timestamp dateLastLoggedIn) =>
      _$this._dateLastLoggedIn = dateLastLoggedIn;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  Timestamp _createdTime;
  Timestamp get createdTime => _$this._createdTime;
  set createdTime(Timestamp createdTime) => _$this._createdTime = createdTime;

  int _investmentCount;
  int get investmentCount => _$this._investmentCount;
  set investmentCount(int investmentCount) =>
      _$this._investmentCount = investmentCount;

  int _followCount;
  int get followCount => _$this._followCount;
  set followCount(int followCount) => _$this._followCount = followCount;

  int _applicationCount;
  int get applicationCount => _$this._applicationCount;
  set applicationCount(int applicationCount) =>
      _$this._applicationCount = applicationCount;

  DocumentReference _startup;
  DocumentReference get startup => _$this._startup;
  set startup(DocumentReference startup) => _$this._startup = startup;

  bool _isPremium;
  bool get isPremium => _$this._isPremium;
  set isPremium(bool isPremium) => _$this._isPremium = isPremium;

  int _likesCount;
  int get likesCount => _$this._likesCount;
  set likesCount(int likesCount) => _$this._likesCount = likesCount;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lastName = $v.lastName;
      _email = $v.email;
      _dateLastLoggedIn = $v.dateLastLoggedIn;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _investmentCount = $v.investmentCount;
      _followCount = $v.followCount;
      _applicationCount = $v.applicationCount;
      _startup = $v.startup;
      _isPremium = $v.isPremium;
      _likesCount = $v.likesCount;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersRecord build() {
    final _$result = _$v ??
        new _$UsersRecord._(
            lastName: lastName,
            email: email,
            dateLastLoggedIn: dateLastLoggedIn,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            investmentCount: investmentCount,
            followCount: followCount,
            applicationCount: applicationCount,
            startup: startup,
            isPremium: isPremium,
            likesCount: likesCount,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
