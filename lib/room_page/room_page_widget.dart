import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

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
  ScrollController _scrollController = ScrollController();
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
      backgroundColor: FlutterFlowTheme.primaryColor,
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
                          .where('room', isEqualTo: widget.room.reference)
                          .orderBy('date_sent', descending: true),
                    ),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List<MessagesRecord> listViewMessagesRecordList =
                          snapshot.data;
                      if (snapshot.data.isEmpty) {
                        return Container();
                      }
                      return ListView.builder(
                        controller: _scrollController,
                        reverse: true,
                        shrinkWrap: true,
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
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              final containerMessagesRecord = snapshot.data;
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(),
                                  child: StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        containerMessagesRecord.author),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      final rowUsersRecord = snapshot.data;
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 5, 10, 0),
                                        child: rowUsersRecord.reference !=
                                                currentUserReference
                                            ? OtherUserRow(
                                                rowUsersRecord: rowUsersRecord,
                                                containerMessagesRecord:
                                                    containerMessagesRecord)
                                            : OwnUserRow(
                                                rowUsersRecord: rowUsersRecord,
                                                containerMessagesRecord:
                                                    containerMessagesRecord),
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
                            showUploadMessage(context, 'Sending image...',
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
                            video: '',
                            text: 'Image',
                          );

                          await MessagesRecord.collection
                              .doc()
                              .set(messagesRecordData);
                              _scrollController.animateTo(
                            0.0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
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
                          final selectedMedia = await selectMedia(fromCamera: true);
                          if (selectedMedia != null &&
                              validateFileFormat(
                                  selectedMedia.storagePath, context)) {
                            showUploadMessage(context, 'Sending image...',
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
                            video: '',
                            text: 'Image',
                          );

                          await MessagesRecord.collection
                              .doc()
                              .set(messagesRecordData);
                              _scrollController.animateTo(
                            0.0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
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
                            image: '',
                            video: '',
                          );

                          await MessagesRecord.collection
                              .doc()
                              .set(messagesRecordData);

                          _scrollController.animateTo(
                            0.0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                          setState(() {
                          textController.text = '';
                            
                          });
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

class OtherUserRow extends StatelessWidget {
  const OtherUserRow({
    Key key,
    @required this.rowUsersRecord,
    @required this.containerMessagesRecord,
  }) : super(key: key);

  final UsersRecord rowUsersRecord;
  final MessagesRecord containerMessagesRecord;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
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
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '${rowUsersRecord.displayName} ${rowUsersRecord.lastName}',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  decoration: containerMessagesRecord.image != ''
                      ? BoxDecoration()
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 2,
                          ),
                        ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: containerMessagesRecord.image != ''
                        ? Image.network(
                            containerMessagesRecord.image,
                            fit: BoxFit.contain,
                          )
                        : Text(
                            containerMessagesRecord.text,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                          ),
                  ),
                ),
              ),
              Text(
                '${timeago.format(containerMessagesRecord.dateSent.toDate())}',
                style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Montserrat',
                    color: Color(0xA0FFFFFF),
                    fontWeight: FontWeight.w200,
                    fontSize: 10),
              )
            ],
          ),
        )
      ],
    );
  }
}

class OwnUserRow extends StatelessWidget {
  const OwnUserRow({
    Key key,
    @required this.rowUsersRecord,
    @required this.containerMessagesRecord,
  }) : super(key: key);

  final UsersRecord rowUsersRecord;
  final MessagesRecord containerMessagesRecord;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Me',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  decoration: containerMessagesRecord.image != ''
                      ? BoxDecoration()
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: FlutterFlowTheme.tertiaryColor,
                          border: Border.all(
                            color: FlutterFlowTheme.tertiaryColor,
                            width: 2,
                          ),
                        ),
                  child: Padding(
                    padding: containerMessagesRecord.image != ''
                        ? EdgeInsets.all(0)
                        : EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: containerMessagesRecord.image != ''
                        ? Image.network(
                            containerMessagesRecord.image,
                            fit: BoxFit.contain,
                          )
                        : Text(
                            containerMessagesRecord.text,
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.primaryColor,
                            ),
                          ),
                  ),
                ),
              ),
              Text(
                '${timeago.format(containerMessagesRecord.dateSent.toDate())}',
                style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Montserrat',
                    color: Color(0xA0FFFFFF),
                    fontWeight: FontWeight.w200,
                    fontSize: 10),
              )
            ],
          ),
        ),
      ],
    );
  }
}
