import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'messages_record.g.dart';

abstract class MessagesRecord
    implements Built<MessagesRecord, MessagesRecordBuilder> {
  static Serializer<MessagesRecord> get serializer =>
      _$messagesRecordSerializer;

  @nullable
  DocumentReference get author;

  @nullable
  String get text;

  @nullable
  String get image;

  @nullable
  String get video;

  @nullable
  @BuiltValueField(wireName: 'date_sent')
  Timestamp get dateSent;

  @nullable
  DocumentReference get room;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MessagesRecordBuilder builder) => builder
    ..text = ''
    ..image = ''
    ..video = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MessagesRecord._();
  factory MessagesRecord([void Function(MessagesRecordBuilder) updates]) =
      _$MessagesRecord;
}

Map<String, dynamic> createMessagesRecordData({
  DocumentReference author,
  String text,
  String image,
  String video,
  Timestamp dateSent,
  DocumentReference room,
}) =>
    serializers.serializeWith(
        MessagesRecord.serializer,
        MessagesRecord((m) => m
          ..author = author
          ..text = text
          ..image = image
          ..video = video
          ..dateSent = dateSent
          ..room = room));

MessagesRecord get dummyMessagesRecord {
  final builder = MessagesRecordBuilder()
    ..text = dummyString
    ..image = dummyImagePath
    ..video = dummyVideoPath
    ..dateSent = dummyTimestamp;
  return builder.build();
}

List<MessagesRecord> createDummyMessagesRecord({int count}) =>
    List.generate(count, (_) => dummyMessagesRecord);
