import 'package:sprout_up/create_startup_page/create_startup_page_widget.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_post_page/create_post_page_widget.dart';
import '../edit_profile_page/edit_profile_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../landing_page/landing_page_widget.dart';
import '../post_info_page/post_info_page_widget.dart';
import '../send_report_page/send_report_page_widget.dart';
import '../startup_info_page/startup_info_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class ProfilePageWidget extends StatefulWidget {
  ProfilePageWidget({Key key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final profilePageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
            automaticallyImplyLeading: true,
            title: AutoSizeText(
              'Profile',
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.tertiaryColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  await signOut();
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LandingPageWidget(),
                    ),
                    (r) => false,
                  );
                },
                icon: Icon(
                  Icons.logout,
                  color: FlutterFlowTheme.tertiaryColor,
                  size: 30,
                ),
                iconSize: 30,
              )
            ],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.primaryColor,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePageWidget(
                    user: profilePageUsersRecord,
                  ),
                ),
              );
            },
            backgroundColor: FlutterFlowTheme.secondaryColor,
            icon: Icon(
              Icons.edit,
              color: FlutterFlowTheme.primaryColor,
            ),
            elevation: 8,
            label: AutoSizeText(
              'Edit Profile',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.primaryColor,
              ),
              child: DefaultTabController(
                length: 4,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: FlutterFlowTheme.tertiaryColor,
                      indicatorColor: FlutterFlowTheme.secondaryColor,
                      tabs: [
                        Tab(
                          text: 'Info',
                          icon: Icon(
                            Icons.info,
                          ),
                        ),
                        Tab(
                          text: 'Posts',
                          icon: Icon(
                            Icons.post_add,
                          ),
                        ),
                        Tab(
                          text: 'Follows',
                          icon: Icon(
                            Icons.favorite_sharp,
                          ),
                        ),
                        Tab(
                          text: 'Likes',
                          icon: Icon(
                            Icons.thumb_up,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 5, 0, 5),
                                        child: Container(
                                          width: 120,
                                          height: 120,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            profilePageUsersRecord.photoUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(6, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${profilePageUsersRecord.displayName} ${profilePageUsersRecord.lastName}',
                                      style: FlutterFlowTheme.title1.override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.tertiaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 2),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    NumberFormat.compact().format(
                                                        profilePageUsersRecord
                                                            .applicationCount),
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Montserrat',
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            2, 0, 0, 0),
                                                    child: Text(
                                                      'Applications',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  NumberFormat.compact().format(
                                                      profilePageUsersRecord
                                                          .investmentCount),
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme
                                                        .secondaryColor,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      2, 0, 0, 0),
                                                  child: Text(
                                                    'Backings',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Montserrat',
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  NumberFormat.compact().format(
                                                      profilePageUsersRecord
                                                          .followCount),
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme
                                                        .secondaryColor,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      2, 0, 0, 0),
                                                  child: Text(
                                                    'Followed Projects',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Montserrat',
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  NumberFormat.compact().format(
                                                      profilePageUsersRecord
                                                          .likesCount),
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme
                                                        .secondaryColor,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      2, 0, 0, 0),
                                                  child: Text(
                                                    'Liked Posts',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Montserrat',
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                StreamBuilder<List<StartupsRecord>>(
                                  stream: queryStartupsRecord(
                                    queryBuilder: (startupsRecord) =>
                                        startupsRecord.where('user_registerer',
                                            isEqualTo: profilePageUsersRecord
                                                .reference),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    List<StartupsRecord> rowStartupsRecordList =
                                        snapshot.data;

                                    if (snapshot.data.isEmpty) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 30),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: FFButtonWidget(
                                                text: 'Register Startup',
                                                onPressed: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          CreateStartupPageWidget(),
                                                    ),
                                                  );
                                                },
                                                options: FFButtonOptions(
                                                  width: 180,
                                                  height: 40,
                                                  color: Color(0x00FF0003),
                                                  textStyle: FlutterFlowTheme
                                                      .title3
                                                      .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme
                                                        .tertiaryColor,
                                                  ),
                                                  elevation: 0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme
                                                        .tertiaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 120,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                    final rowStartupsRecord =
                                        rowStartupsRecordList.first;
                                    return Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 25, 0, 30),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 5, 0, 5),
                                            child: Container(
                                              width: 120,
                                              height: 120,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Image.network(
                                                rowStartupsRecord.logo,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(6, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      rowStartupsRecord.name,
                                      style: FlutterFlowTheme.title1.override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.tertiaryColor,
                                      ),
                                    )
                                  ],
                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 2),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        rowStartupsRecord
                                                            .followerCount
                                                            .toString(),
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                2, 0, 0, 0),
                                                        child: Text(
                                                          'Followers',
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
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 2),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        rowStartupsRecord
                                                            .applicantCount
                                                            .toString(),
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                2, 0, 0, 0),
                                                        child: Text(
                                                          'Applicants',
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
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      rowStartupsRecord
                                                          .investorCount
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: FlutterFlowTheme
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              2, 0, 0, 0),
                                                      child: Text(
                                                        'Backers',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 5, 5, 0),
                                                      child: Text(
                                                        'Registered',
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              Color(0xC1FFFFFF),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 5, 0, 0),
                                                      child: Text(
                                                        timeago.format(
                                                            rowStartupsRecord
                                                                .dateRegistered
                                                                .toDate()),
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color:
                                                              Color(0xB3FFFFFF),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: AutoSizeText(
                                          'Please press this button if you encounter any errors or bugs you want us to fix or if you want a feature added. Thanks!    - Devs',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 90),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 20),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SendReportPageWidget(
                                                  id: profilePageUsersRecord
                                                      .email,
                                                ),
                                              ),
                                            );
                                          },
                                          text: 'Send Feedback',
                                          options: FFButtonOptions(
                                            width: 180,
                                            height: 40,
                                            color: Color(0x00FF0003),
                                            textStyle: FlutterFlowTheme.title3
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                            ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                              width: 1,
                                            ),
                                            borderRadius: 120,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
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
                                    queryBuilder: (postsRecord) => postsRecord
                                        .where('user',
                                            isEqualTo: currentUserReference)
                                        .orderBy('date_updated',
                                            descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    List<PostsRecord> listViewPostsRecordList =
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
                                        itemBuilder: (context, listViewIndex) {
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
                                                    alignment: Alignment(0, 0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 150,
                                                      decoration: BoxDecoration(
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
                                                                // Customize what your widget looks like when it's loading.
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
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            2),
                                                                        child:
                                                                            Text(
                                                                          listViewPostsRecord
                                                                              .title,
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
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                        child:
                                                                            Text(
                                                                          'Posted ${timeago.format(listViewPostsRecord.datePosted.toDate())}',
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
                                                                            listViewPostsRecord.body,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                FlutterFlowTheme.bodyText1.override(
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
                                                            padding: EdgeInsets
                                                                .fromLTRB(10, 0,
                                                                    10, 0),
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
                                                                        builder:
                                                                            (context) =>
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
                                                                      .format(listViewPostsRecord
                                                                          .likesCount),
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
                                                                          await listViewPostsRecord
                                                                              .reference
                                                                              .delete();
                                                                        },
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .delete_forever,
                                                                          color:
                                                                              FlutterFlowTheme.tertiaryColor,
                                                                          size:
                                                                              30,
                                                                        ),
                                                                        iconSize:
                                                                            30,
                                                                      )
                                                                    : IconButton(
                                                                        onPressed: listViewPostsRecord.user ==
                                                                                currentUserReference
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
                                                                          listViewPostsRecord.user != currentUserReference || !listViewPostsRecord.likedUsers.contains(currentUserReference)
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
                                        startupsRecord
                                            .where('followers',
                                                arrayContains:
                                                    currentUserReference)
                                            .orderBy('date_registered',
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
                                    // Customize what your widget looks like with no query results.
                                    if (snapshot.data.isEmpty) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Center(
                                          child: Text(
                                            'No Followed Startups Retrieved',
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
                                        itemBuilder: (context, listViewIndex) {
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
                                                    alignment: Alignment(0, 0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 130,
                                                      decoration: BoxDecoration(
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
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    5, 0, 0, 0),
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
                                                              child:
                                                                  Image.network(
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
                                                                    child: Text(
                                                                      listViewStartupsRecord
                                                                          .name,
                                                                      style: FlutterFlowTheme
                                                                          .bodyText1
                                                                          .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme
                                                                            .secondaryColor,
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
                                                                    child: Text(
                                                                      'Registered ${timeago.format(listViewStartupsRecord.dateRegistered.toDate())}',
                                                                      style: FlutterFlowTheme
                                                                          .bodyText1
                                                                          .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0x9BFFFFFF),
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
                                                                    child: Text(
                                                                      'Looking For: ${listViewStartupsRecord.lookingFor}',
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
                                                                            13,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
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
                                                            padding: EdgeInsets
                                                                .fromLTRB(10, 0,
                                                                    10, 0),
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
                                                                        builder:
                                                                            (context) =>
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
                                                                      .format(listViewStartupsRecord
                                                                          .followerCount),
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
                                                                  onPressed: listViewStartupsRecord
                                                                              .userRegisterer ==
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

                                                                          await listViewStartupsRecord
                                                                              .reference
                                                                              .update(startupsRecordData);
                                                                          final usersRecordData = !listViewStartupsRecord.followers.contains(currentUserReference)
                                                                              ? {
                                                                                  'follow_count': FieldValue.increment(1),
                                                                                }
                                                                              : {
                                                                                  'follow_count': FieldValue.increment(-1),
                                                                                };

                                                                          await currentUserReference
                                                                              .update(usersRecordData);
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
                                                                  iconSize: 30,
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
                                child: StreamBuilder<List<PostsRecord>>(
                                  stream: queryPostsRecord(
                                    queryBuilder: (postsRecord) => postsRecord
                                        .where('liked_users',
                                            arrayContains: currentUserReference)
                                        .orderBy('date_posted',
                                            descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    List<PostsRecord> listViewPostsRecordList =
                                        snapshot.data;

                                    if (snapshot.data.isEmpty) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Center(
                                          child: Text(
                                            'No Liked Posts Retrieved',
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
                                        itemBuilder: (context, listViewIndex) {
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
                                                    alignment: Alignment(0, 0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 150,
                                                      decoration: BoxDecoration(
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
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            2),
                                                                        child:
                                                                            Text(
                                                                          listViewPostsRecord
                                                                              .title,
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
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                        child:
                                                                            Text(
                                                                          'Posted ${timeago.format(listViewPostsRecord.datePosted.toDate())}',
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
                                                                              columnUsersRecord.displayName,
                                                                              style: FlutterFlowTheme.bodyText1.override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.secondaryColor,
                                                                                fontSize: 13,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              columnUsersRecord.lastName,
                                                                              style: FlutterFlowTheme.bodyText1.override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.secondaryColor,
                                                                                fontSize: 13,
                                                                              ),
                                                                            )
                                                                          ],
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
                                                                            listViewPostsRecord.body,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                FlutterFlowTheme.bodyText1.override(
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
                                                            padding: EdgeInsets
                                                                .fromLTRB(10, 0,
                                                                    10, 0),
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
                                                                        builder:
                                                                            (context) =>
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
                                                                      .format(listViewPostsRecord
                                                                          .likesCount),
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
                                                                  onPressed: listViewPostsRecord
                                                                              .user ==
                                                                          currentUserReference
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

                                                                          await listViewPostsRecord
                                                                              .reference
                                                                              .update(postsRecordData);
                                                                          final usersRecordData = !listViewPostsRecord.likedUsers.contains(currentUserReference)
                                                                              ? {
                                                                                  'likes_count': FieldValue.increment(1),
                                                                                }
                                                                              : {
                                                                                  'likes_count': FieldValue.increment(-1),
                                                                                };

                                                                          await currentUserReference
                                                                              .update(usersRecordData);
                                                                        },
                                                                  icon: Icon(
                                                                            !listViewPostsRecord.likedUsers.contains(
                                                                                currentUserReference)
                                                                        ? Icons
                                                                            .thumb_up_off_alt
                                                                        : Icons
                                                                            .thumb_up_sharp,
                                                                    color: FlutterFlowTheme
                                                                        .tertiaryColor,
                                                                    size: 30,
                                                                  ),
                                                                  iconSize: 30,
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
            ),
          ),
        );
      },
    );
  }
}
