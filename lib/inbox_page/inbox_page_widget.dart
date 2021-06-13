import 'package:auto_size_text/auto_size_text.dart';
import 'package:sprout_up/auth/auth_util.dart';

import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../profile_page/profile_page_widget.dart';
import '../room_page/room_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

class InboxPageWidget extends StatefulWidget {
  InboxPageWidget({Key key}) : super(key: key);

  @override
  _InboxPageWidgetState createState() => _InboxPageWidgetState();
}

class _InboxPageWidgetState extends State<InboxPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Inbox',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Montserrat',
            color: FlutterFlowTheme.tertiaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePageWidget(),
                ),
              );
            },
            icon: Icon(
              Icons.person_outline,
              color: FlutterFlowTheme.secondaryColor,
              size: 30,
            ),
            iconSize: 30,
          )
        ],
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
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: StreamBuilder<List<RoomsRecord>>(
                    stream: queryRoomsRecord(
                      queryBuilder: (roomsRecord) =>
                          roomsRecord.where('users', arrayContains: currentUserReference).orderBy('date_created', descending: true),
                    ),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List<RoomsRecord> listViewRoomsRecordList = snapshot.data;

                      if (snapshot.data.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Center(
                            child: Text(
                              'No Messages Retrieved',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewRoomsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewRoomsRecord =
                                listViewRoomsRecordList[listViewIndex];
                            return Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x3D000000),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where('uid',
                                                        isEqualTo:
                                                            listViewRoomsRecord
                                                                .users
                                                                .where((user) =>
                                                                    user !=
                                                                    currentUserReference)
                                                                .first
                                                                .id)),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                              UsersRecord containerUserRecord =
                                                  snapshot.data.first;
                                              return Image.network(
                                                containerUserRecord.photoUrl,
                                                fit: BoxFit.cover,
                                              );
                                            }),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(6, 0, 0, 0),
                                          child: StreamBuilder<
                                                  List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord.where('uid',
                                                          isEqualTo:
                                                              listViewRoomsRecord
                                                                  .users
                                                                  .where((user) =>
                                                                      user !=
                                                                      currentUserReference)
                                                                  .first
                                                                  .id)),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return Container();
                                                }
                                                UsersRecord columnUserRecord =
                                                    snapshot.data.first;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          '${columnUserRecord.displayName} ${columnUserRecord.lastName}',
                                                          style: FlutterFlowTheme
                                                              .title3
                                                              .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: FlutterFlowTheme
                                                                .secondaryColor,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 0, 0, 2),
                                                          child: Text(
                                                            'For ${listViewRoomsRecord.purpose}',
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color: FlutterFlowTheme
                                                                  .secondaryColor.withOpacity(0.6),
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ), Row(
                                                        children: [
                                                          StreamBuilder<
                                                                  List<
                                                                      MessagesRecord>>(
                                                              stream: queryMessagesRecord(
                                                                  queryBuilder: (messagesRecord) => messagesRecord
                                                                      .where('room',
                                                                          isEqualTo:
                                                                              listViewRoomsRecord
                                                                                  .reference)
                                                                      .orderBy(
                                                                          'date_sent',
                                                                          descending:
                                                                              true)),
                                                              builder: (context,
                                                                  snapshot) {
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Container();
                                                                }
                                                                MessagesRecord
                                                                    rowMessageRecord =
                                                                    snapshot
                                                                        .data.first;
                                                                return Expanded(
                                                                  child: AutoSizeText(
                                                                    rowMessageRecord
                                                                        .text,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme
                                                                          .secondaryColor,
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                        ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 8.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          StreamBuilder<
                                                                  List<
                                                                      MessagesRecord>>(
                                                              stream: queryMessagesRecord(
                                                                  queryBuilder: (messagesRecord) => messagesRecord
                                                                      .where('room',
                                                                          isEqualTo:
                                                                              listViewRoomsRecord
                                                                                  .reference)
                                                                      .orderBy(
                                                                          'date_sent',
                                                                          descending:
                                                                              true)),
                                                              builder: (context,
                                                                  snapshot) {
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Container();
                                                                }
                                                                MessagesRecord
                                                                    rowMessageRecord =
                                                                    snapshot
                                                                        .data.first;
                                                                return Text(
                                                                  'Sent ${timeago.format(rowMessageRecord.dateSent.toDate())}',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme
                                                                        .secondaryColor.withOpacity(0.5),
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                );
                                                              }),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RoomPageWidget(
                                                    room: listViewRoomsRecord,
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                              size: 30,
                                            ),
                                            iconSize: 30,
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              await listViewRoomsRecord
                                                  .reference
                                                  .delete();
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                              size: 30,
                                            ),
                                            iconSize: 30,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
