import 'package:sprout_up/create_startup_page/create_startup_page_widget.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../edit_startup_page/edit_startup_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import '../room_page/room_page_widget.dart';
import '../t_r_l_page/t_r_l_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

class SproutPageWidget extends StatefulWidget {
  SproutPageWidget({Key key}) : super(key: key);

  @override
  _SproutPageWidgetState createState() => _SproutPageWidgetState();
}

class _SproutPageWidgetState extends State<SproutPageWidget> {
  String uploadedFileUrl;
  final pageViewController = PageController();
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
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

        List<StartupsRecord> sproutPageStartupsRecordList = snapshot.data;

        if (snapshot.data.isEmpty) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: FlutterFlowTheme.primaryColor,
              automaticallyImplyLeading: false,
              title: Text(
                'Sprout',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.secondaryColor,
                ),
              ),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.primaryColor,
              ),
              child: Center(
                child: FFButtonWidget(
                  text: 'Register Startup',
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateStartupPageWidget(),
                      ),
                    );
                  },
                  options: FFButtonOptions(
                    width: 180,
                    height: 40,
                    color: Color(0x00FF0003),
                    textStyle: FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.tertiaryColor,
                      width: 1,
                    ),
                    borderRadius: 120,
                  ),
                ),
              ),
            ),
          );
        }
        final sproutPageStartupsRecord = sproutPageStartupsRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              sproutPageStartupsRecord.name,
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
                      builder: (context) => EditStartupPageWidget(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.edit_sharp,
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
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: FlutterFlowTheme.secondaryColor,
                      indicatorColor: FlutterFlowTheme.secondaryColor,
                      tabs: [
                        Tab(
                          text: 'Info',
                          icon: Icon(
                            Icons.info,
                          ),
                        ),
                        Tab(
                          text: 'Pitch',
                          icon: Icon(
                            Icons.videocam,
                          ),
                        ),
                        Tab(
                          text: 'TRL',
                          icon: Icon(
                            Icons.biotech_sharp,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          StartupInfoTabWidget(sproutPageStartupsRecord: sproutPageStartupsRecord, pageViewController: pageViewController),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      final selectedMedia = await selectMedia(
                                        isVideo: true,
                                      );
                                      if (selectedMedia != null &&
                                          validateFileFormat(
                                              selectedMedia.storagePath,
                                              context)) {
                                        showUploadMessage(
                                            context, 'Uploading file...',
                                            showLoading: true);
                                        final downloadUrl = await uploadData(
                                            selectedMedia.storagePath,
                                            selectedMedia.bytes);
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        if (downloadUrl != null) {
                                          setState(() =>
                                              uploadedFileUrl = downloadUrl);
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          showUploadMessage(context,
                                              'Failed to upload media');
                                        }
                                      }
                                      final videoUrl = uploadedFileUrl;

                                      final startupsRecordData =
                                          createStartupsRecordData(
                                        videoUrl: videoUrl,
                                      );

                                      await sproutPageStartupsRecord.reference
                                          .update(startupsRecordData);
                                    },
                                    text: 'Upload Video',
                                    icon: Icon(
                                      Icons.video_call,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 180,
                                      height: 40,
                                      color: FlutterFlowTheme.tertiaryColor,
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
                                sproutPageStartupsRecord.videoUrl == ''
                                    ? Container()
                                    : Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: FlutterFlowVideoPlayer(
                                          path:
                                              sproutPageStartupsRecord.videoUrl,
                                          videoType: VideoType.network,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          autoPlay: false,
                                          looping: false,
                                          showControls: true,
                                          allowFullScreen: true,
                                          allowPlaybackSpeedMenu: true,
                                        ),
                                      ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(50, 20, 50, 5),
                                        child: AutoSizeText(
                                          'Tips for your Video Pitch',
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
                                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Color(0x0E000000),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Keep it short',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                            ),
                                          ),
                                          Text(
                                            'Remember the 5 Ws',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                            ),
                                          ),
                                          Text(
                                            'Show, rather than tell',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                            ),
                                          ),
                                          Text(
                                            'Don\'t hide behind the curtain',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                            ),
                                          ),
                                          Text(
                                            'Make sure we can hear you',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                            ),
                                          ),
                                          Text(
                                            'Have a great opening',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          child: Text(
                                            'TRL',
                                            style: FlutterFlowTheme.title1
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color: FlutterFlowTheme
                                                  .tertiaryColor,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          sproutPageStartupsRecord.trl
                                              .toString(),
                                          style:
                                              FlutterFlowTheme.title1.override(
                                            fontFamily: 'Montserrat',
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            fontSize: 30,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: AutoSizeText(
                                          'Technology readiness levels (TRLs) are a method for estimating the maturity of technologies.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                StreamBuilder<List<TrlProgressRecord>>(
                                  stream: queryTrlProgressRecord(
                                    queryBuilder: (trlProgressRecord) =>
                                        trlProgressRecord.where('startup',
                                            isEqualTo: sproutPageStartupsRecord
                                                .reference),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    List<TrlProgressRecord>
                                        buttonTrlProgressRecordList =
                                        snapshot.data;

                                    if (snapshot.data.isEmpty) {
                                      return Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(70, 20, 70, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            final trlProgressRecordData = {
                                              ...createTrlProgressRecordData(
                                                dateUpdated:
                                                    getCurrentTimestamp,
                                                level: 0,
                                                levelEightProgress: 0,
                                                levelFiveProgress: 0,
                                                levelFourProgress: 0,
                                                levelNineProgress: 0,
                                                levelOneProgress: 0,
                                                levelSevenProgress: 0,
                                                levelSixProgress: 0,
                                                levelThreeProgress: 0,
                                                levelTwoProgress: 0,
                                                startup:
                                                    sproutPageStartupsRecord
                                                        .reference,
                                              )
                                            };

                                            await TrlProgressRecord.collection
                                                .doc()
                                                .set(trlProgressRecordData);
                                                
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TRLPageWidget(
                                                  startup:
                                                      sproutPageStartupsRecord,
                                                ),
                                              ),
                                            );
                                          },
                                          text: 'Register TRL Progress',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40,
                                            color:
                                                FlutterFlowTheme.secondaryColor,
                                            textStyle: FlutterFlowTheme
                                                .subtitle2
                                                .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: 120,
                                          ),
                                        ),
                                      );
                                    }
                                    final buttonTrlProgressRecord =
                                        buttonTrlProgressRecordList.first;
                                    return Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(70, 20, 70, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TRLPageWidget(
                                                startup:
                                                    sproutPageStartupsRecord,
                                              ),
                                            ),
                                          );
                                        },
                                        text: 'Open TRL Form',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color:
                                              FlutterFlowTheme.secondaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Montserrat',
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 120,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/4/4b/NASA_TRL_Meter.png',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Image taken from wikepedia',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.tertiaryColor,
                                    fontWeight: FontWeight.w200,
                                  ),
                                )
                              ],
                            ),
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

class StartupInfoTabWidget extends StatelessWidget {
  const StartupInfoTabWidget({
    Key key,
    @required this.sproutPageStartupsRecord,
    @required this.pageViewController,
  }) : super(key: key);

  final StartupsRecord sproutPageStartupsRecord;
  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                      sproutPageStartupsRecord.logo,
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 0, 5),
                        child: AutoSizeText(
                          'Registered ${timeago.format(sproutPageStartupsRecord.dateRegistered.toDate())}',
                          style: FlutterFlowTheme
                              .bodyText1
                              .override(
                            fontFamily: 'Montserrat',
                            color: Color(0x71FFFFFF),
                            fontSize: 12
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 0, 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${NumberFormat.compact().format(
                                  sproutPageStartupsRecord
                                      .followerCount)} Followers',
                              style: FlutterFlowTheme
                                  .bodyText1
                                  .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme
                                    .tertiaryColor,
                                  fontSize: 13
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 0, 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${NumberFormat.compact().format(
                                  sproutPageStartupsRecord
                                      .applicantCount)} Applicants',
                              style: FlutterFlowTheme
                                  .bodyText1
                                  .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme
                                    .tertiaryColor,
                                  fontSize: 13
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '${NumberFormat.compact().format(
                                sproutPageStartupsRecord
                                    .investorCount)} Backers',
                            style: FlutterFlowTheme
                                .bodyText1
                                .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme
                                  .secondaryColor,
                                  fontSize: 13
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Looking For: ${
                                  sproutPageStartupsRecord
                                      .lookingFor}',
                              style: FlutterFlowTheme
                                  .bodyText1
                                  .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme
                                    .secondaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
          sproutPageStartupsRecord.images.isEmpty ? Container() : Container(
            width: double.infinity,
            height:
                MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Builder(
              builder: (context) {
                final images = sproutPageStartupsRecord
                        .images
                        ?.toList() ??
                    [];
                return Container(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: pageViewController,
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder:
                            (context, imagesIndex) {
                          final imagesItem =
                              images[imagesIndex];
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme
                                  .primaryColor,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(
                                      0, 1, 0, 0),
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
                          padding: EdgeInsets.fromLTRB(
                              0, 0, 0, 10),
                          child: SmoothPageIndicator(
                            controller:
                                pageViewController,
                            count: images.length,
                            axisDirection:
                                Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController
                                  .animateToPage(
                                i,
                                duration: Duration(
                                    milliseconds: 500),
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
                              activeDotColor: Colors.black.withOpacity(0.7),
                              paintStyle:
                                  PaintingStyle.fill,
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
          Padding(
                padding: EdgeInsets.fromLTRB(
                    20, 20, 0, 0),
            child: Text(
              sproutPageStartupsRecord.motto,
              style: FlutterFlowTheme
                  .bodyText1
                  .override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme
                    .tertiaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              sproutPageStartupsRecord.description,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.tertiaryColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await sproutPageStartupsRecord
                        .reference
                        .delete();
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarPage(
                            initialPage: 'HomePage'),
                      ),
                      (r) => false,
                    );
                  },
                  text: 'Delete Sprout',
                  options: FFButtonOptions(
                    elevation: 0,
                    width: 130,
                    height: 40,
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.subtitle2
                        .override(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: 120,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
