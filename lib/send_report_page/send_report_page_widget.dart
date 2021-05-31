import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendReportPageWidget extends StatefulWidget {
  SendReportPageWidget({
    Key key,
    this.startup,
  }) : super(key: key);

  final StartupsRecord startup;

  @override
  _SendReportPageWidgetState createState() => _SendReportPageWidgetState();
}

class _SendReportPageWidgetState extends State<SendReportPageWidget> {
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
        title: AutoSizeText(
          'Send Report',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextFormField(
                  controller: textController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Message',
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                    hintText: 'Bugs, errors or other concerns encountered.',
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
              FFButtonWidget(
                onPressed: () async {
                  final user = currentUserReference;
                  final video = '';
                  final text = textController.text;
                  final dateSent = getCurrentTimestamp;
                  final dateInvestigated = getCurrentTimestamp;
                  final status = 'Pending';
                  final startup = widget.startup.reference;

                  final reportsRecordData = {
                    ...createReportsRecordData(
                      user: user,
                      video: video,
                      text: text,
                      dateSent: dateSent,
                      dateInvestigated: dateInvestigated,
                      status: status,
                      startup: startup,
                    ),
                    'images': FieldValue.arrayUnion(['']),
                  };

                  await ReportsRecord.collection.doc().set(reportsRecordData);
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavBarPage(initialPage: 'HomePage'),
                    ),
                    (r) => false,
                  );
                },
                text: 'Send',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Color(0x00FFFFFF),
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.tertiaryColor,
                    width: 1,
                  ),
                  borderRadius: 120,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
