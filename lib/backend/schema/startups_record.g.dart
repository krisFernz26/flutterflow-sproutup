// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startups_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StartupsRecord> _$startupsRecordSerializer =
    new _$StartupsRecordSerializer();

class _$StartupsRecordSerializer
    implements StructuredSerializer<StartupsRecord> {
  @override
  final Iterable<Type> types = const [StartupsRecord, _$StartupsRecord];
  @override
  final String wireName = 'StartupsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, StartupsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateRegistered;
    if (value != null) {
      result
        ..add('date_registered')
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
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.motto;
    if (value != null) {
      result
        ..add('motto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.videoUrl;
    if (value != null) {
      result
        ..add('video_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lookingFor;
    if (value != null) {
      result
        ..add('looking_for')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.followerCount;
    if (value != null) {
      result
        ..add('follower_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.applicantCount;
    if (value != null) {
      result
        ..add('applicant_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.investorCount;
    if (value != null) {
      result
        ..add('investor_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userRegisterer;
    if (value != null) {
      result
        ..add('user_registerer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    value = object.isFeatured;
    if (value != null) {
      result
        ..add('is_featured')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.followers;
    if (value != null) {
      result
        ..add('followers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(DocumentReference)])));
    }
    value = object.investors;
    if (value != null) {
      result
        ..add('investors')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(DocumentReference)])));
    }
    value = object.applicants;
    if (value != null) {
      result
        ..add('applicants')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(DocumentReference)])));
    }
    value = object.trl;
    if (value != null) {
      result
        ..add('trl')
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
  StartupsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StartupsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_registered':
          result.dateRegistered = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'date_updated':
          result.dateUpdated = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'motto':
          result.motto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video_url':
          result.videoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'looking_for':
          result.lookingFor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'follower_count':
          result.followerCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'applicant_count':
          result.applicantCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'investor_count':
          result.investorCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user_registerer':
          result.userRegisterer = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
        case 'is_featured':
          result.isFeatured = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'followers':
          result.followers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DocumentReference)]))
              as BuiltList<Object>);
          break;
        case 'investors':
          result.investors.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DocumentReference)]))
              as BuiltList<Object>);
          break;
        case 'applicants':
          result.applicants.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DocumentReference)]))
              as BuiltList<Object>);
          break;
        case 'trl':
          result.trl = serializers.deserialize(value,
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

class _$StartupsRecord extends StartupsRecord {
  @override
  final String name;
  @override
  final Timestamp dateRegistered;
  @override
  final Timestamp dateUpdated;
  @override
  final String logo;
  @override
  final BuiltList<String> images;
  @override
  final String description;
  @override
  final String motto;
  @override
  final String videoUrl;
  @override
  final String lookingFor;
  @override
  final int followerCount;
  @override
  final int applicantCount;
  @override
  final String location;
  @override
  final int investorCount;
  @override
  final DocumentReference userRegisterer;
  @override
  final bool isFeatured;
  @override
  final BuiltList<DocumentReference> followers;
  @override
  final BuiltList<DocumentReference> investors;
  @override
  final BuiltList<DocumentReference> applicants;
  @override
  final int trl;
  @override
  final DocumentReference reference;

  factory _$StartupsRecord([void Function(StartupsRecordBuilder) updates]) =>
      (new StartupsRecordBuilder()..update(updates)).build();

  _$StartupsRecord._(
      {this.name,
      this.dateRegistered,
      this.dateUpdated,
      this.logo,
      this.images,
      this.description,
      this.motto,
      this.videoUrl,
      this.lookingFor,
      this.followerCount,
      this.applicantCount,
      this.location,
      this.investorCount,
      this.userRegisterer,
      this.isFeatured,
      this.followers,
      this.investors,
      this.applicants,
      this.trl,
      this.reference})
      : super._();

  @override
  StartupsRecord rebuild(void Function(StartupsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StartupsRecordBuilder toBuilder() =>
      new StartupsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StartupsRecord &&
        name == other.name &&
        dateRegistered == other.dateRegistered &&
        dateUpdated == other.dateUpdated &&
        logo == other.logo &&
        images == other.images &&
        description == other.description &&
        motto == other.motto &&
        videoUrl == other.videoUrl &&
        lookingFor == other.lookingFor &&
        followerCount == other.followerCount &&
        applicantCount == other.applicantCount &&
        location == other.location &&
        investorCount == other.investorCount &&
        userRegisterer == other.userRegisterer &&
        isFeatured == other.isFeatured &&
        followers == other.followers &&
        investors == other.investors &&
        applicants == other.applicants &&
        trl == other.trl &&
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
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc(0, name.hashCode),
                                                                                dateRegistered.hashCode),
                                                                            dateUpdated.hashCode),
                                                                        logo.hashCode),
                                                                    images.hashCode),
                                                                description.hashCode),
                                                            motto.hashCode),
                                                        videoUrl.hashCode),
                                                    lookingFor.hashCode),
                                                followerCount.hashCode),
                                            applicantCount.hashCode),
                                        location.hashCode),
                                    investorCount.hashCode),
                                userRegisterer.hashCode),
                            isFeatured.hashCode),
                        followers.hashCode),
                    investors.hashCode),
                applicants.hashCode),
            trl.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StartupsRecord')
          ..add('name', name)
          ..add('dateRegistered', dateRegistered)
          ..add('dateUpdated', dateUpdated)
          ..add('logo', logo)
          ..add('images', images)
          ..add('description', description)
          ..add('motto', motto)
          ..add('videoUrl', videoUrl)
          ..add('lookingFor', lookingFor)
          ..add('followerCount', followerCount)
          ..add('applicantCount', applicantCount)
          ..add('location', location)
          ..add('investorCount', investorCount)
          ..add('userRegisterer', userRegisterer)
          ..add('isFeatured', isFeatured)
          ..add('followers', followers)
          ..add('investors', investors)
          ..add('applicants', applicants)
          ..add('trl', trl)
          ..add('reference', reference))
        .toString();
  }
}

class StartupsRecordBuilder
    implements Builder<StartupsRecord, StartupsRecordBuilder> {
  _$StartupsRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  Timestamp _dateRegistered;
  Timestamp get dateRegistered => _$this._dateRegistered;
  set dateRegistered(Timestamp dateRegistered) =>
      _$this._dateRegistered = dateRegistered;

  Timestamp _dateUpdated;
  Timestamp get dateUpdated => _$this._dateUpdated;
  set dateUpdated(Timestamp dateUpdated) => _$this._dateUpdated = dateUpdated;

  String _logo;
  String get logo => _$this._logo;
  set logo(String logo) => _$this._logo = logo;

  ListBuilder<String> _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String> images) => _$this._images = images;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _motto;
  String get motto => _$this._motto;
  set motto(String motto) => _$this._motto = motto;

  String _videoUrl;
  String get videoUrl => _$this._videoUrl;
  set videoUrl(String videoUrl) => _$this._videoUrl = videoUrl;

  String _lookingFor;
  String get lookingFor => _$this._lookingFor;
  set lookingFor(String lookingFor) => _$this._lookingFor = lookingFor;

  int _followerCount;
  int get followerCount => _$this._followerCount;
  set followerCount(int followerCount) => _$this._followerCount = followerCount;

  int _applicantCount;
  int get applicantCount => _$this._applicantCount;
  set applicantCount(int applicantCount) =>
      _$this._applicantCount = applicantCount;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  int _investorCount;
  int get investorCount => _$this._investorCount;
  set investorCount(int investorCount) => _$this._investorCount = investorCount;

  DocumentReference _userRegisterer;
  DocumentReference get userRegisterer => _$this._userRegisterer;
  set userRegisterer(DocumentReference userRegisterer) =>
      _$this._userRegisterer = userRegisterer;

  bool _isFeatured;
  bool get isFeatured => _$this._isFeatured;
  set isFeatured(bool isFeatured) => _$this._isFeatured = isFeatured;

  ListBuilder<DocumentReference> _followers;
  ListBuilder<DocumentReference> get followers =>
      _$this._followers ??= new ListBuilder<DocumentReference>();
  set followers(ListBuilder<DocumentReference> followers) =>
      _$this._followers = followers;

  ListBuilder<DocumentReference> _investors;
  ListBuilder<DocumentReference> get investors =>
      _$this._investors ??= new ListBuilder<DocumentReference>();
  set investors(ListBuilder<DocumentReference> investors) =>
      _$this._investors = investors;

  ListBuilder<DocumentReference> _applicants;
  ListBuilder<DocumentReference> get applicants =>
      _$this._applicants ??= new ListBuilder<DocumentReference>();
  set applicants(ListBuilder<DocumentReference> applicants) =>
      _$this._applicants = applicants;

  int _trl;
  int get trl => _$this._trl;
  set trl(int trl) => _$this._trl = trl;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  StartupsRecordBuilder() {
    StartupsRecord._initializeBuilder(this);
  }

  StartupsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _dateRegistered = $v.dateRegistered;
      _dateUpdated = $v.dateUpdated;
      _logo = $v.logo;
      _images = $v.images?.toBuilder();
      _description = $v.description;
      _motto = $v.motto;
      _videoUrl = $v.videoUrl;
      _lookingFor = $v.lookingFor;
      _followerCount = $v.followerCount;
      _applicantCount = $v.applicantCount;
      _location = $v.location;
      _investorCount = $v.investorCount;
      _userRegisterer = $v.userRegisterer;
      _isFeatured = $v.isFeatured;
      _followers = $v.followers?.toBuilder();
      _investors = $v.investors?.toBuilder();
      _applicants = $v.applicants?.toBuilder();
      _trl = $v.trl;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StartupsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StartupsRecord;
  }

  @override
  void update(void Function(StartupsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StartupsRecord build() {
    _$StartupsRecord _$result;
    try {
      _$result = _$v ??
          new _$StartupsRecord._(
              name: name,
              dateRegistered: dateRegistered,
              dateUpdated: dateUpdated,
              logo: logo,
              images: _images?.build(),
              description: description,
              motto: motto,
              videoUrl: videoUrl,
              lookingFor: lookingFor,
              followerCount: followerCount,
              applicantCount: applicantCount,
              location: location,
              investorCount: investorCount,
              userRegisterer: userRegisterer,
              isFeatured: isFeatured,
              followers: _followers?.build(),
              investors: _investors?.build(),
              applicants: _applicants?.build(),
              trl: trl,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'followers';
        _followers?.build();
        _$failedField = 'investors';
        _investors?.build();
        _$failedField = 'applicants';
        _applicants?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StartupsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
