import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'rooms_record.g.dart';

abstract class RoomsRecord implements Built<RoomsRecord, RoomsRecordBuilder> {
  static Serializer<RoomsRecord> get serializer => _$roomsRecordSerializer;

  @nullable
  BuiltList<DocumentReference> get users;

  @nullable
  BuiltList<DocumentReference> get startups;

  @nullable
  @BuiltValueField(wireName: 'date_created')
  Timestamp get dateCreated;

  @nullable
  String get purpose;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RoomsRecordBuilder builder) => builder
    ..users = ListBuilder()
    ..startups = ListBuilder()
    ..purpose = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rooms');

  static Stream<RoomsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  RoomsRecord._();
  factory RoomsRecord([void Function(RoomsRecordBuilder) updates]) =
      _$RoomsRecord;
}

Map<String, dynamic> createRoomsRecordData({
  Timestamp dateCreated,
  String purpose,
}) =>
    serializers.serializeWith(
        RoomsRecord.serializer,
        RoomsRecord((r) => r
          ..users = null
          ..startups = null
          ..dateCreated = dateCreated
          ..purpose = purpose));

RoomsRecord get dummyRoomsRecord {
  final builder = RoomsRecordBuilder()
    ..dateCreated = dummyTimestamp
    ..purpose = dummyString;
  return builder.build();
}

List<RoomsRecord> createDummyRoomsRecord({int count}) =>
    List.generate(count, (_) => dummyRoomsRecord);
