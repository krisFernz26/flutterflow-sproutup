import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'reports_record.g.dart';

abstract class ReportsRecord
    implements Built<ReportsRecord, ReportsRecordBuilder> {
  static Serializer<ReportsRecord> get serializer => _$reportsRecordSerializer;

  @nullable
  DocumentReference get user;

  @nullable
  BuiltList<String> get images;

  @nullable
  String get video;

  @nullable
  String get text;

  @nullable
  @BuiltValueField(wireName: 'date_sent')
  Timestamp get dateSent;

  @nullable
  @BuiltValueField(wireName: 'date_investigated')
  Timestamp get dateInvestigated;

  @nullable
  String get status;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ReportsRecordBuilder builder) => builder
    ..images = ListBuilder()
    ..video = ''
    ..text = ''
    ..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ReportsRecord._();
  factory ReportsRecord([void Function(ReportsRecordBuilder) updates]) =
      _$ReportsRecord;
}

Map<String, dynamic> createReportsRecordData({
  DocumentReference user,
  String video,
  String text,
  Timestamp dateSent,
  Timestamp dateInvestigated,
  String status,
}) =>
    serializers.serializeWith(
        ReportsRecord.serializer,
        ReportsRecord((r) => r
          ..user = user
          ..images = null
          ..video = video
          ..text = text
          ..dateSent = dateSent
          ..dateInvestigated = dateInvestigated
          ..status = status));

ReportsRecord get dummyReportsRecord {
  final builder = ReportsRecordBuilder()
    ..images = ListBuilder([dummyImagePath, dummyImagePath])
    ..video = dummyVideoPath
    ..text = dummyString
    ..dateSent = dummyTimestamp
    ..dateInvestigated = dummyTimestamp
    ..status = dummyString;
  return builder.build();
}

List<ReportsRecord> createDummyReportsRecord({int count}) =>
    List.generate(count, (_) => dummyReportsRecord);
