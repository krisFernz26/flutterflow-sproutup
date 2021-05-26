import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'startups_record.g.dart';

abstract class StartupsRecord
    implements Built<StartupsRecord, StartupsRecordBuilder> {
  static Serializer<StartupsRecord> get serializer =>
      _$startupsRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'date_registered')
  Timestamp get dateRegistered;

  @nullable
  @BuiltValueField(wireName: 'date_updated')
  Timestamp get dateUpdated;

  @nullable
  String get logo;

  @nullable
  BuiltList<String> get images;

  @nullable
  String get description;

  @nullable
  String get motto;

  @nullable
  @BuiltValueField(wireName: 'video_url')
  String get videoUrl;

  @nullable
  @BuiltValueField(wireName: 'looking_for')
  String get lookingFor;

  @nullable
  @BuiltValueField(wireName: 'follower_count')
  int get followerCount;

  @nullable
  @BuiltValueField(wireName: 'applicant_count')
  int get applicantCount;

  @nullable
  String get location;

  @nullable
  @BuiltValueField(wireName: 'investor_count')
  int get investorCount;

  @nullable
  @BuiltValueField(wireName: 'user_registerer')
  DocumentReference get userRegisterer;

  @nullable
  @BuiltValueField(wireName: 'is_featured')
  bool get isFeatured;

  @nullable
  BuiltList<DocumentReference> get followers;

  @nullable
  BuiltList<DocumentReference> get investors;

  @nullable
  BuiltList<DocumentReference> get applicants;

  @nullable
  int get trl;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StartupsRecordBuilder builder) => builder
    ..name = ''
    ..logo = ''
    ..images = ListBuilder()
    ..description = ''
    ..motto = ''
    ..videoUrl = ''
    ..lookingFor = ''
    ..followerCount = 0
    ..applicantCount = 0
    ..location = ''
    ..investorCount = 0
    ..isFeatured = false
    ..followers = ListBuilder()
    ..investors = ListBuilder()
    ..applicants = ListBuilder()
    ..trl = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('startups');

  static Stream<StartupsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StartupsRecord._();
  factory StartupsRecord([void Function(StartupsRecordBuilder) updates]) =
      _$StartupsRecord;
}

Map<String, dynamic> createStartupsRecordData({
  String name,
  Timestamp dateRegistered,
  Timestamp dateUpdated,
  String logo,
  String description,
  String motto,
  String videoUrl,
  String lookingFor,
  int followerCount,
  int applicantCount,
  String location,
  int investorCount,
  DocumentReference userRegisterer,
  bool isFeatured,
  int trl,
}) =>
    serializers.serializeWith(
        StartupsRecord.serializer,
        StartupsRecord((s) => s
          ..name = name
          ..dateRegistered = dateRegistered
          ..dateUpdated = dateUpdated
          ..logo = logo
          ..images = null
          ..description = description
          ..motto = motto
          ..videoUrl = videoUrl
          ..lookingFor = lookingFor
          ..followerCount = followerCount
          ..applicantCount = applicantCount
          ..location = location
          ..investorCount = investorCount
          ..userRegisterer = userRegisterer
          ..isFeatured = isFeatured
          ..followers = null
          ..investors = null
          ..applicants = null
          ..trl = trl));

StartupsRecord get dummyStartupsRecord {
  final builder = StartupsRecordBuilder()
    ..name = dummyString
    ..dateRegistered = dummyTimestamp
    ..dateUpdated = dummyTimestamp
    ..logo = dummyImagePath
    ..images = ListBuilder([dummyImagePath, dummyImagePath])
    ..description = dummyString
    ..motto = dummyString
    ..videoUrl = dummyVideoPath
    ..lookingFor = dummyString
    ..followerCount = dummyInteger
    ..applicantCount = dummyInteger
    ..location = dummyString
    ..investorCount = dummyInteger
    ..isFeatured = dummyBoolean
    ..trl = dummyInteger;
  return builder.build();
}

List<StartupsRecord> createDummyStartupsRecord({int count}) =>
    List.generate(count, (_) => dummyStartupsRecord);
