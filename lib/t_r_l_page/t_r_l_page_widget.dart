import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TRLPageWidget extends StatefulWidget {
  TRLPageWidget({
    Key key,
    this.startup,
  }) : super(key: key);

  final StartupsRecord startup;

  @override
  _TRLPageWidgetState createState() => _TRLPageWidgetState();
}

class _TRLPageWidgetState extends State<TRLPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TrlProgressRecord>>(
      stream: queryTrlProgressRecord(
        queryBuilder: (trlProgressRecord) => trlProgressRecord.where('startup',
            isEqualTo: widget.startup.reference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<TrlProgressRecord> tRLPageTrlProgressRecordList = snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          tRLPageTrlProgressRecordList = createDummyTrlProgressRecord(count: 1);
        }
        final tRLPageTrlProgressRecord = tRLPageTrlProgressRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
            automaticallyImplyLeading: true,
            title: Text(
              'TRL Checklist',
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
              child: DefaultTabController(
                length: 9,
                initialIndex: widget.startup.trl == 0 ? 0 : widget.startup.trl != 9 ? widget.startup.trl : widget.startup.trl - 1,
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      labelColor: FlutterFlowTheme.tertiaryColor,
                      indicatorColor: FlutterFlowTheme.secondaryColor,
                      tabs: [
                        Tab(
                          text: '1',
                        ),
                        Tab(
                          text: '2',
                        ),
                        Tab(
                          text: '3',
                        ),
                        Tab(
                          text: '4',
                        ),
                        Tab(
                          text: '5',
                        ),
                        Tab(
                          text: '6',
                        ),
                        Tab(
                          text: '7',
                        ),
                        Tab(
                          text: '8',
                        ),
                        Tab(
                          text: '9',
                        )
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          TRLTab1Widget(tRLPageTrlProgressRecord: tRLPageTrlProgressRecord, widget: widget),
                          TRLTab2Widget(tRLPageTrlProgressRecord: tRLPageTrlProgressRecord, widget: widget),
                          TRLTab3Widget(tRLPageTrlProgressRecord: tRLPageTrlProgressRecord, widget: widget),
                          TRLTab4Widget(tRLPageTrlProgressRecord: tRLPageTrlProgressRecord, widget: widget),
                          TRLTab5Widget(tRLPageTrlProgressRecord: tRLPageTrlProgressRecord, widget: widget),
                          TRLTab6Widget(tRLPageTrlProgressRecord: tRLPageTrlProgressRecord, widget: widget),
                          TRLTab7Widget(tRLPageTrlProgressRecord: tRLPageTrlProgressRecord, widget: widget),
                          TRLTab8Widget(tRLPageTrlProgressRecord: tRLPageTrlProgressRecord, widget: widget),
                          TRLTab9Widget(tRLPageTrlProgressRecord: tRLPageTrlProgressRecord, widget: widget)
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

class TRLTab9Widget extends StatelessWidget {
  const TRLTab9Widget({
    Key key,
    @required this.tRLPageTrlProgressRecord,
    @required this.widget,
  }) : super(key: key);

  final TrlProgressRecord tRLPageTrlProgressRecord;
  final TRLPageWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    'Questions',
                    style:
                        FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color:
                          FlutterFlowTheme.tertiaryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelNineProgress >= 1 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_nine_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelNineProgress < 1 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Does technology/system function as defined in Operational Concept document?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelNineProgress < 1 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelNineProgress >= 2 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_nine_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelNineProgress < 2 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Has technology/system has been deployed in intended operational environment?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelNineProgress < 2 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelNineProgress >= 3 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_nine_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelNineProgress < 3 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has technology/system been fully demonstrated?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelNineProgress < 3 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelNineProgress >= 4 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;
                      final level = 9;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                          level: level,
                        ),
                        'level_nine_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                      final trl = 9;

                      final startupsRecordData =
                          createStartupsRecordData(
                        dateUpdated: dateUpdated,
                        trl: trl,
                      );

                      await widget.startup.reference
                          .update(startupsRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelNineProgress < 4 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has Operational Test and Evaluation (OT&E) been successfully completed?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TRLTab8Widget extends StatelessWidget {
  const TRLTab8Widget({
    Key key,
    @required this.tRLPageTrlProgressRecord,
    @required this.widget,
  }) : super(key: key);

  final TrlProgressRecord tRLPageTrlProgressRecord;
  final TRLPageWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    'Questions',
                    style:
                        FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color:
                          FlutterFlowTheme.tertiaryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelEightProgress >= 1 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_eight_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelEightProgress < 1 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Are all technology/system components form, fit, and function compatible?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelEightProgress < 1 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelEightProgress >= 2 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_eight_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelEightProgress < 2 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Is technology/system form, fit, and function compatible with operational environment?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelEightProgress < 2 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelEightProgress >= 3 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_eight_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelEightProgress < 3 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has technology/system form, fit, and function been demonstrated in operational environment?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelEightProgress < 3 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelEightProgress >= 4 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;
                      final level = 8;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                          level: level,
                        ),
                        'level_eight_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                      final trl = 8;

                      final startupsRecordData =
                          createStartupsRecordData(
                        dateUpdated: dateUpdated,
                        trl: trl,
                      );

                      await widget.startup.reference
                          .update(startupsRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelEightProgress < 4 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Is technical Developmental Test and Evaluation (DT&E) successfully completed?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TRLTab7Widget extends StatelessWidget {
  const TRLTab7Widget({
    Key key,
    @required this.tRLPageTrlProgressRecord,
    @required this.widget,
  }) : super(key: key);

  final TrlProgressRecord tRLPageTrlProgressRecord;
  final TRLPageWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    'Questions',
                    style:
                        FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color:
                          FlutterFlowTheme.tertiaryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelSevenProgress >= 1 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_seven_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelSevenProgress < 1 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Have all interfaces been tested individually under stressed and anomalous conditions?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelSevenProgress < 1 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelSevenProgress >= 2 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_seven_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelSevenProgress < 2 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Has technology or system been tested in a relevant environment?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelSevenProgress < 2 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelSevenProgress >= 3 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_seven_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelSevenProgress < 3 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Are available components representative of production components?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelSevenProgress < 3 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelSevenProgress >= 4 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_seven_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelSevenProgress < 4 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has operational testing of technology/system in relevant environment been completed?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelSevenProgress < 4 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelSevenProgress >= 5 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;
                      final level = 7;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                          level: level,
                        ),
                        'level_seven_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                      final trl = 7;

                      final startupsRecordData =
                          createStartupsRecordData(
                        dateUpdated: dateUpdated,
                        trl: trl,
                      );

                      await widget.startup.reference
                          .update(startupsRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelSevenProgress < 5 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has fully integrated prototype been demonstrated in actual or simulated operational environment?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TRLTab6Widget extends StatelessWidget {
  const TRLTab6Widget({
    Key key,
    @required this.tRLPageTrlProgressRecord,
    @required this.widget,
  }) : super(key: key);

  final TrlProgressRecord tRLPageTrlProgressRecord;
  final TRLPageWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    'Questions',
                    style:
                        FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color:
                          FlutterFlowTheme.tertiaryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelSixProgress >= 1 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_six_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelSixProgress < 1 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Have system integration issues been addressed?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelSixProgress < 1 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelSixProgress >= 2 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_six_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelSixProgress < 2 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Is the operational environment fully known?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelSixProgress < 2 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelSixProgress >= 3 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_six_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelSixProgress < 3 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Have performance characteristics been verified in a simulated operational environment?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelSixProgress < 3 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelSixProgress >= 4 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_six_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelSixProgress < 4 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has prototype been tested in a simulated operational environment?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelSixProgress < 4 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelSixProgress >= 5 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_six_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelSixProgress < 5 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has system been tested in realistic environment outside the laboratory?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelSixProgress < 5 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelSixProgress >= 6 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;
                      final level = 6;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                          level: level,
                        ),
                        'level_six_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                      final trl = 6;

                      final startupsRecordData =
                          createStartupsRecordData(
                        dateUpdated: dateUpdated,
                        trl: trl,
                      );

                      await widget.startup.reference
                          .update(startupsRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelSixProgress < 6 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has engineering feasibility been fully demonstrated?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TRLTab5Widget extends StatelessWidget {
  const TRLTab5Widget({
    Key key,
    @required this.tRLPageTrlProgressRecord,
    @required this.widget,
  }) : super(key: key);

  final TrlProgressRecord tRLPageTrlProgressRecord;
  final TRLPageWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    'Questions',
                    style:
                        FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color:
                          FlutterFlowTheme.tertiaryColor,
                    ),
                  )
                ],
              ),
            ),
           Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFiveProgress >= 1 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_five_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFiveProgress < 1 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Have internal system interface requirements been documented?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFiveProgress < 1 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFiveProgress >= 2 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_five_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFiveProgress < 2 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Has analysis of internal interface requirements been completed?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFiveProgress < 2 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFiveProgress >= 3 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_five_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFiveProgress < 3 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Can all system specifications be simulated and validated within a laboratory environment?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFiveProgress < 3 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFiveProgress >= 4 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_five_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFiveProgress < 4 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Is the laboratory environment high-fidelity?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFiveProgress < 4 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFiveProgress >= 6 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_five_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFiveProgress < 5 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Have individual component functions been verified through testing?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFiveProgress < 5 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFiveProgress >= 6 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_five_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFiveProgress < 6 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Have objective and threshold operational requirements been developed?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFiveProgress < 6 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFiveProgress >= 7 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;
                      final level = 5;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                          level: level,
                        ),
                        'level_five_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                      final trl = 5;

                      final startupsRecordData =
                          createStartupsRecordData(
                        dateUpdated: dateUpdated,
                        trl: trl,
                      );

                      await widget.startup.reference
                          .update(startupsRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFiveProgress < 7 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has a Product Breakdown Structure been developed?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TRLTab4Widget extends StatelessWidget {
  const TRLTab4Widget({
    Key key,
    @required this.tRLPageTrlProgressRecord,
    @required this.widget,
  }) : super(key: key);

  final TrlProgressRecord tRLPageTrlProgressRecord;
  final TRLPageWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    'Questions',
                    style:
                        FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color:
                          FlutterFlowTheme.tertiaryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFourProgress >= 1 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_four_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFourProgress < 1 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Has acceptance testing of individual components been performed?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFourProgress < 1 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFourProgress >= 2 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_four_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFourProgress < 2 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Has performance of components and interfaces between components been demonstrated?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFourProgress < 2 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFourProgress >= 3 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_four_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFourProgress < 3 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Does draft system architecture plan exist?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFourProgress < 3 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFourProgress >= 4 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_four_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFourProgress < 4 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Have end user technology/system requirements been documented?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFourProgress < 4 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFourProgress >= 5 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_four_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFourProgress < 5 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has component compatibility been demonstrated?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFourProgress < 5 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFourProgress >= 6 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_four_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                     tRLPageTrlProgressRecord.levelFourProgress < 6 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Does technology demonstrate basic functionality in simplified environment?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFourProgress < 6 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFourProgress >= 7 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_four_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFourProgress < 7 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Have performance characteristics been demonstrated in a laboratory environment?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelFourProgress < 7 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelFourProgress >= 8 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;
                      final level = 4;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                          level: level,
                        ),
                        'level_four_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                      final trl = 4;

                      final startupsRecordData =
                          createStartupsRecordData(
                        dateUpdated: dateUpdated,
                        trl: trl,
                      );

                      await widget.startup.reference
                          .update(startupsRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelFourProgress < 8 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Have low-fidelity assessments of system integration and engineering been completed?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TRLTab3Widget extends StatelessWidget {
  const TRLTab3Widget({
    Key key,
    @required this.tRLPageTrlProgressRecord,
    @required this.widget,
  }) : super(key: key);

  final TrlProgressRecord tRLPageTrlProgressRecord;
  final TRLPageWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    'Questions',
                    style:
                        FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color:
                          FlutterFlowTheme.tertiaryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelThreeProgress >= 1 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_three_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelThreeProgress < 1 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Have calculated predictions of components of technology capability been validated?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelThreeProgress < 1 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelThreeProgress >= 2 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_three_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelThreeProgress < 2 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Can all science applicable to the technology be modeled or simulated?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelThreeProgress < 2 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelThreeProgress >= 3 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_three_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelThreeProgress < 3 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Do experiments or modeling and simulation (M&S) validate performance predictions of technology capability?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelThreeProgress < 3 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelThreeProgress >= 4 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_three_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelThreeProgress < 4 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Do experiments verify feasibility of application of technology?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelThreeProgress < 4 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelThreeProgress >= 5 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_three_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelThreeProgress < 5 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Do paper studies indicate that technology or system components can be integrated?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelThreeProgress < 5 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelThreeProgress >= 6 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_three_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelThreeProgress < 6 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Are the technology or system performance metrics established?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelThreeProgress < 6 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelThreeProgress >= 7 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_three_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelThreeProgress < 7 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has scientific feasibility of proposed technology been fully demonstrated?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelThreeProgress < 7 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelThreeProgress >= 8 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;
                      final level = 3;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                          level: level,
                        ),
                        'level_three_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                      final dateRegistered =
                          getCurrentTimestamp;
                      final trl = 3;

                      final startupsRecordData =
                          createStartupsRecordData(
                        dateRegistered: dateRegistered,
                        trl: trl,
                      );

                      await widget.startup.reference
                          .update(startupsRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelThreeProgress < 8 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Does analysis of present technologies show that proposed technology or system fills a capability gap?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TRLTab2Widget extends StatelessWidget {
  const TRLTab2Widget({
    Key key,
    @required this.tRLPageTrlProgressRecord,
    @required this.widget,
  }) : super(key: key);

  final TrlProgressRecord tRLPageTrlProgressRecord;
  final TRLPageWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    'Questions',
                    style:
                        FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color:
                          FlutterFlowTheme.tertiaryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelTwoProgress >= 1 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_two_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelTwoProgress < 1 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Has potential system or component applications been identified?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelTwoProgress < 1 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelTwoProgress >= 2 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_two_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelTwoProgress < 2 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Have paper studies confirmed system or component application feasibility?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelTwoProgress < 2 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelTwoProgress >= 3 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_two_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelTwoProgress < 3 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has an apparent design solution been identified?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelTwoProgress < 3 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelTwoProgress >= 4 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_two_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelTwoProgress < 4 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Have the basic components of the technology been identified?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelTwoProgress < 4 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelTwoProgress >= 5 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_two_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelTwoProgress < 5 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Have technology or system components been at least partially characterized?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelTwoProgress < 5 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelTwoProgress >= 6 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_two_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelTwoProgress < 6 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Have performance predictions been documented for each component?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelTwoProgress < 6 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelTwoProgress >= 7 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_two_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelTwoProgress < 7 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has a functional requirements generation process been initiated?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelTwoProgress < 7 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelTwoProgress >= 8 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_two_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelTwoProgress < 8 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Does preliminary analysis confirm basic scientific principles?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelTwoProgress < 8 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelTwoProgress >= 9 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;
                      final level = 2;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                          level: level,
                        ),
                        'level_two_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                      final trl = 2;

                      final startupsRecordData =
                          createStartupsRecordData(
                        trl: trl,
                        dateUpdated: dateUpdated,
                      );

                      await widget.startup.reference
                          .update(startupsRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelTwoProgress < 9 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Are basic scientific principles confirmed with calculation based analytical studies?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TRLTab1Widget extends StatelessWidget {
  const TRLTab1Widget({
    Key key,
    @required this.tRLPageTrlProgressRecord,
    @required this.widget,
  }) : super(key: key);

  final TrlProgressRecord tRLPageTrlProgressRecord;
  final TRLPageWidget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    'Questions',
                    style:
                        FlutterFlowTheme.title3.override(
                      fontFamily: 'Montserrat',
                      color:
                          FlutterFlowTheme.tertiaryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelOneProgress >= 1 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_one_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelOneProgress < 1 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Do rough calculations support the concept?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelOneProgress < 1 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelOneProgress >= 2 ? null :  () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_one_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelOneProgress < 2 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      'Do basic principles (physical, chemical, mathematical) support the concept?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelOneProgress < 2 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelOneProgress >= 3 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                        ),
                        'level_one_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelOneProgress < 3 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Do paper studies confirm basic scientific principles of new technology?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            tRLPageTrlProgressRecord.levelOneProgress < 3 ? Container() : Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: tRLPageTrlProgressRecord.levelOneProgress >= 4 ? null : () async {
                      final dateUpdated =
                          getCurrentTimestamp;
                      final level = 1;

                      final trlProgressRecordData = {
                        ...createTrlProgressRecordData(
                          dateUpdated: dateUpdated,
                          level: level,
                        ),
                        'level_one_progress':
                            FieldValue.increment(1),
                      };

                      await tRLPageTrlProgressRecord
                          .reference
                          .update(trlProgressRecordData);
                      final trl = 1;

                      final startupsRecordData =
                          createStartupsRecordData(
                        dateUpdated: dateUpdated,
                        trl: trl,
                      );

                      await widget.startup.reference
                          .update(startupsRecordData);
                    },
                    icon: Icon(
                      tRLPageTrlProgressRecord.levelOneProgress < 4 ? Icons.check_box_outline_blank : Icons.check_box,
                      color:
                          FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Text(
                      'Has a scientific methodology or approach been developed?',
                      style: FlutterFlowTheme.bodyText1
                          .override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme
                            .tertiaryColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
