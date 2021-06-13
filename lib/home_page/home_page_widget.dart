import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../profile_page/profile_page_widget.dart';
import '../send_application_page/send_application_page_widget.dart';
import '../send_donation_page/send_donation_page_widget.dart';
import '../send_partnership_request_page/send_partnership_request_page_widget.dart';
import '../startup_info_page/startup_info_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'SproutUp',
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
              Icons.perm_identity,
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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF4DB6AC),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: AutoSizeText(
                  'Featured Sprouts',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.tertiaryColor,
                    fontSize: 40,
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<StartupsRecord>>(
                  stream: queryStartupsRecord(
                    queryBuilder: (startupsRecord) => startupsRecord
                        .orderBy('date_registered', descending: true),
                  ),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List<StartupsRecord> pageViewStartupsRecordList =
                        snapshot.data;
                    if (snapshot.data.isEmpty) {
                      return Container(
                          child: Center(
                        child: AutoSizeText(
                          'No Featured Startups',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.tertiaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ));
                    }
                    return Container(
                      width: double.infinity,
                      height: 500,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                            child: PageView.builder(
                              controller: pageViewController,
                              scrollDirection: Axis.horizontal,
                              itemCount: pageViewStartupsRecordList.length,
                              itemBuilder: (context, pageViewIndex) {
                                final pageViewStartupsRecord =
                                    pageViewStartupsRecordList[pageViewIndex];
                                return StartupSlideWidget(pageViewStartupsRecord: pageViewStartupsRecord);
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment(0, 1),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: SmoothPageIndicator(
                                controller: pageViewController,
                                count: pageViewStartupsRecordList.length,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) {
                                  pageViewController.animateToPage(
                                    i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect: ExpandingDotsEffect(
                                  expansionFactor: 2,
                                  spacing: 8,
                                  radius: 16,
                                  dotWidth: 16,
                                  dotHeight: 16,
                                  dotColor: Color(0x8AFFFFFF),
                                  activeDotColor:
                                      FlutterFlowTheme.secondaryColor,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StartupSlideWidget extends StatelessWidget {
  const StartupSlideWidget({
    Key key,
    @required this.pageViewStartupsRecord,
  }) : super(key: key);

  final StartupsRecord pageViewStartupsRecord;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0x30FFFFFF),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding:
              EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment:
                MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, 10, 0, 29),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StartupInfoPageWidget(
                                    startup:
                                        pageViewStartupsRecord,
                                  ),
                                ),
                              );
                            },
                      child: Container(
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Image.network(
                          pageViewStartupsRecord.logo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.fromLTRB(
                                10, 0, 0, 0),
                        child: Column(
                          mainAxisSize:
                              MainAxisSize.max,
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceEvenly,
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            GestureDetector(
                              onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StartupInfoPageWidget(
                                    startup:
                                        pageViewStartupsRecord,
                                  ),
                                ),
                              );
                            },
                              child: AutoSizeText(
                                pageViewStartupsRecord
                                    .name,
                                style:
                                    FlutterFlowTheme
                                        .bodyText1
                                        .override(
                                  fontFamily:
                                      'Montserrat',
                                  color: FlutterFlowTheme
                                      .tertiaryColor,
                                  fontSize: 17,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),
                            ),
                            AutoSizeText(
                              'Registered ${timeago.format(pageViewStartupsRecord.dateRegistered.toDate())}',
                              style:
                                  FlutterFlowTheme
                                      .bodyText1
                                      .override(
                                fontFamily:
                                    'Montserrat',
                                color: Color(
                                    0xB3FFFFFF),
                                fontSize: 10,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets
                                  .fromLTRB(
                                      0, 5, 0, 0),
                              child: Row(
                                mainAxisSize:
                                    MainAxisSize
                                        .max,
                                children: [
                                  AutoSizeText(
                                    '${NumberFormat
                                            .compact()
                                        .format(pageViewStartupsRecord
                                            .investorCount)} Backers',
                                    style: FlutterFlowTheme
                                        .bodyText1
                                        .override(
                                      fontFamily:
                                          'Montserrat',
                                      color: Color(
                                          0xB3FFFFFF),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets
                                  .fromLTRB(
                                      0, 1, 0, 0),
                              child: Row(
                                mainAxisSize:
                                    MainAxisSize
                                        .max,
                                children: [
                                  Text(
                                    '${NumberFormat
                                            .compact()
                                        .format(pageViewStartupsRecord
                                            .applicantCount)} Applicants',
                                    style: FlutterFlowTheme
                                        .bodyText1
                                        .override(
                                      fontFamily:
                                          'Montserrat',
                                      color: Color(
                                          0xB3FFFFFF),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize:
                          MainAxisSize.max,
                      mainAxisAlignment:
                          MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(
                                  0, 0, 0, 20),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StartupInfoPageWidget(
                                    startup:
                                        pageViewStartupsRecord,
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
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text(
                      'Currently looking for',
                      style: FlutterFlowTheme
                          .bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .secondaryColor.withOpacity(0.8),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Container(
                          child: Text(
                            pageViewStartupsRecord
                                .lookingFor,
                                textAlign: TextAlign.center,
                            style: FlutterFlowTheme.title2
                                .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme
                                  .tertiaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pageViewStartupsRecord
                          .userRegisterer ==
                      currentUserReference
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, 10),
                      child: Row(
                        mainAxisSize:
                            MainAxisSize.max,
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceEvenly,
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SendApplicationPageWidget(
                                    startup:
                                        pageViewStartupsRecord,
                                  ),
                                ),
                              );
                            },
                            text: 'Apply',
                            icon: Icon(
                              Icons.done,
                              size: 15,
                            ),
                            options:
                                FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme
                                  .secondaryColor,
                              textStyle:
                                  FlutterFlowTheme
                                      .subtitle2
                                      .override(
                                fontFamily:
                                    'Montserrat',
                                color:
                                    FlutterFlowTheme
                                        .primaryColor,
                              ),
                              borderSide:
                                  BorderSide(
                                color: Colors
                                    .transparent,
                                width: 1,
                              ),
                              borderRadius: 120,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SendDonationPageWidget(
                                    startup:
                                        pageViewStartupsRecord,
                                  ),
                                ),
                              );
                            },
                            text: 'Fund',
                            icon: FaIcon(
                              FontAwesomeIcons
                                  .moneyCheckAlt,
                            ),
                            options:
                                FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme
                                  .secondaryColor,
                              textStyle:
                                  FlutterFlowTheme
                                      .subtitle2
                                      .override(
                                fontFamily:
                                    'Montserrat',
                                color:
                                    FlutterFlowTheme
                                        .primaryColor,
                              ),
                              borderSide:
                                  BorderSide(
                                color: Colors
                                    .transparent,
                                width: 1,
                              ),
                              borderRadius: 120,
                            ),
                          )
                        ],
                      ),
                    ),
              pageViewStartupsRecord
                          .userRegisterer ==
                      currentUserReference
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, 0, 20),
                      child: Row(
                        mainAxisSize:
                            MainAxisSize.max,
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SendPartnershipRequestPageWidget(
                                    startup:
                                        pageViewStartupsRecord,
                                  ),
                                ),
                              );
                            },
                            text: 'Partner',
                            icon: Icon(
                              Icons.pan_tool,
                              size: 15,
                            ),
                            options:
                                FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme
                                  .secondaryColor,
                              textStyle:
                                  FlutterFlowTheme
                                      .subtitle2
                                      .override(
                                fontFamily:
                                    'Montserrat',
                                color:
                                    FlutterFlowTheme
                                        .primaryColor,
                              ),
                              borderSide:
                                  BorderSide(
                                color: Colors
                                    .transparent,
                                width: 1,
                              ),
                              borderRadius: 120,
                            ),
                          )
                        ],
                      ),
                    ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, 0, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Technology Readiness Level:   ${
                      pageViewStartupsRecord.trl}',
                        style: FlutterFlowTheme
                            .bodyText1
                            .override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme
                              .secondaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                pageViewStartupsRecord.motto,
                overflow: TextOverflow.ellipsis,
                style: FlutterFlowTheme.bodyText1
                    .override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme
                      .tertiaryColor,
                ),
              ),
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.end,
                children: [
                  Text(
                    NumberFormat.compact().format(
                        pageViewStartupsRecord
                            .followerCount),
                    style: FlutterFlowTheme
                        .bodyText1
                        .override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme
                          .tertiaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: pageViewStartupsRecord
                                .userRegisterer ==
                            currentUserReference
                        ? null
                        : () async {
                            final startupsRecordData =
                                !pageViewStartupsRecord
                                        .followers
                                        .contains(
                                            currentUserReference)
                                    ? {
                                        'follower_count':
                                            FieldValue
                                                .increment(1),
                                        'followers':
                                            FieldValue
                                                .arrayUnion([
                                          currentUserReference
                                        ]),
                                      }
                                    : {
                                        'follower_count':
                                            FieldValue.increment(
                                                -1),
                                        'followers':
                                            FieldValue
                                                .arrayRemove([
                                          currentUserReference
                                        ]),
                                      };

                            await pageViewStartupsRecord
                                .reference
                                .update(
                                    startupsRecordData);

                            final usersRecordData =
                                !pageViewStartupsRecord
                                        .followers
                                        .contains(
                                            currentUserReference)
                                    ? {
                                        'likes_count':
                                            FieldValue
                                                .increment(1),
                                      }
                                    : {
                                        'likes_count':
                                            FieldValue.increment(
                                                -1),
                                      };

                            await currentUserReference
                                .update(
                                    usersRecordData);
                          },
                    icon: Icon(
                      pageViewStartupsRecord
                                  .followers
                                  .contains(
                                      currentUserReference) ||
                              pageViewStartupsRecord
                                      .userRegisterer ==
                                  currentUserReference
                          ? Icons.favorite
                          : Icons.favorite_border,
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
  }
}
