import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @nullable
  String get title;

  @nullable
  DocumentReference get user;

  @nullable
  DocumentReference get startup;

  @nullable
  String get body;

  @nullable
  BuiltList<String> get images;

  @nullable
  @BuiltValueField(wireName: 'date_posted')
  Timestamp get datePosted;

  @nullable
  @BuiltValueField(wireName: 'date_updated')
  Timestamp get dateUpdated;

  @nullable
  @BuiltValueField(wireName: 'likes_count')
  int get likesCount;

  @nullable
  @BuiltValueField(wireName: 'liked_users')
  BuiltList<DocumentReference> get likedUsers;

  @nullable
  String get thumbnail;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..title = ''
    ..body = ''
    ..images = ListBuilder()
    ..likesCount = 0
    ..likedUsers = ListBuilder()
    ..thumbnail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;
}

Map<String, dynamic> createPostsRecordData({
  String title,
  DocumentReference user,
  DocumentReference startup,
  String body,
  Timestamp datePosted,
  Timestamp dateUpdated,
  int likesCount,
  String thumbnail,
}) =>
    serializers.serializeWith(
        PostsRecord.serializer,
        PostsRecord((p) => p
          ..title = title
          ..user = user
          ..startup = startup
          ..body = body
          ..images = null
          ..datePosted = datePosted
          ..dateUpdated = dateUpdated
          ..likesCount = likesCount
          ..likedUsers = null
          ..thumbnail = thumbnail));

PostsRecord get dummyPostsRecord {
  final builder = PostsRecordBuilder()
    ..title = dummyString
    ..body = dummyString
    ..images = ListBuilder([dummyImagePath, dummyImagePath])
    ..datePosted = dummyTimestamp
    ..dateUpdated = dummyTimestamp
    ..likesCount = dummyInteger
    ..thumbnail = dummyImagePath;
  return builder.build();
}

List<PostsRecord> createDummyPostsRecord({int count}) =>
    List.generate(count, (_) => dummyPostsRecord);
