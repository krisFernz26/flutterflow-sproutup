import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomPageWidget extends StatefulWidget {
  RoomPageWidget({
    Key key,
    this.room,
  }) : super(key: key);

  final RoomsRecord room;

  @override
  _RoomPageWidgetState createState() => _RoomPageWidgetState();
}

class _RoomPageWidgetState extends State<RoomPageWidget> {
  String uploadedFileUrl1;
  String uploadedFileUrl2;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Text(
                'For',
                style: FlutterFlowTheme.title2.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.tertiaryColor,
                ),
              ),
            ),
            Text(
              widget.room.purpose,
              style: FlutterFlowTheme.title2.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.tertiaryColor,
              ),
            )
          ],
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.primaryColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Color(0x44000000),
                  ),
                  child: StreamBuilder<List<MessagesRecord>>(
                    stream: queryMessagesRecord(
                      queryBuilder: (messagesRecord) => messagesRecord
                          .where('room', isEqualTo: widget.room.reference),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List<MessagesRecord> listViewMessagesRecordList =
                          snapshot.data;
                      // Customize what your widget looks like with no query results.
                      if (snapshot.data.isEmpty) {
                        // return Container();
                        // For now, we'll just include some dummy data.
                        listViewMessagesRecordList =
                            createDummyMessagesRecord(count: 4);
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewMessagesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewMessagesRecord =
                              listViewMessagesRecordList[listViewIndex];
                          return StreamBuilder<MessagesRecord>(
                            stream: MessagesRecord.getDocument(
                                listViewMessagesRecord.reference),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              final containerMessagesRecord = snapshot.data;
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(),
                                  child: StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        containerMessagesRecord.author),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      final rowUsersRecord = snapshot.data;
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 5, 10, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                rowUsersRecord.photoUrl,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        rowUsersRecord
                                                            .displayName,
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                3, 0, 0, 0),
                                                        child: Text(
                                                          rowUsersRecord
                                                              .lastName,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: FlutterFlowTheme
                                                                .tertiaryColor,
                                                            fontSize: 11,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 5, 0, 5),
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5, 2, 5, 2),
                                                        child: Text(
                                                          'Hello World',
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: FlutterFlowTheme
                                                                .tertiaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    containerMessagesRecord
                                                        .dateSent
                                                        .toString(),
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xA0FFFFFF),
                                                      fontWeight:
                                                          FontWeight.w200,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        onPressed: () async {
                          final selectedMedia = await selectMedia();
                          if (selectedMedia != null &&
                              validateFileFormat(
                                  selectedMedia.storagePath, context)) {
                            showUploadMessage(context, 'Uploading file...',
                                showLoading: true);
                            final downloadUrl = await uploadData(
                                selectedMedia.storagePath, selectedMedia.bytes);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            if (downloadUrl != null) {
                              setState(() => uploadedFileUrl1 = downloadUrl);
                              showUploadMessage(context, 'Success!');
                            } else {
                              showUploadMessage(
                                  context, 'Failed to upload media');
                            }
                          }
                          final author = currentUserReference;
                          final image = uploadedFileUrl1;
                          final dateSent = getCurrentTimestamp;
                          final room = widget.room.reference;

                          final messagesRecordData = createMessagesRecordData(
                            author: author,
                            image: image,
                            dateSent: dateSent,
                            room: room,
                          );

                          await MessagesRecord.collection
                              .doc()
                              .set(messagesRecordData);
                        },
                        icon: Icon(
                          Icons.photo,
                          color: FlutterFlowTheme.tertiaryColor,
                          size: 30,
                        ),
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () async {
                          final selectedMedia = await selectMedia();
                          if (selectedMedia != null &&
                              validateFileFormat(
                                  selectedMedia.storagePath, context)) {
                            showUploadMessage(context, 'Uploading file...',
                                showLoading: true);
                            final downloadUrl = await uploadData(
                                selectedMedia.storagePath, selectedMedia.bytes);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            if (downloadUrl != null) {
                              setState(() => uploadedFileUrl2 = downloadUrl);
                              showUploadMessage(context, 'Success!');
                            } else {
                              showUploadMessage(
                                  context, 'Failed to upload media');
                            }
                          }
                          final author = currentUserReference;
                          final image = uploadedFileUrl2;
                          final dateSent = getCurrentTimestamp;
                          final room = widget.room.reference;

                          final messagesRecordData = createMessagesRecordData(
                            author: author,
                            image: image,
                            dateSent: dateSent,
                            room: room,
                          );

                          await MessagesRecord.collection
                              .doc()
                              .set(messagesRecordData);
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          color: FlutterFlowTheme.tertiaryColor,
                          size: 30,
                        ),
                        iconSize: 30,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Message',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                            hintText: 'Message...',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.tertiaryColor,
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
                      IconButton(
                        onPressed: () async {
                          final author = currentUserReference;
                          final text = textController.text;
                          final dateSent = getCurrentTimestamp;
                          final room = widget.room.reference;

                          final messagesRecordData = createMessagesRecordData(
                            author: author,
                            text: text,
                            dateSent: dateSent,
                            room: room,
                          );

                          await MessagesRecord.collection
                              .doc()
                              .set(messagesRecordData);
                        },
                        icon: Icon(
                          Icons.send,
                          color: FlutterFlowTheme.tertiaryColor,
                          size: 30,
                        ),
                        iconSize: 30,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
