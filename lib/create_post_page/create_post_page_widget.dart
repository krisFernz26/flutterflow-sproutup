import 'package:auto_size_text/auto_size_text.dart';
import 'package:sprout_up/backend/firebase_storage/storage.dart';
import 'package:sprout_up/flutter_flow/upload_media.dart';
import 'package:uuid/uuid.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePostPageWidget extends StatefulWidget {
  CreatePostPageWidget({Key key}) : super(key: key);

  @override
  _CreatePostPageWidgetState createState() => _CreatePostPageWidgetState();
}

class _CreatePostPageWidgetState extends State<CreatePostPageWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  List<SelectedMedia> selectedMediaList = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  Future<List<String>> uploadPhotos() async {
    if (selectedMediaList.isNotEmpty) {
      return await Future.wait<String>(
          selectedMediaList.map((selectedMedia) async {
        return uploadData(
            'users/${currentUserReference.id}/${textController1.text}/images/${Uuid().v4()}',
            selectedMedia.bytes);
      }).toList());
    }
    return [];
  }

  Future<String> uploadThumbnail() async {
    if (selectedMediaList.isNotEmpty) {
      if (selectedMediaList[0] != null &&
          validateFileFormat(selectedMediaList[0].storagePath, context)) {
        final downloadUrl = await uploadData(
            'users/${currentUserReference.id}/${textController1.text}/thumbnail/${Uuid().v4()}',
            selectedMediaList[0].bytes);
        if (downloadUrl != null) {
          return downloadUrl;
        } else {
          return '';
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StartupsRecord>>(
      stream: queryStartupsRecord(
        queryBuilder: (startupsRecord) => startupsRecord
            .where('user_registerer', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<StartupsRecord> createPostPageStartupsRecordList = snapshot.data;

        if (snapshot.data.isEmpty) {
          createPostPageStartupsRecordList =
              createDummyStartupsRecord(count: 1);
        }
        final createPostPageStartupsRecord =
            createPostPageStartupsRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            iconTheme: IconThemeData(color: FlutterFlowTheme.secondaryColor),
            automaticallyImplyLeading: true,
            title: Text(
              'Create a Post',
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.tertiaryColor,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.primaryColor,
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(
                            'Upload Photos ${selectedMediaList.length}/5',
                            style:
                                TextStyle(color: FlutterFlowTheme.secondaryColor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(
                            'NOTE: Uploaded images cannot be deleted!',
                            style: TextStyle(
                                color: FlutterFlowTheme.secondaryColor
                                    .withOpacity(0.7),
                                fontSize: 10),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: FlutterFlowTheme.tertiaryColor,
                                    width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: selectedMediaList.isEmpty
                                  ? GestureDetector(
                                      onTap: () async {
                                        selectedMediaList
                                            .add(await selectMedia());
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: FlutterFlowTheme
                                                    .tertiaryColor,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Icon(
                                          Icons.add_a_photo,
                                          color: FlutterFlowTheme.secondaryColor,
                                        )),
                                      ),
                                    )
                                  : GridView.builder(
                                      itemCount: selectedMediaList == null
                                          ? 1
                                          : selectedMediaList.length < 5
                                              ? selectedMediaList.length + 1
                                              : 5,
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 100,
                                              mainAxisSpacing: 5,
                                              crossAxisSpacing: 5),
                                      itemBuilder: (context, index) {
                                        if (index == 0 &&
                                            selectedMediaList.length < 5) {
                                          return GestureDetector(
                                            onTap: () async {
                                              selectedMediaList
                                                  .add(await selectMedia());
                                              setState(() {});
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              child: Center(
                                                  child: Icon(
                                                Icons.add_a_photo,
                                                color: FlutterFlowTheme
                                                    .secondaryColor,
                                              )),
                                            ),
                                          );
                                        }
                                        return Stack(
                                          fit: StackFit.loose,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.primaryColor,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 1, 0, 0),
                                                child: Image.memory(
                                                  selectedMediaList[
                                                          selectedMediaList
                                                                      .length <
                                                                  5
                                                              ? index - 1
                                                              : index]
                                                      .bytes,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: IconButton(
                                                    onPressed: () {
                                                      selectedMediaList.removeAt(
                                                          selectedMediaList
                                                                      .length <
                                                                  5
                                                              ? index - 1
                                                              : index);
                                                      setState(() {});
                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ))),
                                          ],
                                        );
                                      }),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title for your post';
                          }
                          return null;
                        },
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Title*',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                              hintText: 'SproutUp News',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor.withOpacity(0.6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a body for your post';
                          }
                          return null;
                        },
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Body*',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                              hintText: 'Any news or updates you want to share.',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor.withOpacity(0.6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                            maxLines: 10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if(_formKey.currentState.validate()){final title = textController1.text;
                              final user = currentUserReference;
                              final startup =
                                  createPostPageStartupsRecord.reference;
                              final body = textController2.text;
                              final datePosted = getCurrentTimestamp;
                              final dateUpdated = getCurrentTimestamp;
                              final likesCount = 0;
                              final thumbnail = await uploadThumbnail();
                  
                              final postsRecordData = {
                                ...createPostsRecordData(
                                  title: title,
                                  user: user,
                                  startup: startup,
                                  body: body,
                                  datePosted: datePosted,
                                  dateUpdated: dateUpdated,
                                  likesCount: likesCount,
                                  thumbnail: thumbnail,
                                ),
                                'images': await uploadPhotos(),
                                'liked_users': [],
                              };
                  
                              await PostsRecord.collection
                                  .doc()
                                  .set(postsRecordData);
                  
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'ExplorePage'),
                                ),
                                (r) => false,
                              );
                            }},
                            text: 'Post',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.tertiaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.primaryColor,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 120,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
