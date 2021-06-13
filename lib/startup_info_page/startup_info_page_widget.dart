import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../send_application_page/send_application_page_widget.dart';
import '../send_donation_page/send_donation_page_widget.dart';
import '../send_partnership_request_page/send_partnership_request_page_widget.dart';
import '../send_report_page/send_report_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class StartupInfoPageWidget extends StatefulWidget {
  StartupInfoPageWidget({
    Key key,
    this.startup,
  }) : super(key: key);

  final StartupsRecord startup;

  @override
  _StartupInfoPageWidgetState createState() => _StartupInfoPageWidgetState();
}

class _StartupInfoPageWidgetState extends State<StartupInfoPageWidget> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
        automaticallyImplyLeading: true,
        title: AutoSizeText(
          widget.startup.name,
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Montserrat',
            color: FlutterFlowTheme.secondaryColor,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Image.network(
                            widget.startup.logo,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '${widget.startup.followerCount} Followers',
                                    style:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.tertiaryColor
                                        .withOpacity(0.7),
                                        fontSize: 13
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    '${widget.startup.applicantCount} Applicants',
                                    style:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.tertiaryColor
                                        .withOpacity(0.7),
                                        fontSize: 13
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '${widget.startup.investorCount} Backers',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.tertiaryColor
                                        .withOpacity(0.7),
                                        fontSize: 13
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'Looking For: ',
                                    overflow: TextOverflow.ellipsis,
                                    style: FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.tertiaryColor,
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    '${widget.startup.lookingFor}',
                                    overflow: TextOverflow.ellipsis,
                                    style: FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.tertiaryColor,
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 5),
                  child: AutoSizeText(
                    'Registered ${timeago.format(widget.startup.dateRegistered.toDate())}',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Montserrat',
                      color: Color(0x71FFFFFF),
                    ),
                  ),
                ),
                widget.startup.images.isEmpty
                    ? Container()
                    : Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Builder(
                          builder: (context) {
                            final images =
                                widget.startup.images?.toList() ?? [];
                            return Container(
                              width: double.infinity,
                              height: 500,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    controller: pageViewController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: images.length,
                                    itemBuilder: (context, imagesIndex) {
                                      final imagesItem = images[imagesIndex];
                                      return Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.primaryColor,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 1, 0, 0),
                                          child: Image.network(
                                            imagesItem,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment(0, 1),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      child: SmoothPageIndicator(
                                        controller: pageViewController,
                                        count: images.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) {
                                          pageViewController.animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect: ExpandingDotsEffect(
                                          expansionFactor: 2,
                                          spacing: 8,
                                          radius: 16,
                                          dotWidth: 16,
                                          dotHeight: 16,
                                          dotColor: Colors.black.withOpacity(0.2),
                                          activeDotColor:
                                              Colors.black.withOpacity(0.8),
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
                      ),
                StreamBuilder<UsersRecord>(
                  stream:
                      UsersRecord.getDocument(widget.startup.userRegisterer),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final rowUsersRecord = snapshot.data;
                    return Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                            child: Container(
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
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                            child: Text(
                              '${rowUsersRecord.displayName} ${rowUsersRecord.lastName}',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: Color(0x91FFFFFF),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment:
                        widget.startup.userRegisterer == currentUserReference
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        NumberFormat.compact()
                            .format(widget.startup.followerCount),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.secondaryColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: IconButton(
                          onPressed: widget.startup.userRegisterer ==
                                  currentUserReference
                              ? null
                              : () async {
                                  final startupsRecordData = !widget
                                          .startup.followers
                                          .contains(currentUserReference)
                                      ? {
                                          'follower_count':
                                              FieldValue.increment(1),
                                          'followers': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        }
                                      : {
                                          'follower_count':
                                              FieldValue.increment(-1),
                                          'followers': FieldValue.arrayRemove(
                                              [currentUserReference]),
                                        };

                                  await widget.startup.reference
                                      .update(startupsRecordData);

                                  final usersRecordData = !widget
                                          .startup.followers
                                          .contains(currentUserReference)
                                      ? {
                                          'follow_count':
                                              FieldValue.increment(1),
                                        }
                                      : {
                                          'follow_count':
                                              FieldValue.increment(-1),
                                        };

                                  await currentUserReference
                                      .update(usersRecordData);
                                },
                          icon: Icon(
                            widget.startup.followers
                                        .contains(currentUserReference) ||
                                    widget.startup.userRegisterer ==
                                        currentUserReference
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: FlutterFlowTheme.tertiaryColor,
                            size: 30,
                          ),
                          iconSize: 30,
                        ),
                      ),
                      widget.startup.userRegisterer == currentUserReference
                          ? Container()
                          : FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SendReportPageWidget(
                                      id: widget.startup.name,
                                    ),
                                  ),
                                );
                              },
                              text: 'Report',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.secondaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 120,
                              ),
                            )
                    ],
                  ),
                ),
                widget.startup.userRegisterer == currentUserReference
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SendApplicationPageWidget(
                                      startup: widget.startup,
                                    ),
                                  ),
                                );
                              },
                              text: 'Apply',
                              icon: Icon(
                                Icons.done,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.secondaryColor,
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
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SendDonationPageWidget(
                                      startup: widget.startup,
                                    ),
                                  ),
                                );
                              },
                              text: 'Fund',
                              icon: FaIcon(
                                FontAwesomeIcons.moneyCheckAlt,
                              ),
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.secondaryColor,
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
                            )
                          ],
                        ),
                      ),
                widget.startup.userRegisterer == currentUserReference
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.fromLTRB(0, 9, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SendPartnershipRequestPageWidget(
                                      startup: widget.startup,
                                    ),
                                  ),
                                );
                              },
                              text: 'Partner',
                              icon: Icon(
                                Icons.pan_tool,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.secondaryColor,
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
                            )
                          ],
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Technology Readines Level:',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.tertiaryColor,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                        child: Text(
                          widget.startup.trl.toString(),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.secondaryColor,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 5),
                  child: AutoSizeText(
                    widget.startup.motto,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, 5, 0, widget.startup.videoUrl == '' ? 50 : 0),
                  child: Text(
                    widget.startup.description,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                  ),
                ),
                widget.startup.videoUrl == ''
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              'Video Pitch',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.tertiaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                widget.startup.videoUrl == ''
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: FlutterFlowVideoPlayer(
                          path: widget.startup.videoUrl,
                          videoType: VideoType.network,
                          autoPlay: false,
                          looping: false,
                          showControls: true,
                          allowFullScreen: true,
                          allowPlaybackSpeedMenu: true,
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
