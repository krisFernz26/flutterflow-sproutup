import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'trl_progress_record.g.dart';

abstract class TrlProgressRecord
    implements Built<TrlProgressRecord, TrlProgressRecordBuilder> {
  static Serializer<TrlProgressRecord> get serializer =>
      _$trlProgressRecordSerializer;

  @nullable
  DocumentReference get startup;

  @nullable
  int get level;

  @nullable
  @BuiltValueField(wireName: 'date_updated')
  Timestamp get dateUpdated;

  @nullable
  @BuiltValueField(wireName: 'level_one_progress')
  int get levelOneProgress;

  @nullable
  @BuiltValueField(wireName: 'level_two_progress')
  int get levelTwoProgress;

  @nullable
  @BuiltValueField(wireName: 'level_three_progress')
  int get levelThreeProgress;

  @nullable
  @BuiltValueField(wireName: 'level_four_progress')
  int get levelFourProgress;

  @nullable
  @BuiltValueField(wireName: 'level_five_progress')
  int get levelFiveProgress;

  @nullable
  @BuiltValueField(wireName: 'level_six_progress')
  int get levelSixProgress;

  @nullable
  @BuiltValueField(wireName: 'level_seven_progress')
  int get levelSevenProgress;

  @nullable
  @BuiltValueField(wireName: 'level_eight_progress')
  int get levelEightProgress;

  @nullable
  @BuiltValueField(wireName: 'level_nine_progress')
  int get levelNineProgress;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TrlProgressRecordBuilder builder) => builder
    ..level = 0
    ..levelOneProgress = 0
    ..levelTwoProgress = 0
    ..levelThreeProgress = 0
    ..levelFourProgress = 0
    ..levelFiveProgress = 0
    ..levelSixProgress = 0
    ..levelSevenProgress = 0
    ..levelEightProgress = 0
    ..levelNineProgress = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trl_progress');

  static Stream<TrlProgressRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TrlProgressRecord._();
  factory TrlProgressRecord([void Function(TrlProgressRecordBuilder) updates]) =
      _$TrlProgressRecord;
}

Map<String, dynamic> createTrlProgressRecordData({
  DocumentReference startup,
  int level,
  Timestamp dateUpdated,
  int levelOneProgress,
  int levelTwoProgress,
  int levelThreeProgress,
  int levelFourProgress,
  int levelFiveProgress,
  int levelSixProgress,
  int levelSevenProgress,
  int levelEightProgress,
  int levelNineProgress,
}) =>
    serializers.serializeWith(
        TrlProgressRecord.serializer,
        TrlProgressRecord((t) => t
          ..startup = startup
          ..level = level
          ..dateUpdated = dateUpdated
          ..levelOneProgress = levelOneProgress
          ..levelTwoProgress = levelTwoProgress
          ..levelThreeProgress = levelThreeProgress
          ..levelFourProgress = levelFourProgress
          ..levelFiveProgress = levelFiveProgress
          ..levelSixProgress = levelSixProgress
          ..levelSevenProgress = levelSevenProgress
          ..levelEightProgress = levelEightProgress
          ..levelNineProgress = levelNineProgress));

TrlProgressRecord get dummyTrlProgressRecord {
  final builder = TrlProgressRecordBuilder()
    ..level = dummyInteger
    ..dateUpdated = dummyTimestamp
    ..levelOneProgress = dummyInteger
    ..levelTwoProgress = dummyInteger
    ..levelThreeProgress = dummyInteger
    ..levelFourProgress = dummyInteger
    ..levelFiveProgress = dummyInteger
    ..levelSixProgress = dummyInteger
    ..levelSevenProgress = dummyInteger
    ..levelEightProgress = dummyInteger
    ..levelNineProgress = dummyInteger;
  return builder.build();
}

List<TrlProgressRecord> createDummyTrlProgressRecord({int count}) =>
    List.generate(count, (_) => dummyTrlProgressRecord);
