import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'date_last_logged_in')
  Timestamp get dateLastLoggedIn;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  Timestamp get createdTime;

  @nullable
  @BuiltValueField(wireName: 'investment_count')
  int get investmentCount;

  @nullable
  @BuiltValueField(wireName: 'follow_count')
  int get followCount;

  @nullable
  @BuiltValueField(wireName: 'application_count')
  int get applicationCount;

  @nullable
  DocumentReference get startup;

  @nullable
  @BuiltValueField(wireName: 'is_premium')
  bool get isPremium;

  @nullable
  @BuiltValueField(wireName: 'likes_count')
  int get likesCount;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..lastName = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..investmentCount = 0
    ..followCount = 0
    ..applicationCount = 0
    ..isPremium = false
    ..likesCount = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;
}

Map<String, dynamic> createUsersRecordData({
  String lastName,
  String email,
  Timestamp dateLastLoggedIn,
  String displayName,
  String photoUrl,
  String uid,
  Timestamp createdTime,
  int investmentCount,
  int followCount,
  int applicationCount,
  DocumentReference startup,
  bool isPremium,
  int likesCount,
}) =>
    serializers.serializeWith(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..lastName = lastName
          ..email = email
          ..dateLastLoggedIn = dateLastLoggedIn
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..investmentCount = investmentCount
          ..followCount = followCount
          ..applicationCount = applicationCount
          ..startup = startup
          ..isPremium = isPremium
          ..likesCount = likesCount));

UsersRecord get dummyUsersRecord {
  final builder = UsersRecordBuilder()
    ..lastName = dummyString
    ..email = dummyString
    ..dateLastLoggedIn = dummyTimestamp
    ..displayName = dummyString
    ..photoUrl = dummyImagePath
    ..uid = dummyString
    ..createdTime = dummyTimestamp
    ..investmentCount = dummyInteger
    ..followCount = dummyInteger
    ..applicationCount = dummyInteger
    ..isPremium = dummyBoolean
    ..likesCount = dummyInteger;
  return builder.build();
}

List<UsersRecord> createDummyUsersRecord({int count}) =>
    List.generate(count, (_) => dummyUsersRecord);
