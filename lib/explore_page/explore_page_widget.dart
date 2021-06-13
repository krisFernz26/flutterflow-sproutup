import 'package:sprout_up/auth/firebase_user_provider.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_post_page/create_post_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../post_info_page/post_info_page_widget.dart';
import '../profile_page/profile_page_widget.dart';
import '../startup_info_page/startup_info_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class ExplorePageWidget extends StatefulWidget {
  ExplorePageWidget({Key key}) : super(key: key);

  @override
  _ExplorePageWidgetState createState() => _ExplorePageWidgetState();
}

class _ExplorePageWidgetState extends State<ExplorePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Explore',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Montserrat',
            color: FlutterFlowTheme.secondaryColor,
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
            color: Color(0xFF4DB6AC),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: FlutterFlowTheme.tertiaryColor,
                        indicatorColor: FlutterFlowTheme.secondaryColor,
                        tabs: [
                          Tab(
                            text: 'Posts',
                          ),
                          Tab(
                            text: 'Sprouts',
                          )
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CreatePostPageWidget(),
                                        ),
                                      );
                                    },
                                    text: 'Add Post',
                                    icon: Icon(
                                      Icons.post_add_rounded,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: FlutterFlowTheme.secondaryColor,
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
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
                                ),
                                Expanded(
                                  child: StreamBuilder<List<PostsRecord>>(
                                    stream: queryPostsRecord(
                                      queryBuilder: (postsRecord) =>
                                          postsRecord.orderBy('date_posted',
                                              descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      List<PostsRecord>
                                          listViewPostsRecordList =
                                          snapshot.data;
                                      if (snapshot.data.isEmpty) {
                                        return Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: Center(
                                            child: Text(
                                              'No Posts Retrieved',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: FlutterFlowTheme
                                                    .secondaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewPostsRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewPostsRecord =
                                                listViewPostsRecordList[
                                                    listViewIndex];
                                            return Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Color(0x40FFFFFF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                height: 150,
                                                child: Stack(
                                                  children: [
                                                    listViewPostsRecord
                                                                .thumbnail ==
                                                            ''
                                                        ? Container()
                                                        : Image.network(
                                                            listViewPostsRecord
                                                                .thumbnail,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                    Align(
                                                      alignment:
                                                          Alignment(0, 0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 150,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xA1000000),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: StreamBuilder<
                                                                  UsersRecord>(
                                                                stream: UsersRecord
                                                                    .getDocument(
                                                                        listViewPostsRecord
                                                                            .user),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                        child:
                                                                            CircularProgressIndicator());
                                                                  }
                                                                  final columnUsersRecord =
                                                                      snapshot
                                                                          .data;
                                                                  return Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            10,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              2),
                                                                          child:
                                                                              Text(
                                                                            listViewPostsRecord.title,
                                                                            style:
                                                                                FlutterFlowTheme.bodyText1.override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: FlutterFlowTheme.secondaryColor,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Text(
                                                                            'Posted ${timeago.format(listViewPostsRecord.datePosted.toDate())}',
                                                                            style:
                                                                                FlutterFlowTheme.bodyText1.override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: Color(0x9BFFFFFF),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              2),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Posted by ${columnUsersRecord.displayName} ${columnUsersRecord.lastName}',
                                                                                style: FlutterFlowTheme.bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: FlutterFlowTheme.secondaryColor,
                                                                                  fontSize: 13,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                0,
                                                                                6,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              listViewPostsRecord.body,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: FlutterFlowTheme.bodyText1.override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.secondaryColor,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              PostInfoPageWidget(
                                                                            post:
                                                                                listViewPostsRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .keyboard_control,
                                                                      color: FlutterFlowTheme
                                                                          .tertiaryColor,
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    NumberFormat
                                                                            .compact()
                                                                        .format(
                                                                            listViewPostsRecord.likesCount),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0x9BFFFFFF),
                                                                    ),
                                                                  ),
                                                                  listViewPostsRecord
                                                                              .user ==
                                                                          currentUserReference
                                                                      ? IconButton(
                                                                          onPressed:
                                                                              () async {
                                                                            await listViewPostsRecord.reference.delete();
                                                                          },
                                                                          icon:
                                                                              Icon(
                                                                             Icons.delete_forever,
                                                                            color:
                                                                                FlutterFlowTheme.tertiaryColor,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                          iconSize:
                                                                              30,
                                                                        )
                                                                      : IconButton(
                                                                          onPressed: listViewPostsRecord.user == currentUserReference
                                                                              ? null
                                                                              : () async {
                                                                                  final postsRecordData = !listViewPostsRecord.likedUsers.contains(currentUserReference)
                                                                                      ? {
                                                                                          'likes_count': FieldValue.increment(1),
                                                                                          'liked_users': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        }
                                                                                      : {
                                                                                          'likes_count': FieldValue.increment(-1),
                                                                                          'liked_users': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        };

                                                                                  await listViewPostsRecord.reference.update(postsRecordData);
                                                                                  final usersRecordData = !listViewPostsRecord.likedUsers.contains(currentUserReference)
                                                                                      ? {
                                                                                          'likes_count': FieldValue.increment(1),
                                                                                        }
                                                                                      : {
                                                                                          'likes_count': FieldValue.increment(-1),
                                                                                        };

                                                                                  await currentUserReference.update(usersRecordData);
                                                                                },
                                                                          icon:
                                                                              Icon(
                                                                            !listViewPostsRecord.likedUsers.contains(currentUserReference)
                                                                                ? Icons.thumb_up_off_alt
                                                                                : Icons.thumb_up_sharp,
                                                                            color:
                                                                                FlutterFlowTheme.tertiaryColor,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                          iconSize:
                                                                              30,
                                                                        )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: StreamBuilder<List<StartupsRecord>>(
                                    stream: queryStartupsRecord(
                                      queryBuilder: (startupsRecord) =>
                                          startupsRecord.orderBy(
                                              'date_registered',
                                              descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      List<StartupsRecord>
                                          listViewStartupsRecordList =
                                          snapshot.data;
                                      if (snapshot.data.isEmpty) {
                                        return Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: Center(
                                            child: Text(
                                              'No Startups Retrieved',
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: FlutterFlowTheme
                                                    .secondaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewStartupsRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewStartupsRecord =
                                                listViewStartupsRecordList[
                                                    listViewIndex];
                                            return Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Color(0x40FFFFFF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                height: 130,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment(0, 0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 130,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x6F000000),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                width: 90,
                                                                height: 90,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  listViewStartupsRecord
                                                                      .logo,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            10,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              2),
                                                                      child:
                                                                          Text(
                                                                        listViewStartupsRecord
                                                                            .name,
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        'Registered ${timeago.format(listViewStartupsRecord.dateRegistered.toDate())}',
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Color(0x9BFFFFFF),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              2),
                                                                      child:
                                                                          Text(
                                                                        'Looking For: ${listViewStartupsRecord.lookingFor}',
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          fontSize:
                                                                              13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            6,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          listViewStartupsRecord
                                                                              .motto,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: FlutterFlowTheme
                                                                              .bodyText1
                                                                              .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.secondaryColor,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              StartupInfoPageWidget(
                                                                            startup:
                                                                                listViewStartupsRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .keyboard_control,
                                                                      color: FlutterFlowTheme
                                                                          .tertiaryColor,
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    NumberFormat
                                                                            .compact()
                                                                        .format(
                                                                            listViewStartupsRecord.followerCount),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0x9BFFFFFF),
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    onPressed: listViewStartupsRecord.userRegisterer ==
                                                                            currentUserReference
                                                                        ? null
                                                                        : () async {
                                                                            final startupsRecordData = !listViewStartupsRecord.followers.contains(currentUserReference)
                                                                                ? {
                                                                                    'follower_count': FieldValue.increment(1),
                                                                                    'followers': FieldValue.arrayUnion([
                                                                                      currentUserReference
                                                                                    ]),
                                                                                  }
                                                                                : {
                                                                                    'follower_count': FieldValue.increment(-1),
                                                                                    'followers': FieldValue.arrayRemove([
                                                                                      currentUserReference
                                                                                    ]),
                                                                                  };

                                                                            await listViewStartupsRecord.reference.update(startupsRecordData);
                                                                            final usersRecordData = !listViewStartupsRecord.followers.contains(currentUserReference)
                                                                                ? {
                                                                                    'follow_count': FieldValue.increment(1),
                                                                                  }
                                                                                : {
                                                                                    'follow_count': FieldValue.increment(-1),
                                                                                  };

                                                                            await currentUserReference.update(usersRecordData);
                                                                          },
                                                                    icon: Icon(
                                                                      listViewStartupsRecord.followers.contains(currentUserReference) ||
                                                                              listViewStartupsRecord.userRegisterer ==
                                                                                  currentUserReference
                                                                          ? Icons
                                                                              .favorite
                                                                          : Icons
                                                                              .favorite_border,
                                                                      color: FlutterFlowTheme
                                                                          .tertiaryColor,
                                                                      size: 30,
                                                                    ),
                                                                    iconSize:
                                                                        30,
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
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
                            )
                          ],
                        ),
                      ),
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
